# Mapping des métadonnées XDS / FHIR - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Mapping des métadonnées XDS / FHIR

 
There is no translation page available for the current page, so it has been rendered in the default language 

### Objet de l'annexe

Cette annexe établit la correspondance des **métadonnées XDS** définies dans le [Volet Partage de Documents de Santé du CI-SIS (v1.16.4)](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) vers les ressources FHIR profilées par [PDSm](https://interop.esante.gouv.fr/ig/fhir/pdsm/).

Elle répond à un besoin précis : les tables de correspondance publiées par HL7 et IHE sont écrites dans le sens **FHIR → XDS** (chaque `mapping` étant porté par un `ElementDefinition`, il ne peut exister que pour un élément FHIR présent). Elles ne peuvent donc pas, par construction, révéler un attribut XDS **dépourvu** de cible FHIR. Cette annexe reconstruit la correspondance dans le sens **XDS → FHIR**, à partir de la nomenclature définie dans le volet XDS du CI-SIS, et met en évidence les attributs **sans cible** (dits « orphelins »).

#### Aide à la lecture des tableaux de mapping

Légende du statut : ✅ correspondance directe — ⚠️ correspondance non certaine ou via extension — ❌ attribut sans cible FHIR (orphelin).

### Métadonnées XDS d'une fiche (§3.4) → DocumentReference

Profil cible : [PDSm_ComprehensiveDocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html).

| | | | |
| :--- | :--- | :--- | :--- |
| `author`(+`authorPerson`) | `DocumentReference.author`(Practitioner/Device**contained**) | oui | ✅ |
| `authorInstitution` | `author`→`Organization`**contained** | oui | ✅ |
| `authorRole` | `author`→`PractitionerRole.code`**contained** | oui | ✅ (sous réserve de binding) |
| `authorSpecialty` | `PractitionerRole.specialty` | oui | ✅ |
| `availabilityStatus` | `status` | oui (ValueSet`required`) | ⚠️ non strict — cf. section dédiée |
| `classCode`(+ Display / codingScheme) | `category` | oui | ✅ |
| `comments` | `description` | oui | ✅ |
| `confidentialityCode`(1re occurrence) | `securityLabel` | oui | ✅ |
| `confidentialityCode`(occurrences de masquage :`MASQUE_PS`, non-visibilité patient/RL) | `securityLabel`(même élément, codes JDV_J08) | oui | ✅ — cf.[TD3.3a](transaction_td3.3a.md)/[TD3.3b](transaction_td3.3b.md) |
| `creationTime` | `content.attachment.creation` | oui | ✅ |
| `documentAvailability` | — | **non** | ❌ orphelin (Online/Offline — extension imagerie) |
| `entryUUID` | `identifier`(slice`entryUUID`) | oui | ✅ |
| `eventCodeList`(+ Display / codingScheme) | `context.event` | oui | ✅ |
| `formatCode`(+ Display / codingScheme) | `content.format` | oui | ✅ |
| `hash` | `content.attachment.hash` | oui | ✅ (hex → base64) |
| `healthcareFacilityTypeCode` | `context.facilityType` | oui | ✅ |
| `homeCommunityId` | extension`homeCommunityId` | oui (extension MHD) | ⚠️ extension |
| `languageCode` | `content.attachment.language` | oui | ✅ |
| `legalAuthenticator` | `authenticator` | oui | ✅ (et non`custodian`) |
| `logicalID`(lid ebRIM) | — | **non** | ❌ orphelin (versionnement ebRIM ;`meta.versionId`de sémantique différente) |
| `mimeType` | `content.attachment.contentType` | oui | ✅ |
| `patientId` | `subject` | oui | ✅ |
| `practiceSettingCode` | `context.practiceSetting` | oui | ✅ |
| `referenceIdList` | `context.related` | oui | ✅ |
| `repositoryUniqueId` | extension`repositoryUniqueId` | oui (extension MHD) | ⚠️ sans utilité en FHIR pur |
| `serviceStartTime`/`serviceStopTime` | `context.period.start`/`.end` | oui | ✅ |
| `size` | `content.attachment.size` | oui | ✅ |
| `sourcePatientId`/`sourcePatientInfo` | `context.sourcePatientInfo`(+`.identifier`) | oui | ✅ |
| `title` | `content.attachment.title` | oui | ✅ |
| `typeCode`(+ Display / codingScheme) | `type` | oui | ✅ |
| `uniqueId` | `masterIdentifier`+`identifier`(slice`uniqueId`) | oui | ✅ |
| `URI` | `content.attachment.url` | oui | ✅ |
| `version` | — | **non** | ❌ orphelin (versionnement XDS lid+version sans équivalent) |

### Métadonnées XDS d'un lot de soumission (§3.5) → List (SubmissionSet)

Profil cible : [PDSm_SubmissionSetComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-submissionset-comprehensive.html).

| | | | |
| :--- | :--- | :--- | :--- |
| `author`(+`authorPerson`) | `List.source`(Practitioner/Device**contained**) | oui | ✅ |
| `authorInstitution` | `source.extension:authorOrg`→`Organization` | oui | ✅ |
| `authorRole` | `PractitionerRole.code`**contained** | oui | ✅ (sous réserve de binding) |
| `authorSpecialty` | `PractitionerRole.specialty` | oui | ✅ |
| `availabilityStatus` | `status` | oui (ValueSet`required`) | ⚠️ non strict —`Archived`national via`PDSm_isArchived` |
| `comments` | `note` | oui | ✅ |
| `contentTypeCode`(+ Display / codingScheme) | `code`(+ extension`designationType`) | oui | ✅ |
| `entryUUID` | `identifier`(slice`entryUUID`) | oui | ✅ |
| `homeCommunityId` | extension`homeCommunityId` | oui | ✅ |
| `intendedRecipient` | extension`intendedRecipient`(`PDSm_intendedRecipient`) | oui | ✅ |
| `patientId` | `subject` | oui | ✅ |
| `sourceId` | extension`sourceId` | oui | ✅ |
| `submissionTime` | `date` | oui | ✅ |
| `title` | `title` | oui | ✅ |
| `uniqueId` | `identifier`(slice`uniqueId`) | oui | ✅ |

Aucun orphelin au niveau du lot : tous les attributs du §3.5 disposent d'une cible héritée de MHD. Les valeurs fixées par MHD `mode = working` et `code = submissionset` ne correspondent à aucun attribut XDS — ce sont des contraintes ajoutées par FHIR (sens inverse du mapping).

### Métadonnées XDS d'un classeur (§3.6) → List (Folder)

Profil cible : [PDSm_FolderComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-folder-comprehensive.html).

| | | | |
| :--- | :--- | :--- | :--- |
| `availabilityStatus` | `status` | oui (ValueSet`required`) | ⚠️ non strict (invariable`Approved`au CI-SIS actuel) |
| `codeList`(+ Code / Display / codingScheme) | `code`(+ extension`designationType`) | oui | ✅ |
| `comments` | `note` | oui | ✅ |
| `entryUUID` | `identifier`(slice`entryUUID`) | oui | ✅ |
| `homeCommunityId` | extension`homeCommunityId` | oui | ✅ |
| `lastUpdateTime` | `date` | oui | ✅ |
| `logicalID`(lid ebRIM) | — | **non** | ❌ orphelin |
| `patientId` | `subject` | oui | ✅ |
| `title` | `title` | oui | ✅ |
| `uniqueId` | `identifier`(slice`uniqueId`) | oui | ✅ |
| `version` | — | **non** | ❌ orphelin |

La mise à jour de classeur ne fait pas partie de la version actuelle du CI-SIS (`availabilityStatus` invariable = `Approved`). Les orphelins `logicalID` / `version` ne sont donc mobilisés que si le versionnement de classeur est activé ultérieurement. Comme pour le lot, `mode = working` et `code = folder` sont des valeurs fixes FHIR sans source XDS.

### Associations (§3.3) → DocumentReference.relatesTo

Les objets `Association` d'ebRIM se répartissent selon leur nature. L'appartenance à un lot ou un classeur (`HasMember`) devient `List.entry.item`. Les relations entre documents se mappent via la ConceptMap [`AssociationTypeVsRelatesTo`](https://profiles.ihe.net/ITI/MHD/ConceptMap-AssociationTypeVsRelatesTo.html) :

| | | | |
| :--- | :--- | :--- | :--- |
| `RPLC` | `replaces` | équivalente | ✅ |
| `XFRM` | `transforms` | équivalente | ✅ |
| `APND` | `appends` | équivalente (interdite à la soumission par le volet) | ✅ |
| `XFRM_RPLC` | `replaces` | plus étroite | ⚠️ perte du volet**transform** |
| `signs` | `signs` | équivalente | ✅ |
| `IsSnapshotOf` | `transforms` | approximative | ⚠️ nouvelle instance dérivée, pas strictement un transform |

Les attributs portés par les associations lors des transactions ITI-42 / ITI-57 — `SubmissionSetStatus` (Original/Reference), `PreviousVersion`, `OriginalStatus` / `NewStatus` (association `UpdateAvailabilityStatus`) et le slot `associationPropagation` — n'ont **aucune** cible FHIR : ce sont des mécanismes de transaction ebRIM, non des propriétés d'objet portées par une ressource.

### Cas non strict : availabilityStatus → status

C'est le seul mapping présentant un risque réel de perte sémantique. Le volet emploie le jeu de valeurs `JDV_J52_AvailabilityStatus_CISIS`, dont deux valeurs sont des extensions nationales absentes du ValueSet FHIR (lié en `required` sur `DocumentReference.status`) :

| | | |
| :--- | :--- | :--- |
| `Approved` | `current` | ✅ |
| `Deprecated` | `superseded` | ✅ |
| `Archived`(extension nationale) | — | ✅ porté par l'extension`PDSm_isArchived` |
| `Deleted`/ dépublié (extension nationale) | — | ❌`entered-in-error`non autorisé par le binding MHD (cf.[TD3.3c](transaction_td3.3c.md)) |

Ici, la contrainte vient de FHIR (ValueSet fermé), non d'une interdiction du volet : la permissivité du volet ne peut donc rien faire hériter. Le traitement conforme passe par l'extension `PDSm_isArchived` pour `Archived`.

**Question ouverte** — Pour `Deleted`, quel traitement retenir : utiliser `superseded` par défaut malgré le décalage de sens (dépublication ≠ remplacement par une version plus récente), ou identifier un autre mécanisme conforme au binding MHD ?

### Synthèse des orphelins (points ouverts)

1. `logicalID`+`version`(fiche et classeur) — versionnement ebRIM sans équivalent FHIR direct. Le besoin fonctionnel reste néanmoins couvert, mais par un mécanisme différent : au lieu d'un couple identifiant logique + compteur, FHIR/MHD chaîne les ressources successives via`DocumentReference.relatesTo.code = replaces`. Une requête`_revinclude=DocumentReference:relatesTo`sur la dernière version permet de retrouver en un seul appel toutes les ressources qui la référencent, reconstituant ainsi la lignée — sans qu'aucun champ ne porte directement un identifiant de lignée ou un numéro de version.
1. `documentAvailability`— Online/Offline (extension imagerie).
1. `availabilityStatus = Deleted`— extension nationale sans valeur`DocumentReference.status`autorisée par le binding MHD (`Archived`est déjà couvert par l'extension`PDSm_isArchived`).
1. Attributs d'association ebRIM (`SubmissionSetStatus`,`PreviousVersion`,`OriginalStatus`/`NewStatus`,`associationPropagation`).

**Question ouverte** — Pour chacun de ces points, quel traitement retenir : extension dédiée, exclusion motivée du périmètre, ou prise en charge par un mécanisme transactionnel (Bundle / opération) plutôt que par un élément de ressource ?

