
### Description 

rendre un document visible au patient ou à ses représentants légaux

Cette fonctionnalité permet à l'utilisateur de modifier les attributs d'un document dans le DMP d'un patient.

- Visibilité d'un document au patient,
- Visibilité d'un document aux représentants légaux d'un mineur (si la gestion des mineurs
est activée),
Elle fait suite à la fonctionnalité DMP_3.1 qui a permis de rechercher l'identifiant technique d'un document.

La cinématique générale est la suivante

- Le LPS affiche les attributs du document sélectionné. Cf. RG_3310.
- L'utilisateur indique l'action qu'il souhaite effectuer. Cf. RG_3320.
- L'utilisateur confirme l'action demandée. Cf. RG_3330.
- Le LPS envoie une requête de mise à jour des attri

### Entrée et prérequis

L'INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
L'autorisation d'accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le
LPS implémente le profil Alimentation).
L'identifiant du document dans le système DMP issu de DMP_3.1 : entry

### Sortie

Les attributs du document sont modifiées dans le DMP du patient.

### Équivalent FHIR

TD3.3b correspond à la transaction **[ITI-92 Restricted Update DocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_maj.html)** du profil PDSm. L'opération PATCH modifie le champ `DocumentReference.securityLabel` pour contrôler la visibilité du document côté patient.

Par défaut, un document soumis dans le DMP est visible au patient. Un professionnel peut décider de le rendre invisible temporairement (ex. en attendant une annonce), puis de le rendre à nouveau visible.

| Action DMP | Élément FHIR modifié | Valeur |
|-----------|---------------------|--------|
| Rendre invisible au patient | `DocumentReference.securityLabel` | Code de confidentialité « non visible patient » (JDV_J08) |
| Rendre visible au patient | `DocumentReference.securityLabel` | `N` (Normal) — `http://terminology.hl7.org/CodeSystem/v3-Confidentiality` |

#### Flux TD3.3b-a — Requête (masquage patient)

```
PATCH [base]/DocumentReference/[entryUUID] HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json
```

Corps de la requête (JSON Patch) :

```json
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

#### Flux TD3.3b-a — Requête (visibilité patient rétablie)

```json
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

#### Flux TD3.3b-b — Réponse

| Code HTTP | Signification |
|-----------|--------------|
| `200 OK` | Mise à jour effectuée — le corps de la réponse contient le `DocumentReference` mis à jour |
| `404 Not Found` | Document introuvable |
| `422 Unprocessable Entity` | PATCH invalide ou refusé par la règle métier |
| `4xx` / `5xx` | Erreur — accompagnée d'une ressource `OperationOutcome` |

### Exemple FHIR

Marquage du document `example-td3-1a-ordonnance` comme non visible au patient :

```
PATCH [base]/DocumentReference/example-td3-1a-ordonnance HTTP/1.1
Content-Type: application/json-patch+json
Accept: application/fhir+json
```

```json
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
