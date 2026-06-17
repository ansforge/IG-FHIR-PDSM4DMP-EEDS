
### Description 
Rechercher l’identifiant technique d’un document

Cette fonctionnalité permet, aux LPS qui n’implémentent pas DMP_3.1a, de rechercher l’identifiant technique d’un document (dans le système DMP) à partir de l’identifiant local au LPS de ce document.
Le LPS peut ensuite supprimer (DMP_3.3c), archiver (DMP_3.3d) ou remplacer un document dans le DMP du patient (DMP_2.1b/2.2b).

Cette fonctionnalité est mise en œuvre dans les LPS ne donnant pas accès à la consultation des documents (DMP_3.2). À ce jour, ce cas correspond aux situations suivantes :

- en authentification indirecte (hors mode AIR),
- en authentification directe par CPE,
- en authentification directe sans le profil « Consultation ».

La cinématique est décrite dans la règle RG_3110.

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le DMP du patient est au statut actif (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le LPS implémente le profil Alimentation).
(Les données sont acquises pendant le déroulement de la fonctionnalité.)

### Sortie

L’identifiant unique du document dans le système DMP (entryUUID).

### Equivalent FHIR

TD3.1b correspond à la transaction **[ITI-67 Find Document References](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_recherche.html)** du profil PDSm, utilisée ici avec le paramètre `identifier` pour retrouver un document précis à partir de son identifiant local LPS (`uniqueId`).

#### Flux TD3.1b-a — Requête

```
GET [base]/DocumentReference?patient.identifier=[systeme-INS]|[valeur-INS]&identifier=[systeme-uniqueId]|[valeur-uniqueId] HTTP/1.1
Accept: application/fhir+json
```

**Paramètres de la requête :**

| Paramètre FHIR | Type | Cardinalité | Métadonnée XDS | Description |
|----------------|------|-------------|----------------|-------------|
| `patient.identifier` | token | 1..1 | `patientID` | INS du patient (`[système]\|[valeur]`) |
| `identifier` | token | 1..1 | `uniqueId` | Identifiant local du document dans le LPS |

> **Note :** Le statut du DMP et l’autorisation d’accès sont des prérequis vérifiés en amont (via TD02) et gérés par la couche d’autorisation du système DMP, en dehors du périmètre de cette transaction.

#### Flux TD3.1b-b — Réponse

En cas de succès, le système DMP retourne un code HTTP `200 OK` avec un `Bundle` de type `searchset`.

- Si le `Bundle` contient **0 entrée** : aucun document ne correspond à cet identifiant pour ce patient.
- Si le `Bundle` contient **1 entrée** : la ressource `DocumentReference` retournée contient l’`entryUUID` recherché.

**Mapping de la donnée de sortie :**

| Donnée DMP | Élément FHIR |
|------------|-------------|
| `entryUUID` (identifiant technique DMP) | `DocumentReference.id` |
| `uniqueId` (identifiant LPS) | `DocumentReference.identifier` |

### Exemple FHIR

**Requête — rechercher par identifiant local LPS :**

```
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345&identifier=urn:ietf:rfc:3986|urn:oid:1.2.250.1.213.1.4.8.99999.0 HTTP/1.1
Accept: application/fhir+json
```

**Réponse :** `200 OK` — `Bundle` de type `searchset` contenant le `DocumentReference` trouvé. L’`entryUUID` est lu dans `DocumentReference.id`.

[Voir l’exemple : DocumentReference - Recherche par identifiant (TD3.1b)](DocumentReference-doc-x-id.html)