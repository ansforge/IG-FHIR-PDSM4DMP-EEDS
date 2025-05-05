Logical: DocumentEntry
Parent: Base
Id: DocumentEntry
Title: "Document Entry (LM)"
Description: """
Modèle logique  d’une fiche
"""

* entryUUID 1..1 uuid "Identifiant unique affecté à la version de la fiche référençant le document."
* logicalId 1..1 Identifier "Cette métadonnée représente un identifiant invariable pour toutes les versions de la fiche d'un document, à la différence de la métadonnée entryUUID qui a une valeur différente pour chaque version de la fiche"
* mimeType 1..1 CodeableConcept "Cette métadonnée représente le type de contenu du document, défini par le standard MIME."
* availabilityStatus 1..1 CodeableConcept "Cette métadonnée représente la pertinence de la version de la fiche d'un document. " "**Availability Status**"
* availabilityStatus from https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS (required)
* hash 1..1 string "Cette métadonnée contient le résultat du hachage du document déposé" 
* size 1..1 integer "Cette métadonnée correspond à la taille du document déposé."
* languageCode 1..1 string "Cette métadonnée représente le code de la langue dans laquelle le document est rédigé." "Pour tous les documents produits système initiateur français : 'fr-FR'" 
* author 1..* AuthorDocumentEntry "Cette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document."
* legalAuthenticator 1..1 Reference(ActorPS or ActorPatient  or ActorSystem) "Cette métadonnée représente l'acteur prenant la responsabilité du contenu médical du document" "XCN"
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
* class 1..1 CodeableConcept "class représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, etc.)." "**Class Code**"
* class from https://mos.esante.gouv.fr/NOS/JDV_J57-ClassCode-DMP/FHIR/JDV-J57-ClassCode-DMP (required)
* confidentiality 1..4 CodeableConcept "Métadonnée contenant les informations définissant le niveau de confidentialité d'un document déposé dans l'entrepôt. Dans le cadre de la mise en œuvre du masquage et de la non-visibilité, ces métadonnées sont utilisées pour rendre inaccessible un document à l'utilisateur" "**Confidentiality Code**"
* confidentiality from https://mos.esante.gouv.fr/NOS/JDV_J58-ConfidentialityCode-DMP/FHIR/JDV-J58-ConfidentialityCode-DMP (required)
* eventCodeList 0..* EventCode "Cette métadonnée contient les codes, libellés et codes système représentant :  • un évènement documenté (acte, traitement, diagnostic, etc…), • une modalité d'acquisition (contexte imagerie), • une région anatomique (contexte imagerie). "
* format 1..1 CodeableConcept "Métadonnée contenant les informations définissant le format du document." "**Format Code**"
* format from https://mos.esante.gouv.fr/NOS/JDV_J60-FormatCode-DMP/FHIR/JDV-J60-FormatCode-DMP (required)
* healthcareFacilityTypeCode 1..1 CodeableConcept "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit. " "Healthcare Facility Type Code**"
* healthcareFacilityTypeCode from https://mos.esante.gouv.fr/NOS/JDV_J61-HealthcareFacilityTypeCode-DMP/FHIR/JDV-J61-HealthcareFacilityTypeCode-DMP (required)
* practiceSetting 1..1 CodeableConcept "Contexte de l’acte qui a engendré la création du document. " "**Practice Setting**"
* practiceSetting from https://mos.esante.gouv.fr/NOS/JDV_J62-PracticeSettingCode-DMP/FHIR/JDV-J62-PracticeSettingCode-DMP (required)
* type 1..1 CodeableConcept "Métadonnée représentant le type du document." "**Type Code**"
* type from https://mos.esante.gouv.fr/NOS/JDV_J66-TypeCode-DMP/FHIR/JDV-J66-TypeCode-DMP (required)
* documentAvailability 0..1 string "Cette métadonnée représente '’accessibilité du document en indiquant si celui-ci est accessible en ligne ou non"
* homeCommunityId  0..1 oid "Cette métadonnée correspond à l'identifiant de la communauté représentée par le système cible, si celui-ci offre les fonctionnalités de communication avec d'autres communautés, présentées dans le profil XCA d'IHE. Elle n'est pas utilisée par les transactions décrites dans ce volet."
* creationTime 1..1 dateTime "Cette métadonnée représente la date et l’heure de la création du document."
* referenceIdList 0..* Base "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document."
* referenceIdList.CX1 1..1 identifier "Identifiant de l'objet référencé"
* referenceIdList.CX4 1..1 identifier "Identifiant de l’organisme ayant attribué l’identifiant de l'objet référencé"
* referenceIdList.CX5 1..1 CodeableConcept "Type d’identifiant"
* referenceIdList.CX5 from https://mos.esante.gouv.fr/NOS/JDV_J231-XdsTypesIdentifiantsReferenceId-DMP/FHIR/JDV-J231-XdsTypesIdentifiantsReferenceId-DMP (required)


* version 0..1 integer "Cette métadonnée représente le numéro de version de la fiche d’un document."

