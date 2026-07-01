# PatientId (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: PatientId (LM) 

 
Modèle logique de patientID. PatientID représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient. 

### Type

CX du standard HL7 v2.5.

### Contenu

Cette métadonnée contient le matricule INS (NIR ou NIA) du patient tel que défini dans le cadre juridique. Le tableau en section 3.7.4 présente les types d'identifiants attendus pour patientId, sourcePatientId et sourcePatientInfo. Les composants 1, 4 et 5 sont obligatoires.

**Usages:**

* Use this Logical Model: [Document Entry (LM)](StructureDefinition-DocumentEntry.md), [Folder (LM)](StructureDefinition-Folder.md) and [SubmissionSet (LM)](StructureDefinition-SubmissionSet.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-PatientId.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-PatientId.csv), [Excel](../StructureDefinition-PatientId.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PatientId",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PatientId",
  "version" : "0.1.0",
  "name" : "PatientId",
  "title" : "PatientId (LM)",
  "status" : "draft",
  "date" : "2026-07-01T12:46:56+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique de patientID.\nPatientID représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient. ",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PatientId",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "PatientId",
      "path" : "PatientId",
      "short" : "PatientId (LM)",
      "definition" : "Modèle logique de patientID.\nPatientID représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient. "
    },
    {
      "id" : "PatientId.CX1",
      "path" : "PatientId.CX1",
      "short" : "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique",
      "definition" : "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "PatientId.CX4",
      "path" : "PatientId.CX4",
      "short" : "Identifiant de l’autorité d’affectation de l’INS utilisé.",
      "definition" : "Cet identifiant, au format HL7 v.2.5 est constitué de trois sous-composants qui prennent les valeurs suivantes.\n|Valeur de Namespace ID (IS)| Valeur de Universal ID (ST)| Valeur de Universal ID type (ID)\nVide, pas de valeur |OID de l’autorité d’affectation de l’INS utilisé Valeur de Universal ID type (ID) ISO prise dans la liste des OID des autorités d'affectation des INS | ISO",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "PatientId.CX5",
      "path" : "PatientId.CX5",
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
