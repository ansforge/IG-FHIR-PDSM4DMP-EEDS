
### Objet de l'annexe

Cette annexe établit la correspondance des **métadonnées XDS** définies dans le [Volet Partage de Documents de Santé du CI-SIS (v1.16.4)](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) vers les ressources FHIR profilées par [PDSm](https://interop.esante.gouv.fr/ig/fhir/pdsm/).

Elle répond à un besoin précis : les tables de correspondance publiées par HL7 et IHE sont écrites dans le sens **FHIR → XDS** (chaque `mapping` étant porté par un `ElementDefinition`, il ne peut exister que pour un élément FHIR présent). Elles ne peuvent donc pas, par construction, révéler un attribut XDS *dépourvu* de cible FHIR. Cette annexe reconstruit la correspondance dans le sens **XDS → FHIR**, à partir de la nomenclature définie dans le volet XDS du CI-SIS, et met en évidence les attributs **sans cible** (dits « orphelins »).

#### Aide à la lecture des tableaux de mapping

<div class="stu-note">
Légende du statut : ✅ correspondance directe — ⚠️ correspondance non certaine ou via extension — ❌ attribut sans cible FHIR (orphelin).
</div>

### Métadonnées XDS d'une fiche (§3.4) → DocumentReference

Profil cible : [PDSm_ComprehensiveDocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-comprehensive-document-reference.html).

| Attribut XDS (volet §3.4) | Élément FHIR | Héritée MHD ? | Statut |
|---|---|---|---|
| `author` | `DocumentReference.author` (regroupement répétable, [1..*]) | oui | ✅ |
| `authorInstitution` | `author` → `Organization` *contained* | oui | ✅ |
| `authorPerson` | `author` → `Practitioner`/`Device` *contained* | oui | ✅ |
| `authorRole` | `author` → `PractitionerRole.code` *contained* | oui | ✅ (sous réserve de binding) |
| `authorSpecialty` | `PractitionerRole.specialty` | oui | ✅ |
| `availabilityStatus` | `status` | oui (ValueSet `required`) | ⚠️ correspondance incomplète — cf. section « Cas de correspondance incomplète : availabilityStatus → status » plus bas dans cette page |
| `classCode` (+ Display / codingScheme) | `category` | oui | ✅ |
| `comments` | `description` | oui | ✅ |
| `confidentialityCode` (valeur portée par la version initiale des métadonnées, à la soumission du document — classification de confidentialité de base : normal/restreint) | `securityLabel` | oui | ✅ |
| `confidentialityCode` (valeur portée par une version ultérieure des métadonnées, à la suite d'une opération de masquage/démasquage ou de visibilité patient/RL — codes `MASQUE_PS`, `INVISIBLE_PATIENT` du JDV_J08) | `securityLabel` (même élément FHIR ; la valeur remplace celle de la version précédente — chaque changement génère un nouvel `entryUUID`, cf. [annexe des identifiants](annexe_identifiants_xds_fhir.html)) | oui | ✅ — cf. [TD3.3a](transaction_td3.3a.html) / [TD3.3b](transaction_td3.3b.html) |
| `creationTime` | `content.attachment.creation` | oui | ✅ |
| `documentAvailability` | — | **non** | ❌ orphelin — la métadonnée `documentAvailability` (décrite dans le supplément [XDS Metadata Update](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_XDS_Metadata_Update.pdf)) n'est pas utilisée dans le système DMP — cf. [TD3.3d](transaction_td3.3d.html) |
| `entryUUID` | `identifier` (slice `entryUUID`) | oui | ✅ |
| `eventCodeList` (+ Display / codingScheme) | `context.event` | oui | ✅ |
| `formatCode` (+ Display / codingScheme) | `content.format` | oui | ✅ |
| `hash` | `content.attachment.hash` | oui | ✅ — conversion hex → base64 requise (`hash` XDS est de type [SHA-1](https://esante.gouv.fr/sites/default/files/media_entity/documents/ci-sis_service_volet-partage-documents-sante_v1.16.4.pdf) (§3.4.26) encodé en [hexadécimal](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html) (`hexBinary`, IHE ITI TF Vol. 3 §4.2.3.2.10 — la RFC 3174 ne définit que l'algorithme, pas l'encodage) ; `content.attachment.hash` est de type [`base64Binary`](https://profiles.ihe.net/ITI/MHD/4.2.4/32_fhir_maps.html)) |
| `healthcareFacilityTypeCode` | `context.facilityType` | oui | ✅ |
| `homeCommunityId` | extension `homeCommunityId` | oui (extension MHD) | ⚠️ extension |
| `languageCode` | `content.attachment.language` | oui | ✅ |
| `legalAuthenticator` | `authenticator` | oui | ✅ (et non `custodian`) |
| `logicalID` (lid ebRIM) | *(implicite)* `id` de la ressource | non | ⚠️ pas de champ dédié — couvert implicitement par la stabilité de l'`id` sous PATCH (cf. note ci-dessous) |
| `mimeType` | `content.attachment.contentType` | oui | ✅ |
| `patientId` | `subject` | oui | ✅ |
| `practiceSettingCode` | `context.practiceSetting` | oui | ✅ |
| `referenceIdList` | `context.related` | oui | ✅ |
| `repositoryUniqueId` | extension `repositoryUniqueId` | oui (extension MHD) | ⚠️ sans utilité en FHIR pur |
| `serviceStartTime` / `serviceStopTime` | `context.period.start` / `.end` | oui | ✅ |
| `size` | `content.attachment.size` | oui | ✅ |
| `sourcePatientId` / `sourcePatientInfo` | `context.sourcePatientInfo` (+ `.identifier`) | oui | ✅ |
| `title` | `content.attachment.title` | oui | ✅ |
| `typeCode` (+ Display / codingScheme) | `type` | oui | ✅ |
| `uniqueId` | `masterIdentifier` + `identifier` (slice `uniqueId`) | oui | ✅ |
| `URI` | `content.attachment.url` | oui | ✅ |
| `version` | `meta.versionId` | non | ✅ — le profil PDSm définit `meta.versionId` comme « égal à 1 pour la première version de la fiche », requis à chaque mise à jour |

<div class="stu-note">
**Attention à l'implémentation (`hash`)** — ce point est documenté explicitement par [MHD](https://profiles.ihe.net/ITI/MHD/4.2.4/32_fhir_maps.html) : *« The hash of document is encoded differently in the DocumentReference resource and in the DocumentEntry metadata. While the DocumentEntry contains the hexadecimal representation of the hash digest, the DocumentReference resource contains the base64-encoding of the hash digest. »* Exemple donné pour un fichier de longueur nulle : `DocumentEntry.hash` = `da39a3ee5e6b4b0d3255bfef95601890afd80709` (hex) ↔ `DocumentReference.attachment.hash` = `2jmj7l5rSw0yVb/vlWAYkK/YBwk=` (base64). Une simple recopie de la chaîne hexadécimale produirait une valeur incorrecte : une conversion hex → octets → base64 est nécessaire à l'implémentation.
</div>

Le mécanisme de mise à jour des métadonnées ne fonctionne pas de la même façon des deux côtés :

- **XDS** (`Update Document Set [ITI-57]`, §3.3.5 du volet) soumet à chaque mise à jour une **nouvelle fiche**, avec un nouvel `entryUUID`, mais en conservant le même `uniqueId` et le même `logicalID` ; `version` est incrémenté.
- **PDSm** modélise la même opération par un **PATCH sur la ressource `DocumentReference` existante** (TD3.3a/TD3.3b/TD3.3c) : `identifier` (slice `entryUUID`) reste donc inchangé d'une mise à jour à l'autre, là où XDS lui attribue une nouvelle valeur à chaque fois.

Conséquence : `version` est correctement repris par `meta.versionId` ; `logicalID`, en revanche, n'a pas de champ dédié — son invariance est assurée implicitement par la stabilité de l'`id` de la ressource sous PATCH, plutôt que portée par une métadonnée explicite.

### Métadonnées XDS d'un lot de soumission (§3.5) → List (SubmissionSet)

Profil cible : [PDSm_SubmissionSetComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-submissionset-comprehensive.html).

| Attribut XDS (volet §3.5) | Élément FHIR | Héritée MHD ? | Statut |
|---|---|---|---|
| `author` | `List.source` (regroupement répétable, [1..*]) | oui | ✅ |
| `authorInstitution` | `source.extension:authorOrg` → `Organization` | oui | ✅ |
| `authorPerson` | `source` → `Practitioner`/`Device` *contained* | oui | ✅ |
| `authorRole` | `PractitionerRole.code` *contained* | oui | ✅ (sous réserve de binding) |
| `authorSpecialty` | `PractitionerRole.specialty` | oui | ✅ |
| `availabilityStatus` | `status` | oui (ValueSet `required`) | ⚠️ correspondance incomplète — `Archived` national via `PDSm_isArchived` |
| `comments` | `note` | oui | ✅ |
| `contentTypeCode` (+ Display / codingScheme) | `code` (+ extension `designationType`) | oui | ✅ |
| `entryUUID` | `identifier` (slice `entryUUID`) | oui | ✅ |
| `homeCommunityId` | extension `homeCommunityId` | oui | ✅ |
| `intendedRecipient` | extension `intendedRecipient` (`PDSm_intendedRecipient`) | oui | ✅ |
| `patientId` | `subject` | oui | ✅ |
| `sourceId` | extension `sourceId` | oui | ✅ |
| `submissionTime` | `date` | oui | ✅ |
| `title` | `title` | oui | ✅ |
| `uniqueId` | `identifier` (slice `uniqueId`) | oui | ✅ |

Aucun orphelin au niveau du lot : tous les attributs du §3.5 disposent d'une cible héritée de MHD. Les valeurs fixées par MHD `mode = working` et `code = submissionset` ne correspondent à aucun attribut XDS — ce sont des contraintes ajoutées par FHIR (sens inverse du mapping).

### Métadonnées XDS d'un classeur (§3.6) → List (Folder)

Profil cible : [PDSm_FolderComprehensive](https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition-pdsm-folder-comprehensive.html).

| Attribut XDS (volet §3.6) | Élément FHIR | Héritée MHD ? | Statut |
|---|---|---|---|
| `availabilityStatus` | `status` | oui (ValueSet `required`) | ⚠️ correspondance incomplète (invariable `Approved` au CI-SIS actuel) |
| `codeList` (+ Code / Display / codingScheme) | `code` (+ extension `designationType`) | oui | ✅ |
| `comments` | `note` | oui | ✅ |
| `entryUUID` | `identifier` (slice `entryUUID`) | oui | ✅ |
| `homeCommunityId` | extension `homeCommunityId` | oui | ✅ |
| `lastUpdateTime` | `date` | oui | ✅ |
| `logicalID` (lid ebRIM) | *(implicite)* `id` de la ressource | non | ⚠️ pas de champ dédié — même couverture implicite que pour la fiche |
| `patientId` | `subject` | oui | ✅ |
| `title` | `title` | oui | ✅ |
| `uniqueId` | `identifier` (slice `uniqueId`) | oui | ✅ |
| `version` | `meta.versionId` | non | ✅ |

La mise à jour de classeur ne fait pas partie de la version actuelle du CI-SIS (`availabilityStatus` invariable = `Approved`). `logicalID` / `version` ne sont donc mobilisés que si le versionnement de classeur est activé ultérieurement ; leur couverture FHIR suit la même logique que pour la fiche (ci-dessus). Comme pour le lot, `mode = working` et `code = folder` sont des valeurs fixes FHIR sans source XDS.

### Associations (§3.3) → DocumentReference.relatesTo

Les objets `Association` d'ebRIM se répartissent selon leur nature. L'appartenance à un lot ou un classeur (`HasMember`) devient `List.entry.item`. Les relations entre documents se mappent via la ConceptMap [`AssociationTypeVsRelatesTo`](https://profiles.ihe.net/ITI/MHD/ConceptMap-AssociationTypeVsRelatesTo.html) :

| Type d'association XDS | `relatesTo.code` FHIR | Correspondance | Statut |
|---|---|---|---|
| `RPLC` | `replaces` | équivalente | ✅ |
| `XFRM` | `transforms` | équivalente | ✅ |
| `APND` | `appends` | équivalente (interdite à la soumission par le volet) | ✅ |
| `XFRM_RPLC` | `replaces` | plus étroite | ⚠️ perte du volet *transform* |
| `signs` | `signs` | équivalente | ✅ |
| `IsSnapshotOf` | `transforms` | approximative | ⚠️ nouvelle instance dérivée, pas strictement un transform |

Les attributs portés par les associations lors des transactions ITI-42 / ITI-57 — `SubmissionSetStatus` (Original/Reference), `PreviousVersion`, `OriginalStatus` / `NewStatus` (association `UpdateAvailabilityStatus`) et le slot `associationPropagation` — n'ont **aucune** cible FHIR : ce sont des mécanismes de transaction ebRIM, non des propriétés d'objet portées par une ressource.

### Éléments FHIR sans source XDS

Symétriquement, certains éléments imposés par les profils PDSm/MHD ne proviennent d'aucun attribut XDS — ce sont des ajouts du sens inverse du mapping (FHIR → XDS), utiles à connaître pour qui découvre les ressources en venant de XDS :

| Élément FHIR | Ressource | Origine |
|---|---|---|
| `List.mode` = `working` (valeur fixée) | `List` (lot, classeur) | Contrainte MHD — aucun attribut XDS correspondant |
| `List.code.coding` = `submissionset` / `folder` (system + code fixés) | `List` (lot, classeur) | Contrainte MHD distinguant les deux types de `List` |
| `List.status` | `List` (lot, classeur) | Élément FHIR requis pilotant le cycle de vie de la ressource, sans attribut XDS dédié |
| `contained` (≥1 obligatoire) | `DocumentReference` | Contrainte structurelle PDSm : les ressources `author`/`authenticator` doivent être contenues |
| `context` (1..1 obligatoire) | `DocumentReference` | Élément FHIR requis regroupant plusieurs métadonnées XDS (`eventCodeList`, `healthcareFacilityTypeCode`, `practiceSettingCode`, `serviceStartTime`/`serviceStopTime`, `referenceIdList`, `sourcePatientId`/`sourcePatientInfo`) — le conteneur lui-même n'est pas issu d'un attribut XDS |
| `extension:isArchived` | `DocumentReference` | Extension nationale PDSm palliant l'absence de `Archived` dans le ValueSet FHIR (cf. section dédiée) |
| `relatesTo` cardinalité [1..1] conditionnelle | `DocumentReference` | Contrainte PDSm ajoutée pour le cas du remplacement de document, sans attribut XDS équivalent direct |

### Cas de correspondance incomplète : availabilityStatus → status

C'est le seul mapping présentant un risque réel de perte sémantique. Le volet emploie le jeu de valeurs `JDV_J52_AvailabilityStatus_CISIS`, dont deux valeurs sont des extensions nationales absentes du ValueSet FHIR (lié en `required` sur `DocumentReference.status`) :

| `availabilityStatus` (CI-SIS) | `DocumentReference.status` | Couverture |
|---|---|---|
| `Approved` | `current` | ✅ |
| `Deprecated` | `superseded` | ✅ |
| `Archived` (extension nationale) | — | ✅ porté par l'extension `PDSm_isArchived` |
| `Deleted` / dépublié (extension nationale) | — | ❌ voir question ouverte ci-dessous |

Ici, la contrainte vient de FHIR (ValueSet fermé), non d'une interdiction du volet : la permissivité du volet ne peut donc rien faire hériter. Le traitement conforme passe par l'extension `PDSm_isArchived` pour `Archived`.

<div class="dragon" markdown="1">

**Question ouverte** — Pour `Deleted`, quel traitement retenir : utiliser `superseded` par défaut malgré le décalage de sens (dépublication ≠ remplacement par une version plus récente), ou identifier un autre mécanisme conforme au binding MHD ? Cf. [issue PDSm #99](https://github.com/ansforge/IG-fhir-partage-de-documents-de-sante/issues/99), qui demande de clarifier qu'un document ne peut pas être supprimé mais seulement archivé (`isArchived`).
</div>

### Synthèse des orphelins (points ouverts)

1. `logicalID` (fiche et classeur) — pas de champ FHIR dédié ; couvert implicitement par la stabilité de l'`id` de ressource sous PATCH (`version` lui-même est correctement couvert par `meta.versionId`, cf. section dédiée).
2. `documentAvailability` — accessibilité en ligne/hors-ligne du document, optionnelle, renseignée par le système cible.
3. `availabilityStatus = Deleted` — extension nationale sans valeur `DocumentReference.status` autorisée par le binding MHD (`Archived` est déjà couvert par l'extension `PDSm_isArchived`).
4. Attributs d'association ebRIM (`SubmissionSetStatus`, `PreviousVersion`, `OriginalStatus`/`NewStatus`, `associationPropagation`).

<div class="dragon" markdown="1">

**Question ouverte** — Pour chacun de ces points, quel traitement retenir : extension dédiée, exclusion motivée du périmètre, ou prise en charge par un mécanisme transactionnel (Bundle / opération) plutôt que par un élément de ressource ?
</div>
