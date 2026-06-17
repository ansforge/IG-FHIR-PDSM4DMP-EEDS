
### Description

Alimenter le DMP d'un patient avec de nouveaux documents

Cette fonctionnalité permet d'alimenter le DMP d'un patient avec un ou plusieurs nouveaux documents :

- décrits sous la forme de documents CDA et de métadonnées XDS,
- et transmis au système DMP sous la forme d'un lot de soumission XDS signé (XAdES).
La cinématique générale est la suivante.
Le professionnel constitue le ou les document(s) dans le LPS . Cf. §3.4.1.1.1
Le LPS :
- construit le ou les document(s)
  - construit le document au format CDA Cf. §3.4.1.1.2
  - alimente les métadonnées XDS Cf. §3.4.1.1.3
- réalise la signature du ou des document(s) (non obligatoire) Cf. §3.4.1.1.4
- constitue un lot de soumission XDS et signe ce lot (XAdES) Cf. §3.4.1.1.5
- soumet le lot de documents au système DMP Cf. §3.4.1.1.6

### Entrée et prérequis

L'INS du patient
Le statut « actif » du DMP du patient (EF_DMP12_01).
Lot de soumission

### Sortie

Un DMP alimenté avec un ou plusieurs nouveaux documents.

### Equivalent FHIR

Cette transaction peut être réalisée de deux façons selon le contexte d'implémentation :

| Approche | Transaction PDSm | Cas d'usage |
|----------|-----------------|-------------|
| Publication simplifiée | [ITI-105](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_ajout_simplifie.html) | Soumission d'un unique document, sans lot de soumission explicite |
| Lot de soumission complet | [ITI-65](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_ajout.html) | Soumission d'un ou plusieurs documents avec lot de soumission (SubmissionSet) et classeur optionnel |

#### Option A — ITI-105 : Publication simplifiée

##### Flux TD2 (ITI-105) — Requête

Le LPS envoie directement un `DocumentReference` conforme au profil [PDSm_SimplifiedPublish](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-simplified-publish.html). Le contenu du document est embarqué dans `content.attachment.data` (base64).

```
POST [base]/DocumentReference HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json
```

##### Flux TD2 (ITI-105) — Réponse

| Code HTTP | Signification |
|-----------|--------------|
| `201 Created` | `DocumentReference` créé ; le serveur retourne la ressource avec son `id` |
| `4xx` / `5xx` | Erreur — accompagnée d'une ressource `OperationOutcome` |

---

#### Option B — ITI-65 : Lot de soumission complet

##### Flux TD2 (ITI-65) — Requête

Le LPS envoie un `Bundle` de type `transaction` conforme au profil [PDSm_ComprehensiveProvideDocumentBundle](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-provide-document-bundle.html).

```
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json
```

Le Bundle contient :

| Ressource | Cardinalité | Profil | Rôle |
|-----------|-------------|--------|------|
| `List` (SubmissionSet) | 1..1 | [PDSm_SubmissionSetComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-submissionset-comprehensive.html) | Lot de soumission |
| `DocumentReference` | 1..* | [PDSm_ComprehensiveDocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html) | Métadonnées du document |
| `Binary` | 0..* | — | Contenu du document (CDA, PDF…) |
| `List` (Folder) | 0..* | [PDSm_FolderComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-folder-comprehensive.html) | Classeur (optionnel) |

Le `DocumentReference.content.attachment.url` référence la `Binary` du même Bundle via `urn:uuid:...`.

##### Flux TD2 (ITI-65) — Réponse

En cas de succès, le système DMP retourne un `Bundle` de type `transaction-response` :

| Code HTTP par entrée | Signification |
|-----------|--------------|
| `201 Created` | Ressource créée avec succès |
| `200 OK` | Ressource mise à jour avec succès |
| `4xx` / `5xx` | Erreur — accompagnée d'une ressource `OperationOutcome` |

### Exemple FHIR

#### Exemple A — ITI-105 : publication simplifiée d'un compte rendu de consultation

Requête : `POST [base]/DocumentReference`

[Voir l'exemple complet : DocumentReference ITI-105 publication simplifiée (TD2)](DocumentReference-example-td2-iti105-publication-simplifiee.html)

**Réponse attendue :** `201 Created` + `Location: DocumentReference/[id]` (corps : DocumentReference avec `id` serveur)

---

#### Exemple B — ITI-65 : lot de soumission complet

Requête : `POST [base]`

[Voir l'exemple complet : Bundle ITI-65 lot de soumission (TD2)](Bundle-example-td2-iti65-lot-soumission.html)

**Réponse attendue :**

| Entrée | Code HTTP | Location |
|--------|-----------|----------|
| `List` (SubmissionSet) | `201 Created` | `List/[id]` |
| `DocumentReference` | `201 Created` | `DocumentReference/[id]` |
| `Binary` | `201 Created` | `Binary/[id]` |
