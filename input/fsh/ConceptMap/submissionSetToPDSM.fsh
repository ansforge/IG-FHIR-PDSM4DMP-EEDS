Instance: submissionSetToPDSM
InstanceOf: ConceptMap
Usage: #definition
Description: """
 Relation entre un lot de soummission   du 'Volet Partage de Documents de Santé' et  documentReference du 'Volet Partage de Documents de Santé en mobilité'
"""

* name = "submissionSetToPDSM"
* title = "submissionSetToPDSM"
* status = #draft
* experimental = true
* sourceUri = "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet"
* targetUri = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"
* group[0].source = "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet"
* group[=].target = "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"

* group[=].element[0].code = #SubmissionSet.entryUUID
* group[=].element[=].target.code = #List.identifier:entryUUID
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.availabilityStatus
* group[=].element[=].target.code = #List.status
* group[=].element[=].target.equivalence = #inexact
* group[=].element[=].target.comment = "La valeur Archived n'a pas d'équivalent dans List.status : elle est portée par l'extension PDSm_isArchived"

* group[=].element[+].code = #SubmissionSet.submissionTime
* group[=].element[=].target.code = #List.date
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.title
* group[=].element[=].target.code = #List.title
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.comments
* group[=].element[=].target.code = #List.note
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.patientID
* group[=].element[=].target.code = #List.subject
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.sourceID
* group[=].element[=].target.code = #List.extension:sourceId
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.uniqueID
* group[=].element[=].target.code = #List.identifier:uniqueId
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.contentTypeCode
* group[=].element[=].target.code = #List.extension:designationType
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.author
* group[=].element[=].target.code = #List.source
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #SubmissionSet.homeCommunityID
* group[=].element[=].target.equivalence = #unmatched

* group[=].element[+].code = #SubmissionSet.intendedRecipient
* group[=].element[=].target.code = #List.extension:intendedRecipient
* group[=].element[=].target.equivalence = #equivalent
