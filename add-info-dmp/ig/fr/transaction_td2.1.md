# Flux TD2.1 - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD2.1

### Description

Remplacer un document existant dans le DMP d'un patient

Cette fonctionnalité permet d'alimenter le DMP d'un patient avec une nouvelle version d'un document. Soient X le document initial (uniqueId par exemple 1.2.3.X) et Y la nouvelle version du document (uniqueId par exemple 1.2.3.Y).

Pour remplacer un document initial X dans le DMP du patient par une nouvelle version Y, la cinématique est la suivante.

* L'utilisateur modifie le document X dans le LPS (corps et/ou métadonnées) pour créer le document Y.
* Le LPS a récupéré les identifiants du document X (entryUUID et uniqueId, cf. DMP_3.1).
* Le LPS construit le document Y au format CDA et alimente les métadonnées XDS. 
* CDA : relatedDocument = uniqueId du document X.
* XDS : association RPLC sur l'entryUUID du document X.
 
* Le LPS constitue un lot de soumission XDS et réalise la signature XAdES du lot.
* Le LPS envoie la requête au système DMP

### Entrée et prérequis

L'INS du patient (EF_DMP11_01). Le statut « actif » du DMP du patient (EF_DMP12_01). Les identifiants entryUUID et uniqueId du document à remplacer obtenus par la fonctionnalité DMP_3.1 (EF_DMP31_01 et EF_DMP31_02). L'identifiant de la nouvelle version du document (uniqueId par exemple 1.2.3.Y) (EF_DMP31_01). Lot de soumission

### Sortie

Le document X est remplacé par le document Y dans le DMP du patient.

### Equivalent FHIR

Cette transaction correspond à la transaction [ITI-65](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_ajout.html) de PDSm dans son cas de remplacement de document.

La correspondance avec XDS est la suivante :

| | |
| :--- | :--- |
| `relatedDocument = uniqueId du document X`(CDA) | `DocumentReference(Y).relatesTo.target`→ référence vers`DocumentReference(X)` |
| Association`RPLC`sur l'`entryUUID`du document X | `DocumentReference(Y).relatesTo.code = "replaces"` |
| Mise à jour du statut du document X | `DocumentReference(X).status = "superseded"`(via slice`UpdateDocumentRefs`) |

#### Flux TD2.1-a — Requête

```
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json

```

Le Bundle de type `transaction` contient :

| | | | |
| :--- | :--- | :--- | :--- |
| `List`(SubmissionSet) | 1..1 | [PDSm_SubmissionSetComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-submissionset-comprehensive.html) | Lot de soumission |
| `DocumentReference`Y | 1..1 | [PDSm_ComprehensiveDocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html) | Nouvelle version du document, avec`relatesTo` |
| `DocumentReference`X | 1..1 | — | Document remplacé, avec`status = "superseded"`(slice`UpdateDocumentRefs`) |
| `Binary` | 0..1 | — | Contenu du document Y |

Points clés sur le `DocumentReference` Y :

* `relatesTo.code = "replaces"`
* `relatesTo.target` = référence vers `DocumentReference` X (par URL littérale ou identifiant)
* `status = "current"`

Le `DocumentReference` X est inclus dans la slice `UpdateDocumentRefs` du Bundle uniquement pour mettre à jour son statut à `superseded`. Il ne doit pas contenir d'autres modifications.

#### Flux TD2.1-b — Réponse

En cas de succès, le système DMP retourne un `Bundle` de type `transaction-response` :

| | |
| :--- | :--- |
| `201 Created` | Nouvelle ressource créée (DocumentReference Y, Binary, List) |
| `200 OK` | Ressource mise à jour (DocumentReference X → superseded) |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

### Exemple FHIR

Remplacement du `DocumentReference` avec l'id `doc-x-id` par un nouveau document.

**Requête :**

```
POST [base] HTTP/1.1
Content-Type: application/fhir+json

```

**Corps :**

```
{
  "resourceType": "Bundle",
  "meta": {
    "profile": [
      "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"
    ]
  },
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:bbbbbbbb-0000-0000-0000-000000000001",
      "resource": {
        "resourceType": "List",
        "meta": {
          "profile": [
            "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"
          ]
        },
        "status": "current",
        "mode": "working",
        "code": {
          "coding": [
            {
              "system": "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes",
              "code": "submissionset"
            }
          ]
        },
        "subject": {
          "reference": "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
        },
        "date": "2026-06-12T11:00:00+02:00",
        "entry": [
          {
            "item": { "reference": "urn:uuid:bbbbbbbb-0000-0000-0000-000000000002" }
          }
        ]
      },
      "request": { "method": "POST", "url": "List" }
    },
    {
      "fullUrl": "urn:uuid:bbbbbbbb-0000-0000-0000-000000000002",
      "resource": {
        "resourceType": "DocumentReference",
        "meta": {
          "profile": [
            "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"
          ]
        },
        "status": "current",
        "relatesTo": [
          {
            "code": "replaces",
            "target": { "reference": "DocumentReference/doc-x-id" }
          }
        ],
        "type": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "11488-4",
              "display": "Compte rendu de consultation"
            }
          ]
        },
        "subject": {
          "reference": "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
        },
        "date": "2026-06-12T11:00:00+02:00",
        "content": [
          {
            "attachment": {
              "contentType": "application/xml",
              "url": "urn:uuid:bbbbbbbb-0000-0000-0000-000000000003",
              "title": "Compte rendu de consultation (v2)"
            }
          }
        ]
      },
      "request": { "method": "POST", "url": "DocumentReference" }
    },
    {
      "fullUrl": "DocumentReference/doc-x-id",
      "resource": {
        "resourceType": "DocumentReference",
        "id": "doc-x-id",
        "status": "superseded"
      },
      "request": { "method": "PUT", "url": "DocumentReference/doc-x-id" }
    },
    {
      "fullUrl": "urn:uuid:bbbbbbbb-0000-0000-0000-000000000003",
      "resource": {
        "resourceType": "Binary",
        "contentType": "application/xml",
        "data": "PD94bWwgdmVyc2lvbj0iMS4wIj8+..."
      },
      "request": { "method": "POST", "url": "Binary" }
    }
  ]
}

```

**Réponse :**

```
{
  "resourceType": "Bundle",
  "type": "transaction-response",
  "entry": [
    { "response": { "status": "201 Created", "location": "List/2" } },
    { "response": { "status": "201 Created", "location": "DocumentReference/2" } },
    { "response": { "status": "200 OK",     "location": "DocumentReference/doc-x-id" } },
    { "response": { "status": "201 Created", "location": "Binary/2" } }
  ]
}

```

