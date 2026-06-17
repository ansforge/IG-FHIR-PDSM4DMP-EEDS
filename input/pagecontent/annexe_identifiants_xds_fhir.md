### Comparatif des identifiants XDS et FHIR

Dans le contexte DMP, les mêmes documents sont manipulés à travers deux modèles de métadonnées : le modèle XDS (utilisé par le CI-SIS et les spécifications DMP historiques) et le modèle FHIR/MHD (utilisé par PDSm). Cette page recense les identifiants de chaque modèle et leurs équivalents.

#### DocumentEntry / DocumentReference

| Identifiant XDS | Type | Description | Équivalent FHIR |
|-----------------|------|-------------|-----------------|
| `entryUUID` | UUID | Identifiant unique d'une **version** de la fiche dans le registre. Attribué par le registre DMP. Utilisé pour les opérations de mise à jour, de suppression et d'archivage. | `DocumentReference.id` |
| `logicalId` | Identifier | Identifiant **invariant** de la fiche, commun à toutes ses versions. | `DocumentReference.identifier` |
| `uniqueId` | OID / UUID | Identifiant unique du **document** attribué par le producteur (système LPS). | `DocumentReference.masterIdentifier` |
| `repositoryUniqueId` | OID | Identifiant du dépôt dans lequel est stocké le document. | Dérivé de `DocumentReference.content.attachment.url` |
| `patientID` | CX | Identifiant du patient dans le registre — INS (NIR ou NIA) dans le contexte DMP. | `DocumentReference.subject` → `Patient.identifier` |
| `sourcePatientID` | CX | Identifiant local du patient dans le système producteur (IPP ou INS). | `DocumentReference.context.sourcePatientInfo` → `Patient.identifier` (contenu) |
| `homeCommunityId` | OID | Identifiant de la communauté XCA. Non utilisé dans le périmètre de PDSm. | — |
| `version` | integer | Numéro de version de la fiche. | Non exposé directement en MHD |

> **Note :** Dans le contexte DMP, `uniqueId` correspond à l'identifiant que le LPS attribue au document au moment de sa création. C'est l'identifiant que le LPS connaît localement. L'`entryUUID`, en revanche, est attribué par le registre DMP lors de la soumission — le LPS doit l'obtenir via TD3.1a ou TD3.1b pour pouvoir ensuite modifier ou supprimer le document.

#### SubmissionSet / List (SubmissionSet PDSm)

| Identifiant XDS | Type | Description | Équivalent FHIR |
|-----------------|------|-------------|-----------------|
| `entryUUID` | UUID | Identifiant unique du lot de soumission dans le registre. | `List.id` |
| `uniqueId` | OID / UUID | Identifiant unique du lot attribué par le système source. | `List.identifier` |
| `sourceId` | OID | Identifiant du système source (OID de l'application). | Extension `ihe-sourceId` sur `List` |
| `patientId` | CX | Identifiant du patient. | `List.subject` → `Patient.identifier` |
| `sourcePatientId` | CX | Identifiant local du patient chez la source. | Extension `ihe-sourcePatientId` sur `List` |

#### Folder / List (Folder PDSm)

| Identifiant XDS | Type | Description | Équivalent FHIR |
|-----------------|------|-------------|-----------------|
| `entryUUID` | UUID | Identifiant unique du classeur dans le registre. | `List.id` |
| `uniqueId` | OID / UUID | Identifiant unique du classeur attribué par le producteur. | `List.identifier` |
| `patientId` | CX | Identifiant du patient. | `List.subject` → `Patient.identifier` |

#### Récapitulatif : entryUUID vs uniqueId dans le contexte DMP

Ces deux identifiants sont les plus fréquemment confondus. Le tableau ci-dessous résume leurs différences essentielles.

| | `entryUUID` | `uniqueId` |
|--|-------------|------------|
| **Attribué par** | Le registre DMP (à la soumission) | Le système producteur (le LPS) |
| **Connu par le LPS avant soumission ?** | Non | Oui |
| **Invariant entre les versions ?** | Non (change à chaque nouvelle version) | Oui (`masterIdentifier`) |
| **Équivalent FHIR** | `DocumentReference.id` | `DocumentReference.masterIdentifier` |
| **Utilisé pour** | Mise à jour, suppression, archivage (TD3.3x) | Identification logique du document |
| **Obtenu via** | TD3.1a (liste) ou TD3.1b (recherche par `uniqueId`) | Assigné par le LPS à la création |
