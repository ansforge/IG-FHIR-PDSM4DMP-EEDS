# example-td2-iti105-publication-simplifiee - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Exemple DocumentReference: example-td2-iti105-publication-simplifiee

-------

**French**

-------

Profil: [PDSm Simplified Publish Document Reference](https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-simplified-publish.html)

**masterIdentifier**: [Uniform Resource Identifier (URI)](http://terminology.hl7.org/5.3.0/NamingSystem-uri.html)/urn:oid:1.2.250.1.213.1.4.8.99999.1

**status**: Current

**type**: Consult note

**subject**: `Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345`

**date**: 2026-06-12 10:00:00+0200

**author**: [Practitioner : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896](#hcexample-td2-iti105-publication-simplifiee/practitioner-author)

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Data** | **Title** |
| * | application/xml | `PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48Q2xpbmljYWxEb2N1bWVudCB4bWxucz0idXJuOmhsNy1vcmc6djMiLz4=` | Compte rendu de consultation |


-------

> **Narratif généré : Praticien #practitioner-author**  **identifier**: `urn:oid:1.2.250.1.71.4.2.1`/899700218896



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-td2-iti105-publication-simplifiee",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"]
  },
  "contained" : [{
    "resourceType" : "Practitioner",
    "id" : "practitioner-author",
    "identifier" : [{
      "system" : "urn:oid:1.2.250.1.71.4.2.1",
      "value" : "899700218896"
    }]
  }],
  "masterIdentifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:oid:1.2.250.1.213.1.4.8.99999.1"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "11488-4",
      "display" : "Consult note"
    }]
  },
  "subject" : {
    "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
  },
  "date" : "2026-06-12T10:00:00+02:00",
  "author" : [{
    "reference" : "#practitioner-author"
  }],
  "content" : [{
    "attachment" : {
      "contentType" : "application/xml",
      "data" : "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48Q2xpbmljYWxEb2N1bWVudCB4bWxucz0idXJuOmhsNy1vcmc6djMiLz4=",
      "title" : "Compte rendu de consultation"
    }
  }]
}

```
