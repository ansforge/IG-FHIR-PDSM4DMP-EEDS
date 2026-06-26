# SourcePatientId (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: SourcePatientId (LM) 

 
Cette métadonnée contient l’identifiant secondaire du patient dans le système d’information du producteur (IPP) ou l’INS, s’il n’y a pas d’identifiant secondaire. Pour les documents d’expression personnelle du patient, cette métadonnée contient l’INS du patient, à savoir le même identifiant que patientId. 

### Type

Elément de type CX du standard HL7 v2.5.

**Usages:**

* Use this Logical Model: [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-SourcePatientId.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-SourcePatientId.csv), [Excel](../StructureDefinition-SourcePatientId.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SourcePatientId",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SourcePatientId",
  "version" : "0.1.0",
  "name" : "SourcePatientId",
  "title" : "SourcePatientId (LM)",
  "status" : "draft",
  "date" : "2026-06-26T10:38:02+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cette métadonnée contient l’identifiant secondaire du patient dans le système d’information du producteur (IPP) ou l’INS, s’il n’y a pas d’identifiant secondaire. Pour les documents d’expression personnelle du patient, cette métadonnée contient l’INS du patient, à savoir le même identifiant que patientId. ",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SourcePatientId",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SourcePatientId",
      "path" : "SourcePatientId",
      "short" : "SourcePatientId (LM)",
      "definition" : "Cette métadonnée contient l’identifiant secondaire du patient dans le système d’information du producteur (IPP) ou l’INS, s’il n’y a pas d’identifiant secondaire. Pour les documents d’expression personnelle du patient, cette métadonnée contient l’INS du patient, à savoir le même identifiant que patientId. "
    },
    {
      "id" : "SourcePatientId.CX1",
      "path" : "SourcePatientId.CX1",
      "short" : "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique",
      "definition" : "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "SourcePatientId.CX4",
      "path" : "SourcePatientId.CX4",
      "short" : "Identifiant de l’autorité d’affectation de l’INS utilisé.",
      "definition" : "Identifiant de l’autorité d’affectation de l’INS utilisé.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientId.CX5",
      "path" : "SourcePatientId.CX5",
      "short" : " 'NH' pour un maticule INS tel que défini dans le cadre juridique",
      "definition" : " 'NH' pour un maticule INS tel que défini dans le cadre juridique",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
