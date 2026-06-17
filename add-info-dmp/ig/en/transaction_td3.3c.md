# Flux TD3.3c - Supprimer un document - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD3.3c - Supprimer un document

 
There is no translation page available for the current page, so it has been rendered in the default language 

### Description

supprimer un document (

Cette fonctionnalité permet à l'utilisateur de supprimer un document dans le DMP d'unpatient.

La cinématique générale est la suivante :

* L'utilisateur indique qu'il souhaite supprimer le document sélectionné. Cf. RG_3410.
* L'utilisateur confirme l'action demandée. Cf. RG_3420.
* Le LPS envoie une requête de mise à jour des attributs d'un document au système DMP (TD3.3c). Cf. RG_3430.

NB1 : si le LPS implémente le profil Alimentation, il n'est pas nécessaire d'avoir une autorisation d'accès pour supprimer des documents dans le DMP d'un patient. NB2 : pour information, seul l'auteur du document peut supprimer le document (contrôle effectué par le système DMP, cf. [DMP-MDRF]).

### Entrée et prérequis

L'INS du patient (EF_DMP11_01). Le statut « actif » du DMP du patient (EF_DMP12_01). L'autorisation d'accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le LPS implémente le profil Alimentation). L'identifiant du document dans le système DMP issu de DMP_3.1 (EF_DMP31_02).

### Sortie

Le document est supprimé.

### Équivalent FHIR

TD3.3c correspond aux flux **[Flux 03 / Flux 04 — Mise à jour des métadonnées de la fiche](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_maj.html)** du profil PDSm. La suppression logique est réalisée en changeant le statut du `DocumentReference` via une opération PATCH.

En FHIR, la suppression d'un document DMP se traduit par la mise à jour de `DocumentReference.status` à `entered-in-error`. La ressource reste présente dans le système mais n'est plus accessible dans les recherches courantes.

| | | |
| :--- | :--- | :--- |
| Supprimer | `DocumentReference.status` | `entered-in-error` |

#### Flux TD3.3c-a — Requête

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
    "path": "/status",
    "value": "entered-in-error"
  }
]

```

#### Flux TD3.3c-b — Réponse

| | |
| :--- | :--- |
| `200 OK` | Mise à jour effectuée — le corps de la réponse contient le`DocumentReference`mis à jour |
| `403 Forbidden` | Refus — l'appelant n'est pas l'auteur du document |
| `404 Not Found` | Document introuvable |
| `422 Unprocessable Entity` | PATCH invalide ou refusé par la règle métier |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

### Exemple FHIR

Suppression du compte rendu de consultation (uniqueId `urn:oid:1.2.250.1.213.1.4.8.99999.101`) :

```
PATCH [base]/DocumentReference?identifier=urn:ietf:rfc:3986|urn:oid:1.2.250.1.213.1.4.8.99999.101 HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

```
[
  {
    "op": "replace",
    "path": "/status",
    "value": "entered-in-error"
  }
]

```

Réponse : `200 OK` — `DocumentReference` avec `status` = `entered-in-error`.

