# submissionSetToPDSM - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## ConceptMap: submissionSetToPDSM (Experimental) 

 
Relation entre un lot de soummission du 'Volet Partage de Documents de Santé' et documentReference du 'Volet Partage de Documents de Santé en mobilité' 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "submissionSetToPDSM",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/ConceptMap/submissionSetToPDSM",
  "version" : "0.1.0",
  "name" : "submissionSetToPDSM",
  "title" : "submissionSetToPDSM",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-02T13:05:16+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Relation entre un lot de soummission   du 'Volet Partage de Documents de Santé' et  documentReference du 'Volet Partage de Documents de Santé en mobilité'",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "sourceUri" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet",
  "targetUri" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive",
  "group" : [{
    "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet",
    "sourceVersion" : "0.1.0",
    "target" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive",
    "targetVersion" : "3.1.0",
    "element" : [{
      "code" : "SubmissionSet.entryUUID",
      "target" : [{
        "equivalence" : "equivalent",
        "comment" : "List.identifier"
      }]
    },
    {
      "code" : "SubmissionSet.availabilityStatus",
      "target" : [{
        "code" : "List.status",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.submissionTime",
      "target" : [{
        "code" : "List.date",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.title",
      "target" : [{
        "code" : "List.title",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.comments",
      "target" : [{
        "equivalence" : "unmatched",
        "comment" : "TO DO"
      }]
    },
    {
      "code" : "SubmissionSet.patientID",
      "target" : [{
        "code" : "List.subject.fr-core-patient",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.sourceID",
      "target" : [{
        "code" : "List.extension:sourceId",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.uniqueID",
      "target" : [{
        "equivalence" : "unmatched",
        "comment" : "TO DO"
      }]
    },
    {
      "code" : "SubmissionSet.contentTypeCode",
      "target" : [{
        "code" : "List.extension:designationType",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.author",
      "target" : [{
        "code" : "List.source",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SubmissionSet.homeCommunityID",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "DSubmissionSet.intendedRecipient",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    }]
  }]
}

```
