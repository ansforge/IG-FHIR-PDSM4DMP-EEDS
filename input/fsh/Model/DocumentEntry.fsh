Logical: DocumentEntry
Parent: Base
Id: DocumentEntry
Title: "Document Entry (LM)"
Description: """
Modèle logique  d’une fiche
"""

* entryUUID 1..1 uuid "Identifiant unique affecté à la version de la fiche référençant le document." """Les valeurs possibles pour cette métadonnée doivent être un code provenant du jeu de valeurs mis à disposition par le projet. En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J52_AvailabilityStatus_CISIS peut être utilisé."""
* logicalId 1..1 Identifier "Cette métadonnée représente un identifiant invariable pour toutes les versions de la fiche d'un document, à la différence de la métadonnée entryUUID qui a une valeur différente pour chaque version de la fiche"
* mimeType 1..1 string "Cette métadonnée représente le type de contenu du document, défini par le standard MIME."
* availabilityStatus 1..1 CodeableConcept "Cette métadonnée représente la pertinence de la version de la fiche d'un document. " "**Availability Status**"
* availabilityStatus from https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS (preferred)
* hash 1..1 string "Cette métadonnée contient le résultat du hachage du document déposé" 
* size 1..1 integer "Cette métadonnée correspond à la taille du document déposé."
* languageCode 1..1 string "Cette métadonnée représente le code de la langue dans laquelle le document est rédigé." "Pour tous les documents produits système initiateur français : 'fr-FR'" 
* author 1..* AuthorDocumentEntry "Cette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document."
* legalAuthenticator[x] 1..1 ActorPS or ActorPatient  or ActorSystem "Cette métadonnée représente l'acteur prenant la responsabilité du contenu médical du document" "XCN"
* repositoryUniqueId 1..1 oid "Cette métadonnée représente l'identifiant unique global de l'entrepôt de documents dans lequel est stocké le document"
* serviceStartTime 1..1 dateTime "Cette métadonnée représente la date de début de l'acte de référence."
* serviceEndTime 0..1 dateTime "Cette métadonnée correspond à la date de fin de l'acte de référence, si connue."
* sourcePatientID 1..1 SourcePatientId "Cette métadonnée contient l'identifiant secondaire du patient dans le système d'information du producteur (IPP) ou l'INS, s'il n'y a pas d'identifiant secondaire."
* sourcePatientInfo 1..1 SourcePatientInfo "Cette métadonnée contient les traits d'identité du patient concerné par le document, connus par le producteur du document."
* URI 1..1 string "Cette métadonnée n'est exploitée que par la transaction XDM 'Distribute document set on media ITI-32'"
* title 1..1 string "Cette métadonnée représente le titre du document."
* comments 0..1 string "Cette métadonnée contient le commentaire associé au document."
* patientID 1..1 PatientId "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient."
* uniqueId 1..1 Identifier "Identifiant unique affecté au document par son créateur. "
* class 1..1 CodeableConcept "class représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, etc.)." """
class est constitué des attributs : 
- **classCode**
- **classCodeDisplayName**
- **codingScheme***

**classCode**
- Type : Non contraint
- Contenu : Les valeurs possibles doivent être un code provenant du jeu de valeurs mis à disposition par le projet (exemple : JDV_J57_ClassCode_DMP). En l’absence de spécifications complémentaires, le JDV_J06_XdsClassCode_CISIS peut être utilisé. 
- Source : En fonction de l’interface fournie (ex. paramétrage fixe ou choix dans un menu déroulant). 

**classCodeDisplayName**
- Type : Non contraint
- Contenu : L’intitulé de la classe de document correspond au libellé associé au code de **classCode**.
- Source : En fonction de l’interface fournie (ex. paramétrage fixe ou choix dans un menu déroulant). 

**codingScheme**
- Type : OID
- Le code système de la classe de document correspond à l’OID associé au code de classCode. 
- Source : En fonction de l’interface fournie (ex. paramétrage fixe ou choix dans un menu déroulant). 

"""
* class from https://mos.esante.gouv.fr/NOS/JDV_J06-XdsClassCode-CISIS/FHIR/JDV-J06-XdsClassCode-CISIS (preferred)
* confidentiality 1..4 CodeableConcept "Métadonnée contenant les informations définissant le niveau de confidentialité d'un document déposé dans l'entrepôt. Dans le cadre de la mise en œuvre du masquage et de la non-visibilité, ces métadonnées sont utilisées pour rendre inaccessible un document à l'utilisateur" "**Confidentiality Code**"
* confidentiality from https://mos.esante.gouv.fr/NOS/JDV_J58-ConfidentialityCode-DMP/FHIR/JDV-J58-ConfidentialityCode-DMP (preferred)
* eventCodeList 0..* EventCode "Cette métadonnée contient les codes, libellés et codes système représentant :  • un évènement documenté (acte, traitement, diagnostic, etc…), • une modalité d'acquisition (contexte imagerie), • une région anatomique (contexte imagerie). "
* format 1..1 CodeableConcept "Métadonnée contenant les informations définissant le format du document." "**Format Code**"
* format from https://mos.esante.gouv.fr/NOS/JDV_J10-XdsFormatCode-CISIS/FHIR/JDV-J10-XdsFormatCode-CISIS (preferred)
* healthcareFacilityTypeCode 1..1 CodeableConcept "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit. " "Healthcare Facility Type Code**"
* healthcareFacilityTypeCode from https://mos.esante.gouv.fr/NOS/JDV_J02-XdsHealthcareFacilityTypeCode-CISIS/FHIR/JDV-J02-XdsHealthcareFacilityTypeCode-CISIS (preferred)
* practiceSetting 1..1 CodeableConcept "Contexte de l’acte qui a engendré la création du document. " "**Practice Setting**"
* practiceSetting from https://mos.esante.gouv.fr/NOS/JDV_J04-XdsPracticeSettingCode-CISIS/FHIR/JDV-J04-XdsPracticeSettingCode-CISIS (preferred)
* type 1..1 CodeableConcept "Métadonnée représentant le type du document." "**Type Code**"
* type from https://mos.esante.gouv.fr/NOS/JDV_J07-XdsTypeCode-CISIS/FHIR/JDV-J07-XdsTypeCode-CISIS (preferred)
* documentAvailability 0..1 string "Cette métadonnée représente '’accessibilité du document en indiquant si celui-ci est accessible en ligne ou non"
* homeCommunityId  0..1 oid "Cette métadonnée correspond à l'identifiant de la communauté représentée par le système cible, si celui-ci offre les fonctionnalités de communication avec d'autres communautés, présentées dans le profil XCA d'IHE. Elle n'est pas utilisée par les transactions décrites dans ce volet."
* creationTime 1..1 dateTime "Cette métadonnée représente la date et l’heure de la création du document."
* referenceIdList 0..* Base "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document."
* referenceIdList.CX1 1..1 identifier "Identifiant de l'objet référencé"
* referenceIdList.CX4 1..1 identifier "Identifiant de l’organisme ayant attribué l’identifiant de l'objet référencé"
* referenceIdList.CX5 1..1 CodeableConcept "Type d’identifiant"
* referenceIdList.CX5 from https://mos.esante.gouv.fr/NOS/JDV_J197-XdsTypesIdentifiantsReferenceId-CISIS/FHIR/JDV-J197-XdsTypesIdentifiantsReferenceId-CISIS (preferred)
* version 0..1 integer "Cette métadonnée représente le numéro de version de la fiche d’un document."




Mapping: DocumentEntryCDA
Target : "http://hl7.org/v3/cda"
Description : "Mapping CDA"
Source: DocumentEntry
* -> "DocumentEntry"
* availabilityStatus -> "Non applicable, cette métadonnée n'est pas soumise par le système initiateur. Le registre du système cible gère cette information et fournit sa valeur en réponse à une requête stockée."
* class -> "code@code (classCode est déduit de typeCode selon la table de correspondance entre ces deux métadonnées référencée dans les Nomenclatures des Objets de Santé (NOS) : ASS_X04-CorrespondanceType-Classe)"
