# Flux TD3.2 - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD3.2

### Description

consulter des documents dans le DMP d’un patient

Cette fonctionnalité permet à l’utilisateur de télécharger et visualiser le contenu d’un document du DMP d’un patient.

Elle fait suite à la fonctionnalité « lister les documents d’un DMP » (DMP_3.1a) qui a permis à l’utilisateur de rechercher des documents dans le DMP d’un patient.

La cinématique générale est la suivante.

* L’utilisateur a sélectionné un ou plusieurs document(s) à consulter parmi les résultats retournés dans la fonctionnalité DMP_3.1a.
* Le LPS envoie une requête de demande de document au système DMP (TD3.2) à partir du ou des identifiants de document sélectionné(s). Cf. RG_3210.
* Le système DMP retourne le(s) document(s) au LPS.
* Le LPS affiche le(s) document(s). Cf. RG_3220.

### Entrée et prérequis

L’INS du patient (EF_DMP11_01). Le statut « actif » du DMP du patient (EF_DMP12_01). L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide ». La liste des identifiants (uniqueId) des documents à consulter (issue de DMP_3.1a) (EF_DMP31_01).

### Sortie

Les documents affichés par le LPS.

### Equivalent FHIR

TD3.2 correspond à la transaction **[ITI-68 Retrieve Document](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_consultation.html)** du profil PDSm. Le LPS utilise l'URL présente dans `DocumentReference.content.attachment.url` (obtenue via TD3.1a) pour télécharger le contenu binaire du document.

#### Flux TD3.2-a — Requête

```
GET [DocumentReference.content.attachment.url] HTTP/1.1
Accept: [type-MIME-du-document]

```

Le type MIME à indiquer dans l'en-tête `Accept` correspond à `DocumentReference.content.attachment.contentType` (ex. `application/pdf`, `application/xml` pour CDA).

Il est également possible de demander la ressource `Binary` encapsulée dans une réponse FHIR :

```
GET [base]/Binary/[id] HTTP/1.1
Accept: application/fhir+json

```

#### Flux TD3.2-b — Réponse

| | |
| :--- | :--- |
| `200 OK` | Document retourné — corps de la réponse : contenu binaire du document (ou ressource`Binary`FHIR) |
| `404 Not Found` | Document introuvable |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

Lorsque le LPS demande le contenu brut (Accept = type MIME natif), le corps de la réponse est directement le fichier (PDF, XML CDA…) sans enveloppe FHIR. Lorsqu'il demande `application/fhir+json`, le serveur retourne une ressource `Binary` avec le contenu encodé en base64 dans `Binary.data`.

### Exemple FHIR

Le LPS a récupéré l'URL suivante depuis le `DocumentReference` retourné par TD3.1a :

```
DocumentReference.content.attachment.url = "urn:oid:1.2.250.1.213.1.4.8.99999.101"
DocumentReference.content.attachment.contentType = "application/pdf"

```

**Requête — téléchargement du contenu brut :**

```
GET [base]/Binary/1.2.250.1.213.1.4.8.99999.101 HTTP/1.1
Accept: application/pdf

```

**Réponse :**

```
HTTP/1.1 200 OK
Content-Type: application/pdf
Content-Length: 45678

%PDF-1.4 ...

```

**Requête alternative — ressource Binary FHIR :**

```
GET [base]/Binary/1.2.250.1.213.1.4.8.99999.101 HTTP/1.1
Accept: application/fhir+json

```

**Réponse :**

```
{
  "resourceType": "Binary",
  "id": "1.2.250.1.213.1.4.8.99999.101",
  "contentType": "application/pdf",
  "data": "JVBERi0xLjQg..."
}

```

