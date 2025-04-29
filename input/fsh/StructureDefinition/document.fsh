Logical: DocumentEntry
Parent: Base
Id: DocumentEntry
Title: "Document Entry (LM)"
Description: """
This Logical Mode describes the relevant attributes on the **Document Entry** class within IHE ITI XDS.
More details are to be retrieved from IHE ITI on www.ihe.net.
(Focus for this LM is on the coded attributes.)
"""


* title 1..1 string "title of document"
* uniqueId 1..1 Identifier "identifier of document"
* uri 1..1 Identifier "URI of document"
* class 1..1 CodeableConcept "class Code of the document" "**Class Code**"
* class from https://mos.esante.gouv.fr/NOS/JDV_J57-ClassCode-DMP/FHIR/JDV-J57-ClassCode-DMP (required)
* type 1..1 CodeableConcept "type Code" "**Type Code**"
* type from https://mos.esante.gouv.fr/NOS/JDV_J66-TypeCode-DMP/FHIR/JDV-J66-TypeCode-DMP (required)
* author 1..* Identifier "author"
* availabilityStatus 0..1 CodeableConcept "Cette métadonnée représente la pertinence de la version de la fiche d’un document." "**Availability Status**"
* availabilityStatus from https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS (required)
* comments 0..1 string "Cette métadonnée contient le commentaire associé au document. "
* confidentiality 1..1 CodeableConcept "confidentiality Code" "**Confidentiality Code**"
* confidentiality from https://mos.esante.gouv.fr/NOS/JDV_J58-ConfidentialityCode-DMP/FHIR/JDV-J58-ConfidentialityCode-DMP (required)
* creationTime 1..1 dateTime "Cette métadonnée représente la date et l’heure de la création du document. "
* format 1..1 CodeableConcept "format of the document" "**Format Code**"
* format from https://mos.esante.gouv.fr/NOS/JDV_J60-FormatCode-DMP/FHIR/JDV-J60-FormatCode-DMP(required)
* size 0..1 integer "size of document"
* hash 1..1 string "Cette métadonnée contient le résultat du hachage du document déposé"
* practiceSetting 0..1 CodeableConcept "practice setting" "**Practice Setting**"
* practiceSetting from https://mos.esante.gouv.fr/NOS/JDV_J62-PracticeSettingCode-DMP/FHIR/JDV-J62-PracticeSettingCode-DMP (required)
* healthcareFacilityTypeCode 1..1 CodeableConcept "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit "Healthcare Facility Type Code**"
* healthcareFacilityTypeCode from https://mos.esante.gouv.fr/NOS/JDV_J61-HealthcareFacilityTypeCode-DMP/FHIR/JDV-J61-HealthcareFacilityTypeCode-DMP (required)
* legalAuthenticator 0..1 Identifier "legal authenticator of the document"
* limitedMetadata 0..1 string "metadata"
* mimeType 1..1 CodeableConcept "mime type"
* objectType 1..1 CodeableConcept "mime type"
* sourcePatientID 1..1 Identifier "identifier of patient"
* sourcePatientInfo 0..1 string "additional information to patient"
* referenceIdList 0..* Identifier "list of reference identifiers"
* repositoryUniqueID 0..1 Identifier "identifier of repository"
* serviceStartTime 1..1 dateTime "start of service"
* serviceEndTime 1..1 dateTime "end of service"
