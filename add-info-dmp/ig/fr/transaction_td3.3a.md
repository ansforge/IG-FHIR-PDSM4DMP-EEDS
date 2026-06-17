# Flux TD3.3a - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD3.3a

### Description

masquer / démasquer un document aux professionnels

Cette fonctionnalité permet à l'utilisateur de modifier les attributs d'un document dans le DMP d'un patient.

* Masquage / démasquage d'un document aux professionnels, Elle fait suite à la fonctionnalité DMP_3.1 qui a permis de rechercher l'identifiant technique d'un document.

La cinématique générale est la suivante.

* Le LPS affiche les attributs du document sélectionné. Cf. RG_3310.
* L'utilisateur indique l'action qu'il souhaite effectuer. Cf. RG_3320.
* L'utilisateur confirme l'action demandée. Cf. RG_3330.
* Le LPS envoie une requête de mise à jour des attributs d'un document au système DMP (TD3.3a). Cf. RG_3340.
* Le système DMP met à jour les attributs du document. Cf. RG_3350.

### Entrée et prérequis

L'INS du patient (EF_DMP11_01). Le statut « actif » du DMP du patient (EF_DMP12_01). L'autorisation d'accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le LPS implémente le profil Alimentation). L'identifiant du document dans le système DMP issu de DMP_3.1 : entry

### Sortie

Les attributs du document sont modifiés dans le DMP du patient.

### Équivalent FHIR

TD3.3a correspond à la transaction **[ITI-92 Restricted Update DocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_maj.html)** du profil PDSm. L'opération PATCH modifie le champ `DocumentReference.securityLabel` sans remplacer l'ensemble de la ressource.

L'`entryUUID` XDS correspond à l'`id` logique de la ressource `DocumentReference` en FHIR (cf. [annexe identifiants](annexe_identifiants_xds_fhir.md)).

| | | |
| :--- | :--- | :--- |
| Masquer aux professionnels | `DocumentReference.securityLabel` | Code de confidentialité « masqué » (JDV_J08) |
| Démasquer | `DocumentReference.securityLabel` | `N`(Normal) —`http://terminology.hl7.org/CodeSystem/v3-Confidentiality` |

#### Flux TD3.3a-a — Requête (masquage)

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
    "path": "/securityLabel/0",
    "value": {
      "coding": [
        {
          "system": "https://mos.esante.gouv.fr/NOS/TRE_A10-NiveauConfidentialite/FHIR/TRE-A10-NiveauConfidentialite",
          "code": "INVISIBLE_MASQUE_PATIENT",
          "display": "Masqué aux professionnels"
        }
      ]
    }
  }
]

```

#### Flux TD3.3a-a — Requête (démasquage)

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

#### Flux TD3.3a-b — Réponse

| | |
| :--- | :--- |
| `200 OK` | Mise à jour effectuée — le corps de la réponse contient le`DocumentReference`mis à jour |
| `404 Not Found` | Document introuvable |
| `422 Unprocessable Entity` | PATCH invalide ou refusé par la règle métier |
| `4xx`/`5xx` | Erreur — accompagnée d'une ressource`OperationOutcome` |

### Exemple FHIR

Masquage du compte rendu de consultation `example-td3-1a-cr-consultation` :

```
PATCH [base]/DocumentReference/example-td3-1a-cr-consultation HTTP/1.1
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
          "code": "INVISIBLE_MASQUE_PATIENT",
          "display": "Masqué aux professionnels"
        }
      ]
    }
  }
]

```

Réponse : `200 OK` — `DocumentReference` avec `securityLabel` mis à jour.

