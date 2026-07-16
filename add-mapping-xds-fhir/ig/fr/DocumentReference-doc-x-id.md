# doc-x-id - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Exemple DocumentReference: doc-x-id

-------

**French**

-------

Profil: [PDSm Comprehensive DocumentReference](https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-comprehensive-document-reference.html)

**masterIdentifier**: [Uniform Resource Identifier (URI)](http://terminology.hl7.org/5.5.0/NamingSystem-uri.html)/urn:oid:1.2.250.1.213.1.4.8.99999.0

**status**: Superseded

**type**: Consult note

**category**: Synthèse

**subject**: `Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345`

**date**: 2026-06-10 09:00:00+0200

**author**: [Practitioner : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896](#hcdoc-x-id/practitioner-author)

**authenticator**: [Practitioner : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896](#hcdoc-x-id/practitioner-author)

**securityLabel**: normal

> **content**

### Attachments

| | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| - | **ContentType** | **Language** | **Url** | **Size** | **Hash** | **Title** | **Creation** |
| * | application/xml | Français (France) | urn:oid:1.2.250.1.213.1.4.8.99999.0 | 80 | `A/hMRrv6Y15BjSM8kMLidrz+mHc=` | Compte rendu de consultation (v1) | 2026-06-10 09:00:00+0200 |

**format**: [IHE Format Code set for use with Document Sharing: urn:ihe:iti:xds:2017:mimeTypeSufficient](https://profiles.ihe.net/fhir/ihe.formatcode.fhir/1.1.0/CodeSystem-formatcode.html#formatcode-urn.58ihe.58iti.58xds.582017.58mimeTypeSufficient) (mimeType Sufficient)

### Contexts

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Period** | **FacilityType** | **PracticeSetting** | **SourcePatientInfo** |
| * | 2026-06-10 09:00:00+0200 --> (en cours) | Hospital | General medicine | [Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)](#hcdoc-x-id/patient-source) |

-------

> **Narratif généré : Patient #patient-source**  Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)
-------

-------

> **Narratif généré : Praticien #practitioner-author**  **identifier**: `urn:oid:1.2.250.1.71.4.2.1`/899700218896



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
