# Flux TD3.3d - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD3.3d

### Description

archiver / désarchiver un document

Cette fonctionnalité permet à l'utilisateur de modifier les attributs d'un document dans le DMP d'un patient.

* Archivage / désarchivage d'un document.

Elle fait suite à la fonctionnalité DMP_3.1 qui a permis de rechercher l'identifiant technique d'un document.

La cinématique générale est la suivante.

* Le LPS affiche les attributs du document sélectionné. Cf. RG_3310.
* L'utilisateur indique l'action qu'il souhaite effectuer. Cf. RG_3320.
* L'utilisateur confirme l'action demandée. Cf. RG_3330.
* Le LPS envoie une requête de mise à jour des attri

### Entrée et prérequis

L'INS du patient (EF_DMP11_01). Le statut « actif » du DMP du patient (EF_DMP12_01). L'autorisation d'accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le LPS implémente le profil Alimentation). L'identifiant du document dans le système DMP issu de DMP_3.1 : entry

### Sortie

Les attributs du document sont modifiées dans le DMP du patient.

### Équivalent FHIR

TD3.3d correspond à la transaction **[ITI-92 Restricted Update DocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_maj.html)** du profil PDSm. L'archivage et le désarchivage se traduisent par un changement de `DocumentReference.status` via une opération PATCH.

| | | | |
| :--- | :--- | :--- | :--- |
| Archiver | `Deprecated` | `DocumentReference.status` | `superseded` |
| Désarchiver | `Approved` | `DocumentReference.status` | `current` |

#### Flux TD3.3d-a — Requête (archivage)

```
PATCH [base]/DocumentReference/[entryUUID] HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

Corps de la requête (JSON Patch) :

```
[
  {
    "op": "replace",
    "path": "/status",
    "value": "superseded"
  }
]

```

#### Flux TD3.3d-a — Requête (désarchivage)

```
[
  {
    "op": "replace",
    "path": "/status",
    "value": "current"
  }
]

```

#### Flux TD3.3d-b — Réponse

| | |
| :--- | :--- |
| `200 OK` | Mise à jour effectuée — le corps de la réponse contient le`DocumentReference`mis à jour |
| `404 Not Found` | Document introuvable |
| `422 Unprocessable Entity` | PATCH invalide ou refusé par la règle métier |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

### Exemple FHIR

Archivage du document `example-td3-1a-cr-consultation` :

```
PATCH [base]/DocumentReference/example-td3-1a-cr-consultation HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

```
[
  {
    "op": "replace",
    "path": "/status",
    "value": "superseded"
  }
]

```

Réponse : `200 OK` — `DocumentReference` avec `status` = `superseded`.

