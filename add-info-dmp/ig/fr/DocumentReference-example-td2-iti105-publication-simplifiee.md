# example-td2-iti105-publication-simplifiee - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Exemple DocumentReference: example-td2-iti105-publication-simplifiee

-------

**French**

-------

Profil: [PDSm Simplified Publish Document Reference](https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-simplified-publish.html)

**status**: Current

**type**: Compte rendu de consultation

**subject**: `Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345`

**date**: 2026-06-12 10:00:00+0200

> **content**

### Attachments

| | | | |
| :--- | :--- | :--- | :--- |
| - | **ContentType** | **Data** | **Title** |
| * | application/xml | `PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPENsaW5pY2FsRG9jdW1lbnQgeG1sbnM9InVybjpobDctb3JnOmhpcHAiPgogIDwhLS0gZXhlbXBsZSBDREEgLS0+CjwvQ2xpbmljYWxEb2N1bWVudD4=` | Compte rendu de consultation |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "example-td2-iti105-publication-simplifiee",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-simplified-publish"]
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "11488-4",
      "display" : "Compte rendu de consultation"
    }]
  },
  "subject" : {
    "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
  },
  "date" : "2026-06-12T10:00:00+02:00",
  "content" : [{
    "attachment" : {
      "contentType" : "application/xml",
      "data" : "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPENsaW5pY2FsRG9jdW1lbnQgeG1sbnM9InVybjpobDctb3JnOmhpcHAiPgogIDwhLS0gZXhlbXBsZSBDREEgLS0+CjwvQ2xpbmljYWxEb2N1bWVudD4=",
      "title" : "Compte rendu de consultation"
    }
  }]
}

```
