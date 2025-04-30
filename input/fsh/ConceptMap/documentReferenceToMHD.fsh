Instance: documentReferenceToMHD
InstanceOf: ConceptMap
Usage: #definition
* name = "documentReferenceToMHD"
* title = "documentReferenceToMHD"
* status = #draft
* experimental = true
* group[0].source = "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/DocumentEntry"
* group[=].target = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"

* group[=].element[0].code = #DocumentEntry.entryUUID
* group[=].element[=].target.code = #DocumentReference.id
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.logicalId
* group[=].element[=].target.code = #DocumentReference.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.mimeType
//* group[=].element[=].target.code = #
* group[=].element[=].target.equivalence = #unmatched

* group[=].element[0].code = #DocumentEntry.availabilityStatus
//* group[=].element[=].target.code = #
* group[=].element[=].target.equivalence = #unmatched

* group[=].element[0].code = #DocumentEntry.hash
* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.size
* group[=].element[=].target.code = #DocumentReference.content.attachment.size
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.languageCode
* group[=].element[=].target.code = #DocumentReference.content.attachment.language
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.legalAuthenticator
* group[=].element[=].target.code = #DocumentReference.authenticator
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.repositoryUniqueId
//* group[=].element[=].target.code = #
* group[=].element[=].target.equivalence = #unmatched

* group[=].element[0].code = #DocumentEntry.serviceStartTime
* group[=].element[=].target.code = #DocumentReference.context.period.start
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.serviceEndTime
* group[=].element[=].target.code = #DocumentReference.context.period.end
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.sourcePatientID
* group[=].element[=].target.code = #DocumentReference.subject.fr-core-patient
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.sourcePatientInfo
* group[=].element[=].target.code = #DocumentReference.subject.fr-core-patient
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[0].code = #DocumentEntry.URI
//* group[=].element[=].target.code = #
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #DocumentEntry.title
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.comments
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.patientID
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.uniqueId
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.class
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.confidentiality
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.eventCodeList
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.format
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.healthcareFacilityTypeCode
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.practiceSetting
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.type
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.documentAvailability
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #DocumentEntry.homeCommunityId
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #DocumentEntry.creationTime
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #DocumentEntry.referenceIdList
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #DocumentEntry.referenceIdList
//* group[=].element[=].target.code = #DocumentReference.content.attachment.hash
* group[=].element[=].target.equivalence = #equivalent