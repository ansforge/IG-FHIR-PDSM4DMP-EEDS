
### Description 

Cette fonctionnalité permet de lister les documents du DMP d’un patient (cf. RG_3010) en indiquant des critères de recherche.

La cinématique générale est la suivante.

- L’utilisateur saisit un ou plusieurs critères de recherche dans le LPS. Cf. RG_3020.
- Le LPS appelle la transaction TD3.1. Cf. RG_3030.
- Le système DMP retourne les résultats au LPS.
- Le LPS affiche les résultats. Cf. RG_3040.
- L’utilisateur sélectionne un ou plusieurs document(s) et le LPS acquiert l’identifiant
unique des document(s) sélectionnés. Cf. RG_3050.
- Le LPS détermine les actions possibles sur les documents sélectionnés. Cf. RG_3060.
  - consulter un document (DMP_3.2),
  -  modifier les attributs d’un document (DMP_3.3),
  - ou remplacer un document (DMP_2.1b/2.2b).

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide ».

### Sortie

La liste des documents consultables par l’utilisateur.

### Equivalent FHIR

TD3.1a correspond à la transaction **[ITI-67 Find Document References](https://interop.esante.gouv.fr/ig/fhir/pdsm/st_recherche.html)** du profil PDSm. Elle permet au LPS de rechercher les fiches (`DocumentReference`) du DMP d'un patient à partir de son INS et de critères optionnels.

#### Flux TD3.1a-a — Requête

Le LPS effectue une recherche sur la ressource `DocumentReference` en utilisant le paramètre `patient.identifier` valorisé avec l'INS du patient.

```
GET [base]/DocumentReference?patient.identifier=[systeme-INS]|[valeur-INS]&status=current HTTP/1.1
Accept: application/fhir+json
```

**Paramètres de recherche :**

| Paramètre FHIR | Type | Cardinalité | Métadonnée XDS | Description |
|----------------|------|-------------|----------------|-------------|
| `patient.identifier` | token | 1..1 | `patientID` | INS du patient (`[système]\|[valeur]`) |
| `status` | token | 0..1 | `availabilityStatus` | `current` (approuvé) ou `superseded` (déprécié) |
| `type` | token | 0..* | `type` | Type du document (JDV_J07-XdsTypeCode-CISIS) |
| `category` | token | 0..* | `class` | Classe du document (JDV_J06-XdsClassCode-CISIS) |
| `date` | date | 0..2 | `creationTime` | Date de création du document |
| `period` | date | 0..2 | `serviceStartTime` / `serviceEndTime` | Période de l'acte de référence |
| `facility` | token | 0..* | `healthcareFacilityTypeCode` | Secteur d'activité |
| `setting` | token | 0..* | `practiceSetting` | Contexte de l'acte |
| `format` | token | 0..* | `format` | Format du document |
| `security-label` | token | 0..* | `confidentiality` | Niveau de confidentialité |
| `event` | token | 0..* | `eventCodeList` | Acte, modalité ou région anatomique |
| `identifier` | token | 0..1 | `uniqueId` / `entryUUID` | Identifiant unique du document |
| `related` | reference | 0..* | `referenceIdList` | Identifiants d'objets associés |

> **Note :** Le statut du DMP et l'autorisation d'accès ne sont pas des paramètres de la requête ITI-67. Ces prérequis sont vérifiés en amont (via TD02) et gérés par la couche d'autorisation du système DMP, en dehors du périmètre de cette transaction.

#### Flux TD3.1a-b — Réponse

En cas de succès, le système DMP retourne un code HTTP `200 OK` avec un `Bundle` de type `searchset` contenant zéro ou plusieurs ressources `DocumentReference`.

| Code HTTP | Signification |
|-----------|--------------|
| `200 OK` | Recherche exécutée ; le `Bundle` peut contenir 0 ou N entrées |
| `4xx` / `5xx` | Erreur — accompagnée d'une ressource `OperationOutcome` |

Chaque `DocumentReference` retourné est conforme au profil [PDSm_ComprehensiveDocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html).

**Mapping des données retournées :**

| Métadonnée XDS | Élément FHIR |
|----------------|-------------|
| `entryUUID` | `DocumentReference.id` |
| `logicalId` / `uniqueId` | `DocumentReference.identifier` |
| `availabilityStatus` | `DocumentReference.status` (`current` / `superseded`) |
| `type` | `DocumentReference.type` |
| `class` | `DocumentReference.category` |
| `patientID` / `sourcePatientID` | `DocumentReference.subject` |
| `creationTime` | `DocumentReference.date` |
| `author` | `DocumentReference.author` |
| `legalAuthenticator` | `DocumentReference.authenticator` |
| `comments` | `DocumentReference.description` |
| `confidentiality` | `DocumentReference.securityLabel` |
| `mimeType` | `DocumentReference.content.attachment.contentType` |
| `languageCode` | `DocumentReference.content.attachment.language` |
| `title` | `DocumentReference.content.attachment.title` |
| `hash` | `DocumentReference.content.attachment.hash` |
| `size` | `DocumentReference.content.attachment.size` |
| `repositoryUniqueId` / `URI` | `DocumentReference.content.attachment.url` |
| `format` | `DocumentReference.content.format` |
| `healthcareFacilityTypeCode` | `DocumentReference.context.facilityType` |
| `practiceSetting` | `DocumentReference.context.practiceSetting` |
| `serviceStartTime` / `serviceEndTime` | `DocumentReference.context.period` |
| `sourcePatientInfo` | `DocumentReference.context.sourcePatientInfo` |
| `eventCodeList` | `DocumentReference.context.event` |
| `referenceIdList` | `DocumentReference.context.related` |

### Exemple FHIR

**Requête — lister les documents actifs d'un patient :**

```
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345&status=current HTTP/1.1
Accept: application/fhir+json
```

**Réponse :** `200 OK` — `Bundle` de type `searchset` contenant les `DocumentReference` correspondants.

Les exemples ci-dessous illustrent les trois cas de figure pour `content.attachment.url` :

| Exemple | Format du document | Valeur de `attachment.url` |
|---------|-------------------|---------------------------|
| [Compte rendu de consultation](DocumentReference-example-td3-1a-cr-consultation.html) | PDF (`application/pdf`) | URL absolue vers une ressource `Binary` |
| [Ordonnance médicale](DocumentReference-example-td3-1a-ordonnance.html) | PDF (`application/pdf`) | URL relative vers une ressource `Binary` |
| [Document FHIR (Bundle)](DocumentReference-example-td3-1a-fhir-document.html) | FHIR JSON (`application/fhir+json`) | URL relative vers une ressource `Bundle` |