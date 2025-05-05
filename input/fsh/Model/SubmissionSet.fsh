Logical: SubmissionSet
Parent: Base
Id: SubmissionSet
Title: "SubmissionSet (LM)"
Description: """Modèle logique d'un lot de soummission (SubmissionSet)."""

* entryUUID 1..1 uuid "Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que uniqueId est utilisé à des fins de référence externe."
* availabilityStatus 1..1 code  "Cette métadonnée représente la pertinence d'un lot de soumission. "
* availabilityStatus from https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS (required)
* availabilityStatus ^example[0].label = "version à jour du lot de soumission"
* availabilityStatus ^example[=].valueString = "urn:oasis:names:tc:ebxml-regrep:StatusType:Approved"
* availabilityStatus ^example[1].label = "version archivée du lot de soumission"
* availabilityStatus ^example[=].valueString = "urn:asip:ci-sis:2010:StatusType:Archived "
* submissionTime 1..1 dateTime "Représente la date et heure de soumission."
* title 0..1 string "Titre du lot de soumission "
* comments 0..1 string "Cette métadonnée contient le commentaire associé au lot de soumission. "
* patientID 1..1 PatientId "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient tel que défini dans le cadre juridique."
* sourceID 1..1 oid "Cette métadonnée représente l’identifiant unique global du système émetteur du lot de soumission"
* uniqueID 1..1 oid "Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de référence externe alors que entryUUID est destiné à des fins de gestion interne."
* contentTypeCode 1..1 CodeableConcept "Ensemble de métadonnées représentant le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission. " "**Submission Set**"
* contentTypeCode from https://mos.esante.gouv.fr/NOS/JDV_J03-XdsContentTypeCode-CISIS/FHIR/JDV-J03-XdsContentTypeCode-CISIS (required)
* author 1..1 AuthorSubmissionSet "Représente la personne physique ou morale et/ou le dispositif auteur d’un lot de soumission"
* homeCommunityID 0..1 oid "Cette métadonnée correspond à l’identifiant de la communauté représentée par le système cible si celui-ci offre des fonctionnalités de communication avec d’autres communautés telles que présentées dans le profil XCA d’IHE. Elle n’est pas utilisée par les transactions décrites dans ce volet."
* intendedRecipient 0..* string "Cette métadonnée représente les destinataires (structure ou professionnel) auxquels lot de soumission est destiné. Elle n’est pas utilisée par les transactions décrites dans ce volet."
//* limitedMetadata 0..1 string "limited metadata"








