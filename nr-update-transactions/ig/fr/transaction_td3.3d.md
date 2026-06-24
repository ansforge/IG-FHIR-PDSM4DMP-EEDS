# Flux TD3.3d - Archiver / désarchiver un document - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD3.3d - Archiver / désarchiver un document

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

TD3.3d correspond aux flux **[Flux 03 / Flux 04 — Mise à jour des métadonnées de la fiche](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_maj.html)** du profil PDSm. L'archivage et le désarchivage se traduisent par un changement de l'extension `PDSm_isArchived` via une opération PATCH — sans modification de `DocumentReference.status`.

L'extension [`PDSm_isArchived`](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-ext-is-archived.html) (type `boolean`) indique si le document est dans un état archivé.

| | | |
| :--- | :--- | :--- |
| Archiver | `Deprecated` | `true` |
| Désarchiver | `Approved` | `false` |

#### Flux TD3.3d — Requête (archivage)

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
    "path": "/extension[url:'https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived']/valueBoolean",
    "value": true
  }
]

```

#### Flux TD3.3d — Requête (désarchivage)

```
PATCH [base]/DocumentReference?identifier=[système]|[uniqueId] HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

```
[
  {
    "op": "replace",
    "path": "/extension[url:'https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived']/valueBoolean",
    "value": false
  }
]

```

#### Flux TD3.3d — Réponse

| | |
| :--- | :--- |
| `200 OK` | Mise à jour effectuée — le corps de la réponse contient le`DocumentReference`mis à jour |
| `404 Not Found` | Document introuvable |
| `422 Unprocessable Entity` | PATCH invalide ou refusé par la règle métier |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

### Exemple FHIR

Archivage du compte rendu de consultation (uniqueId `urn:oid:1.2.250.1.213.1.4.8.99999.101`) :

```
PATCH [base]/DocumentReference?identifier=urn:ietf:rfc:3986|urn:oid:1.2.250.1.213.1.4.8.99999.101 HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json

```

```
[
  {
    "op": "replace",
    "path": "/extension[url:'https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-ext-is-archived']/valueBoolean",
    "value": true
  }
]

```

Réponse : `200 OK` — `DocumentReference` avec extension `isArchived` = `true`.

