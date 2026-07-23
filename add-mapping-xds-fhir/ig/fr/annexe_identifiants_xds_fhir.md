# Comparatif des identifiants XDS / FHIR - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Comparatif des identifiants XDS / FHIR

Dans le contexte DMP, les mêmes documents sont manipulés à travers deux modèles de métadonnées : le modèle XDS (utilisé par le CI-SIS et les spécifications DMP historiques) et le modèle FHIR/MHD (utilisé par PDSm). Cette page recense les identifiants de chaque modèle et leurs équivalents.

### DocumentEntry / DocumentReference

| | | | |
| :--- | :--- | :--- | :--- |
| `entryUUID` | UUID | Identifiant technique affecté par le SI DMP à une version de métadonnées d'un document. Change à chaque nouvelle version du document (remplacement) et à chaque modification de métadonnées (masquage/démasquage aux PS, remise en visibilité patient ou RL). | `DocumentReference.identifier`(slice`entryUUID`) — cf. le[tableau de correspondance XDS officiel de la ressource FHIR](https://hl7.org/fhir/R4/documentreference-mappings.html#xds)(`identifier`→`DocumentEntry.entryUUID`) |
| `logicalID` | UUID | Identifiant technique invariable pour toutes les versions de métadonnées d'un même document, à la différence de`entryUUID`(cf. volet CI-SIS §3.4.54). | **(implicite)**— aucun champ dédié ; l'invariance est assurée par`DocumentReference.id`, l'identifiant logique de la ressource, qui ne change jamais tant que la ressource existe |
| `uniqueId` | OID / UUID | Identifiant unique du**document**attribué par le producteur (système LPS). | `DocumentReference.masterIdentifier` |
| `repositoryUniqueId` | OID | Identifiant du dépôt dans lequel est stocké le document. | Dérivé de`DocumentReference.content.attachment.url` |
| `patientID` | CX | Identifiant du patient dans le registre — INS (NIR ou NIA) dans le contexte DMP. | `DocumentReference.subject`→`Patient.identifier` |
| `sourcePatientID` | CX | Identifiant local du patient dans le système producteur (IPP ou INS). | `DocumentReference.context.sourcePatientInfo`→`Patient.identifier`(contenu) |
| `homeCommunityId` | OID | Identifiant de la communauté XCA. Non utilisé dans le périmètre de PDSm. | — |
| `version` | integer | Numéro de version de la fiche. | `DocumentReference.meta.versionId` |

> **Note :** Dans le contexte DMP, `uniqueId` correspond à l'identifiant que le LPS attribue au document au moment de sa création. C'est l'identifiant que le LPS connaît localement. L'`entryUUID`, en revanche, est attribué par le registre DMP lors de la soumission — le LPS doit l'obtenir via TD3.1a ou TD3.1b pour pouvoir ensuite modifier ou supprimer le document.

### SubmissionSet / List (SubmissionSet PDSm)

| | | | |
| :--- | :--- | :--- | :--- |
| `entryUUID` | UUID | Identifiant unique du lot de soumission dans le registre. | `List.identifier`(slice`entryUUID`) |
| `uniqueId` | OID / UUID | Identifiant unique du lot attribué par le système source. | `List.identifier`(slice`uniqueId`) |
| `sourceId` | OID | Identifiant du système source (OID de l'application). | Extension`ihe-sourceId`sur`List` |
| `patientId` | CX | Identifiant du patient. | `List.subject`→`Patient.identifier` |

### Folder / List (Folder PDSm)

| | | | |
| :--- | :--- | :--- | :--- |
| `entryUUID` | UUID | Identifiant unique du classeur dans le registre. | `List.identifier`(slice`entryUUID`) |
| `uniqueId` | OID / UUID | Identifiant unique du classeur attribué par le producteur. | `List.identifier`(slice`uniqueId`) |
| `patientId` | CX | Identifiant du patient. | `List.subject`→`Patient.identifier` |

### Récapitulatif : entryUUID vs uniqueId dans le contexte DMP

Ces deux identifiants sont les plus fréquemment confondus. Le tableau ci-dessous résume leurs différences essentielles.

| | | |
| :--- | :--- | :--- |
| **Attribué par** | Le registre DMP (à la soumission) | Le système producteur (le LPS) |
| **Connu par le LPS avant soumission ?** | Non | Oui |
| **Invariant entre les versions ?** | Non (change à chaque nouvelle version) | Oui (`masterIdentifier`) |
| **Équivalent FHIR** | `DocumentReference.identifier`(slice`entryUUID`) | `DocumentReference.masterIdentifier` |
| **Utilisé pour** | Mise à jour, suppression, archivage (TD3.3x) | Identification logique du document |
| **Obtenu via** | TD3.1a (liste) ou TD3.1b (recherche par`uniqueId`) | Assigné par le LPS à la création |

