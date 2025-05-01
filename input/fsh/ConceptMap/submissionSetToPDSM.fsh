Instance: submissionSetToPDSM
InstanceOf: ConceptMap
Usage: #definition
* name = "submissionSetToPDSM"
* title = "submissionSetToPDSM"
* status = #draft
* experimental = true
* group[0].source = "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet"
* group[=].target = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"

* group[=].element[0].code = #SubmissionSet.entryUUID
* group[=].element[=].target.equivalence = #unmatched
* group[=].element[=].target.comment = "TO DO"

* group[=].element[+].code = #SubmissionSet.availabilityStatus
* group[=].element[=].target.code = #List.status
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.submissionTime
* group[=].element[=].target.code = #List.date
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.title
* group[=].element[=].target.code = #List.title
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.patientID
* group[=].element[=].target.code = #List.subject.fr-core-patient
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.sourceID
* group[=].element[=].target.code = #List.extension:sourceId
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.uniqueID
* group[=].element[=].target.equivalence = #unmatched
* group[=].element[=].target.comment = "TO DO"

* group[=].element[+].code = #SubmissionSet.contentTypeCode
* group[=].element[=].target.code = #List.extension:designationType
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.author
* group[=].element[=].target.code = #List.source
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.homeCommunityID
* group[=].element[=].target.equivalence = #unmatched

* group[=].element[+].code = #DSubmissionSet.intendedRecipient
* group[=].element[=].target.equivalence = #unmatched
