
### Description 

Remplacer un document existant dans le DMP d'un patient

Cette fonctionnalité permet d'alimenter le DMP d'un patient avec une nouvelle version d'un document.
Soient X le document initial (uniqueId par exemple 1.2.3.X) et Y la nouvelle version du document (uniqueId par exemple 1.2.3.Y).

Pour remplacer un document initial X dans le DMP du patient par une nouvelle version Y, la cinématique est la suivante.

-  L'utilisateur modifie le document X dans le LPS (corps et/ou métadonnées) pour créer le document Y.
-  Le LPS a récupéré les identifiants du document X (entryUUID et uniqueId, cf. DMP_3.1).
- Le LPS construit le document Y au format CDA et alimente les métadonnées XDS.
  -  CDA : relatedDocument = uniqueId du document X.
  -  XDS : association RPLC sur l'entryUUID du document X.
- Le LPS constitue un lot de soumission XDS et réalise la signature XAdES du lot.
- Le LPS envoie la requête au système DMP

### Entrée et prérequis

L'INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
Les identifiants entryUUID et uniqueId du document à remplacer obtenus par la fonctionnalité DMP_3.1 (EF_DMP31_01 et EF_DMP31_02).
L'identifiant de la nouvelle version du document (uniqueId par exemple 1.2.3.Y) (EF_DMP31_01).
Lot de soumission

### Sortie

Le document X est remplacé par le document Y dans le DMP du patient.

### Equivalent FHIR

Cette transaction correspond à la transaction [ITI-65](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_ajout.html) de PDSm dans son cas de remplacement de document.

La correspondance avec XDS est la suivante :

| Concept XDS | Élément FHIR |
|-------------|-------------|
| `relatedDocument = uniqueId du document X` (CDA) | `DocumentReference(Y).relatesTo.target` → référence vers `DocumentReference(X)` |
| Association `RPLC` sur l'`entryUUID` du document X | `DocumentReference(Y).relatesTo.code = "replaces"` |
| Mise à jour du statut du document X | `PATCH DocumentReference/X` avec `Parameters` FHIRPath : `replace DocumentReference.status → superseded` (slice `UpdateDocumentRefs`) |

#### Flux TD2.1 — Requête

```
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json
```

Le Bundle de type `transaction` contient :

| Ressource | Cardinalité | Profil | Rôle |
|-----------|-------------|--------|------|
| `List` (SubmissionSet) | 1..1 | [PDSm_SubmissionSetComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-submissionset-comprehensive.html) | Lot de soumission |
| `DocumentReference` Y | 1..1 | [PDSm_ComprehensiveDocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html) | Nouvelle version du document, avec `relatesTo` |
| `Parameters` (patch) | 1..1 | — | Mise à jour du statut du document X à `superseded` via PATCH FHIRPath (slice `UpdateDocumentRefs`) |
| `Binary` | 0..1 | — | Contenu du document Y |

Points clés sur le `DocumentReference` Y :
- `relatesTo.code = "replaces"`
- `relatesTo.target` = référence vers `DocumentReference` X (par URL littérale ou identifiant)
- `status = "current"`

Le document X est mis à jour via une opération `PATCH` FHIRPath (slice `UpdateDocumentRefs`) : seul le champ `status` est modifié à `superseded`. La ressource transmise est un `Parameters` contenant les opérations de patch, et non un DocumentReference complet.

#### Flux TD2.1 — Réponse

En cas de succès, le système DMP retourne un `Bundle` de type `transaction-response` :

| Code HTTP par entrée | Signification |
|----------------------|--------------|
| `201 Created` | Nouvelle ressource créée (DocumentReference Y, Binary, List) |
| `200 OK` | PATCH appliqué (DocumentReference X → superseded) |
| `4xx` / `5xx` | Erreur — accompagnée d'une ressource `OperationOutcome` |

### Exemple FHIR

Remplacement du `DocumentReference` avec l'id `doc-x-id` par un nouveau document (`POST [base]`).

[Voir l'exemple complet : Bundle ITI-65 de remplacement (TD2.1)](Bundle-example-td2-1-remplacement.html)

**Réponse attendue :**

| Entrée | Code HTTP | Location |
|--------|-----------|----------|
| `List` (SubmissionSet) | `201 Created` | `List/[id]` |
| `DocumentReference` Y | `201 Created` | `DocumentReference/[id]` |
| `Parameters` (PATCH X) | `200 OK` | — |
| `Binary` | `201 Created` | `Binary/[id]` |
