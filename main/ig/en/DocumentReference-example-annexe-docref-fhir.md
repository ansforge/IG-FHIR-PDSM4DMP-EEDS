# Exemple Annexe - DocumentReference pointant vers un document FHIR (Bundle) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Example DocumentReference: Exemple Annexe - DocumentReference pointant vers un document FHIR (Bundle)



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-annexe-docref-fhir",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
  },
  "contained" : [{
    "resourceType" : "Patient",
    "id" : "patient-source-annexe-fhir",
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.213.1.4.8",
      "value" : "123456789012345"
    }]
  },
  {
    "resourceType" : "PractitionerRole",
    "id" : "practitionerrole-author-annexe-fhir",
    "meta" : {
      "profile" : ["https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole"]
    },
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.71.4.2.1",
      "value" : "899700218896"
    }]
  }],
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.250.1.213.1.4.8.99999.202"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "60591-5",
      "display" : "Patient summary Document"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
      "code" : "11",
      "display" : "Synthèse"
    }]
  }],
  "subject" : {
    "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
  },
  "date" : "2024-11-20T11:00:00+01:00",
  "author" : [{
    "reference" : "#practitionerrole-author-annexe-fhir"
  }],
  "authenticator" : {
    "reference" : "#practitionerrole-author-annexe-fhir"
  },
  "securityLabel" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
      "code" : "N",
      "display" : "normal"
    }]
  }],
  "content" : [{
    "attachment" : {
      "contentType" : "application/fhir+json",
      "language" : "fr-FR",
      "url" : "Bundle/example-annexe-fhir-document",
      "size" : 4096,
      "hash" : "C/jOTtuBZ37DlUN0mNPjfsu1nHf=",
      "title" : "Synthèse patient 20/11/2024",
      "creation" : "2024-11-20T11:00:00+01:00"
    },
    "format" : {
      "system" : "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
      "code" : "urn:ihe:iti:xds:2017:mimeTypeSufficient",
      "display" : "mimeType Sufficient"
    }
  }],
  "context" : {
    "period" : {
      "start" : "2024-11-20T09:00:00+01:00"
    },
    "facilityType" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "35971002",
        "display" : "Ambulatory care site"
      }]
    },
    "practiceSetting" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "394802001",
        "display" : "General medicine"
      }]
    },
    "sourcePatientInfo" : {
      "reference" : "#patient-source-annexe-fhir"
    }
  }
}

```
