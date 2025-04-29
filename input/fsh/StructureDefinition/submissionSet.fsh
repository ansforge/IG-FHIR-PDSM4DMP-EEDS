Logical: SubmissionSet
Parent: Base
Id: SubmissionSet
Title: "SubmissionSet (LM)"
Description: """
This Logical Mode describes the relevant attributes on the **Submission Set** class within IHE ITI XDS.
More details are to be retrieved from IHE ITI on www.ihe.net.
(Focus for this LM is on the coded attributes.)
"""



* author 1..1 Identifier "Représente la personne physique ou morale et/ou le dispositif auteur d’un lot de soumission"
* availabilityStatus 0..1 CodeableConcept  "Cette métadonnée représente la pertinence de la version de la fiche d’un document. "
* availabilityStatus from https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS (required)
* comments 0..1 string "Comments"
* contentTypeCode 1..1 CodeableConcept "type of content of this submission" "**Submission Set**"
* contentTypeCode from https://mos.esante.gouv.fr/NOS/JDV_J59-ContentTypeCode-DMP/FHIR/JDV-J59-ContentTypeCode-DMP (required)
* entryUUID 1..1 Identifier "Identifiant unique du lot de soumission"
//* homeCommunityID 0..1 Identifier "ID of home community"
//* intendedRecipient 0..* Identifier "intendend recipients of the document"
//* limitedMetadata 0..1 string "limited metadata"
* patientID 1..1 Identifier "Représente l'identifiant du patient"
* sourceID 1..1 Identifier "Représente l’identifiant unique global du système émetteur du lot de soumission"
* submissionTime 1..1 dateTime "Représente la date et heure de soumission."
* title 0..1 string "Titre du lot de soumission "
* uniqueID 1..1 Identifier "Identifiant unique global affecté à ce lot de soumission par son créateur. "



