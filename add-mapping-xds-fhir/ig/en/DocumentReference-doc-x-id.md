# doc-x-id - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Example DocumentReference: doc-x-id



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "doc-x-id",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
  },
  "contained" : [{
    "resourceType" : "Patient",
    "id" : "patient-source",
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.213.1.4.8",
      "value" : "123456789012345"
    }]
  },
  {
    "resourceType" : "Practitioner",
    "id" : "practitioner-author",
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.71.4.2.1",
      "value" : "899700218896"
    }]
  }],
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.250.1.213.1.4.8.99999.0"
  },
  "status" : "superseded",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "11488-4",
      "display" : "Consult note"
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
  "date" : "2026-06-10T09:00:00+02:00",
  "author" : [{
    "reference" : "#practitioner-author"
  }],
  "authenticator" : {
    "reference" : "#practitioner-author"
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
      "contentType" : "application/xml",
      "language" : "fr-FR",
      "url" : "urn:oid:1.2.250.1.213.1.4.8.99999.0",
      "size" : 80,
      "hash" : "A/hMRrv6Y15BjSM8kMLidrz+mHc=",
      "title" : "Compte rendu de consultation (v1)",
      "creation" : "2026-06-10T09:00:00+02:00"
    },
    "format" : {
      "system" : "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
      "code" : "urn:ihe:iti:xds:2017:mimeTypeSufficient",
      "display" : "mimeType Sufficient"
    }
  }],
  "context" : {
    "period" : {
      "start" : "2026-06-10T09:00:00+02:00"
    },
    "facilityType" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "22232009",
        "display" : "Hospital"
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
      "reference" : "#patient-source"
    }
  }
}

```
