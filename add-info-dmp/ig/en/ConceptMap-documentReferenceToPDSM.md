# documentReferenceToPDSM - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## ConceptMap: documentReferenceToPDSM (Experimental) 

 
Relation entre une fiche du 'Volet Partage de Documents de Santé' et documentReference du 'Volet Partage de Documents de Santé en mobilité' 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "documentReferenceToPDSM",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/ConceptMap/documentReferenceToPDSM",
  "version" : "0.1.0",
  "name" : "documentReferenceToPDSM",
  "title" : "documentReferenceToPDSM",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-06-16T12:17:15+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Relation entre une  fiche  du 'Volet Partage de Documents de Santé' et  documentReference du 'Volet Partage de Documents de Santé en mobilité'",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/DocumentEntry",
    "sourceVersion" : "0.1.0",
    "target" : "https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference",
    "targetVersion" : "3.1.0",
    "element" : [{
      "code" : "DocumentEntry.entryUUID",
      "target" : [{
        "code" : "DocumentReference.id",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.logicalId",
      "target" : [{
        "code" : "DocumentReference.identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.mimeType",
      "target" : [{
        "code" : "DocumentReference.content.attachment.contentType",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.availabilityStatus",
      "target" : [{
        "equivalence" : "inexact",
        "comment" : "#DocumentReference.status ou  #DocumentReference.extension:isArchived"
      }]
    },
    {
      "code" : "DocumentEntry.hash",
      "target" : [{
        "code" : "DocumentReference.content.attachment.hash",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.size",
      "target" : [{
        "code" : "DocumentReference.content.attachment.size",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.languageCode",
      "target" : [{
        "code" : "DocumentReference.content.attachment.language",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.legalAuthenticator",
      "target" : [{
        "code" : "DocumentReference.authenticator",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.repositoryUniqueId",
      "target" : [{
        "code" : "DocumentReference.content.attachment.url",
        "equivalence" : "inexact"
      }]
    },
    {
      "code" : "DocumentEntry.serviceStartTime",
      "target" : [{
        "code" : "DocumentReference.context.period.start",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.serviceEndTime",
      "target" : [{
        "code" : "DocumentReference.context.period.end",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.sourcePatientID",
      "target" : [{
        "code" : "DocumentReference.subject.fr-core-patient",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.sourcePatientInfo",
      "target" : [{
        "code" : "DocumentReference.context.sourcePatientInfo",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.URI",
      "target" : [{
        "code" : "DocumentReference.content.attachment.url",
        "equivalence" : "inexact"
      }]
    },
    {
      "code" : "DocumentEntry.title",
      "target" : [{
        "code" : "DocumentReference.content.attachment.title",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.comments",
      "target" : [{
        "code" : "DocumentReference.description",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.patientID",
      "target" : [{
        "code" : "DocumentReference.subject.fr-core-patient",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.uniqueId",
      "target" : [{
        "code" : "DocumentReference.identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.class",
      "target" : [{
        "code" : "DocumentReference.category",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.confidentiality",
      "target" : [{
        "code" : "DocumentReference.securityLabel",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.eventCodeList",
      "target" : [{
        "code" : "DocumentReference.context.event",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.format",
      "target" : [{
        "code" : "DocumentReference.content.format",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.healthcareFacilityTypeCode",
      "target" : [{
        "code" : "DocumentReference.context.facilityType",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.practiceSetting",
      "target" : [{
        "code" : "DocumentReference.context.practiceSetting",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.type",
      "target" : [{
        "code" : "DocumentReference.type",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.documentAvailability",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "DocumentEntry.homeCommunityId",
      "target" : [{
        "equivalence" : "unmatched"
      }]
    },
    {
      "code" : "DocumentEntry.creationTime",
      "target" : [{
        "code" : "DocumentReference.date",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "DocumentEntry.referenceIdList",
      "target" : [{
        "code" : "DocumentReference.context.related:referenceIdList",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
