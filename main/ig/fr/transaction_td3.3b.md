# Flux TD3.3b - Visibilité patient - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD3.3b - Visibilité patient

### Description

rendre un document visible au patient ou à ses représentants légaux

Cette fonctionnalité permet à l'utilisateur de modifier les attributs d'un document dans le DMP d'un patient.

* Visibilité d'un document au patient,
* Visibilité d'un document aux représentants légaux d'un mineur (si la gestion des mineurs est activée), Elle fait suite à la fonctionnalité DMP_3.1 qui a permis de rechercher l'identifiant technique d'un document.

La cinématique générale est la suivante

* Le LPS affiche les attributs du document sélectionné. Cf. RG_3310.
* L'utilisateur indique l'action qu'il souhaite effectuer. Cf. RG_3320.
* L'utilisateur confirme l'action demandée. Cf. RG_3330.
* Le LPS envoie une requête de mise à jour des attri

### Entrée et prérequis

L'INS du patient (EF_DMP11_01). Le statut « actif » du DMP du patient (EF_DMP12_01). L'autorisation d'accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le LPS implémente le profil Alimentation). L'identifiant du document dans le système DMP issu de DMP_3.1 : entry

### Sortie

Les attributs du document sont modifiées dans le DMP du patient.

### Équivalent FHIR

TD3.3b correspond aux flux **[Flux 03 / Flux 04 — Mise à jour des métadonnées de la fiche](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_maj.html)** du profil PDSm. L'opération PATCH modifie le champ `DocumentReference.securityLabel` pour contrôler la visibilité du document côté patient.

Par défaut, un document soumis dans le DMP est visible au patient. Un professionnel peut décider de le rendre invisible temporairement (ex. en attendant une annonce), puis de le rendre à nouveau visible.

| | | |
| :--- | :--- | :--- |
| Rendre invisible au patient | `DocumentReference.securityLabel` | Code de confidentialité « non visible patient » (JDV_J08) |
| Rendre visible au patient | `DocumentReference.securityLabel` | `N`(Normal) —`http://terminology.hl7.org/CodeSystem/v3-Confidentiality` |

**Question ouverte** — L'utilisation de `DocumentReference.securityLabel` est-elle suffisante pour représenter la visibilité patient dans le contexte DMP ? Une analyse plus approfondie pourrait être nécessaire, notamment pour évaluer la pertinence d'un profilage de la ressource `Consent` (qui permet d'exprimer des politiques d'accès différenciées par catégorie d'acteur, dont le patient lui-même). Ce point est à trancher lors des travaux d'alignement avec les exigences DMP.

#### Flux TD3.3b — Requête (masquage patient)

Le PATCH s'effectue par l'identifiant métier du document (`uniqueId` XDS → `DocumentReference.identifier`) :

```
PATCH [base]/DocumentReference?identifier=[système]|[uniqueId] HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

Corps de la requête (JSON Patch) :

```
[
  {
    "op": "replace",
    "path": "/securityLabel/0",
    "value": {
      "coding": [
        {
          "system": "https://mos.esante.gouv.fr/NOS/TRE_A10-NiveauConfidentialite/FHIR/TRE-A10-NiveauConfidentialite",
          "code": "INVISIBLE_PATIENT",
          "display": "Non visible au patient"
        }
      ]
    }
  }
]

```

#### Flux TD3.3b — Requête (visibilité patient rétablie)

```
PATCH [base]/DocumentReference?identifier=[système]|[uniqueId] HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

```
[
  {
    "op": "replace",
    "path": "/securityLabel/0",
    "value": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
          "code": "N",
          "display": "normal"
        }
      ]
    }
  }
]

```

#### Flux TD3.3b — Réponse

| | |
| :--- | :--- |
| `200 OK` | Mise à jour effectuée — le corps de la réponse contient le`DocumentReference`mis à jour |
| `404 Not Found` | Document introuvable |
| `422 Unprocessable Entity` | PATCH invalide ou refusé par la règle métier |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

### Exemple FHIR

Marquage de l'ordonnance (uniqueId `urn:oid:1.2.250.1.213.1.4.8.99999.102`) comme non visible au patient :

```
PATCH [base]/DocumentReference?identifier=urn:ietf:rfc:3986|urn:oid:1.2.250.1.213.1.4.8.99999.102 HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

```
[
  {
    "op": "replace",
    "path": "/securityLabel/0",
    "value": {
      "coding": [
        {
          "system": "https://mos.esante.gouv.fr/NOS/TRE_A10-NiveauConfidentialite/FHIR/TRE-A10-NiveauConfidentialite",
          "code": "INVISIBLE_PATIENT",
          "display": "Non visible au patient"
        }
      ]
    }
  }
]

```

Réponse : `200 OK` — `DocumentReference` avec `securityLabel` mis à jour.

