# Exemple TD3.1a - Document FHIR (Bundle) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Exemple DocumentReference: Exemple TD3.1a - Document FHIR (Bundle)

-------

**French**

-------

Profil: [PDSm Comprehensive DocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-comprehensive-document-reference.html)

**masterIdentifier**: [URI](http://terminology.hl7.org/5.0.0/NamingSystem-uri.html)/urn:oid:1.2.250.1.213.1.4.8.99999.103

**status**: Current

**type**: Patient summary Document

**category**: Synthèse

**subject**: `Patient?identifier=urn:oid:1.2.250.1.213.1.4.8`

**date**: 2024-11-20 11:00:00+0100

**author**: [PractitionerRole : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896](#hcexample-td3-1a-fhir-document/practitionerrole-author-td31a-fhir)

**authenticator**: [PractitionerRole : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896](#hcexample-td3-1a-fhir-document/practitionerrole-author-td31a-fhir)

**securityLabel**: normal

> **content**

### Attachments

| | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Url** | **Size** | **Hash** | **Title** | **Creation** |
| * | application/fhir+json | Français (France) | Bundle/fhir-document-td31a | 8192 | `C/jOTtuBZ37DlUN0mNPjfsu1nHf=` | Synthèse patient 20/11/2024 | 2024-11-20 11:00:00+0100 |

**format**: [IHE Format Code set for use with Document Sharing: urn:ihe:iti:xds:2017:mimeTypeSufficient](https://profiles.ihe.net/fhir/ihe.formatcode.fhir/1.1.0/CodeSystem-formatcode.html#formatcode-urn.58ihe.58iti.58xds.582017.58mimeTypeSufficient) (mimeType Sufficient)

### Contexts

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Period** | **FacilityType** | **PracticeSetting** | **SourcePatientInfo** |
| * | 2024-11-20 09:00:00+0100 --> (en cours) | Ambulatory care site | General medicine | [Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)](#hcexample-td3-1a-fhir-document/patient-source-td31a-fhir) |

-------

> **Narratif généré : Patient #patient-source-td31a-fhir**  Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)
-------

-------

> **Narratif généré : PractitionerRole #practitionerrole-author-td31a-fhir**  

Profil: [AS PractitionerRole Profile](https://interop.esante.gouv.fr/ig/fhir/annuaire/1.0.1/StructureDefinition-as-practitionerrole.html)

**identifier**: `urn:oid:1.2.250.1.71.4.2.1`/899700218896



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-td3-1a-fhir-document",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
  },
  "contained" : [{
    "resourceType" : "Patient",
    "id" : "patient-source-td31a-fhir",
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.213.1.4.8",
      "value" : "123456789012345"
    }]
  },
  {
    "resourceType" : "PractitionerRole",
    "id" : "practitionerrole-author-td31a-fhir",
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
    "value" : "urn:oid:1.2.250.1.213.1.4.8.99999.103"
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
    "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8"
  },
  "date" : "2024-11-20T11:00:00+01:00",
  "author" : [{
    "reference" : "#practitionerrole-author-td31a-fhir"
  }],
  "authenticator" : {
    "reference" : "#practitionerrole-author-td31a-fhir"
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
      "url" : "Bundle/fhir-document-td31a",
      "size" : 8192,
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
      "reference" : "#patient-source-td31a-fhir"
    }
  }
}

```
