# Exemple TD3.1a - Compte rendu de consultation - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Example DocumentReference: Exemple TD3.1a - Compte rendu de consultation



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-td3-1a-cr-consultation",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
  },
  "contained" : [{
    "resourceType" : "Patient",
    "id" : "patient-source-td31a-cr",
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.213.1.4.8",
      "value" : "123456789012345"
    }]
  },
  {
    "resourceType" : "PractitionerRole",
    "id" : "practitionerrole-author-td31a-cr",
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
    "value" : "urn:oid:1.2.250.1.213.1.4.8.99999.101"
  },
  "status" : "current",
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
      "display" : "Compte rendu"
    }]
  }],
  "subject" : {
    "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8"
  },
  "date" : "2024-11-20T10:30:00+01:00",
  "author" : [{
    "reference" : "#practitionerrole-author-td31a-cr"
  }],
  "authenticator" : {
    "reference" : "#practitionerrole-author-td31a-cr"
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
      "contentType" : "application/pdf",
      "language" : "fr-FR",
      "url" : "https://dmp.esante.gouv.fr/fhir/Binary/cr-consultation-td31a",
      "size" : 45678,
      "hash" : "A/hMRrv6Y15BjSM8kMLidrz+mHc=",
      "title" : "CR Consultation 20/11/2024",
      "creation" : "2024-11-20T10:30:00+01:00"
    },
    "format" : {
      "system" : "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
      "code" : "urn:ihe:iti:xds-sd:pdf:2008",
      "display" : "PDF Non-Structured"
    }
  }],
  "context" : {
    "period" : {
      "start" : "2024-11-20T09:00:00+01:00",
      "end" : "2024-11-20T10:00:00+01:00"
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
      "reference" : "#patient-source-td31a-cr"
    }
  }
}

```
