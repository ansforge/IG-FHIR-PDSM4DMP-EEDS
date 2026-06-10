# Identifiant - Utilisation de PDSm pour le DMP dans le contexte d'EEDS v0.1.0

## Logical Model: Identifiant 

 
Identifiant de professionnel de santé, de patient, de SNR ou de système 

**Usages:**

* Use this Logical Model: [ActorXDS (LM)](StructureDefinition-ActorXDS.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-Identifiant.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-Identifiant.csv), [Excel](../StructureDefinition-Identifiant.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "Identifiant",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Identifiant",
  "version" : "0.1.0",
  "name" : "Identifiant",
  "title" : "Identifiant",
  "status" : "draft",
  "date" : "2026-06-10T16:12:06+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Identifiant de professionnel de santé, de patient, de SNR ou de système",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Identifiant",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Identifiant",
      "path" : "Identifiant",
      "short" : "Identifiant",
      "definition" : "Identifiant de professionnel de santé, de patient, de SNR ou de système"
    },
    {
      "id" : "Identifiant.value[x]",
      "path" : "Identifiant.value[x]",
      "short" : "Identifiant",
      "definition" : "Identifiant",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PSIdNat"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/MatriculeINS"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SNR"
      },
      {
        "code" : "string",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme|0.1.0"]
      }]
    }]
  }
}

```
