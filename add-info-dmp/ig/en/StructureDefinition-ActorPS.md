# ActorPS (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: ActorPS (LM) 

 
Cet attribut représente un acteur PS. 

**Usages:**

* Use this Logical Model: [Author (LM)](StructureDefinition-Author.md) and [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-ActorPS.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ActorPS.csv), [Excel](../StructureDefinition-ActorPS.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ActorPS",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPS",
  "version" : "0.1.0",
  "name" : "ActorPS",
  "title" : "ActorPS (LM)",
  "status" : "draft",
  "date" : "2026-06-17T08:38:09+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "\nCet attribut représente un acteur PS.\n",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "ActorXDSCDA",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "ActorXDSCDA",
    "comment" : "Mapping CDA"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPS",
  "baseDefinition" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorXDS|0.1.0",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ActorPS",
      "path" : "ActorPS",
      "short" : "ActorPS (LM)",
      "definition" : "\nCet attribut représente un acteur PS.\n"
    },
    {
      "id" : "ActorPS.XCN1",
      "path" : "ActorPS.XCN1",
      "example" : [{
        "label" : "Professionnel avec un identifiant national RPPS (préfixe 8)",
        "valueString" : "801234567890"
      },
      {
        "label" : "Professionnel avec un identifiant interne dans une structure de santé FINESS",
        "valueString" : "3750100125/1453"
      }]
    },
    {
      "id" : "ActorPS.XCN1.value[x]",
      "path" : "ActorPS.XCN1.value[x]",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PSIdNat"
      }]
    },
    {
      "id" : "ActorPS.XCN2",
      "path" : "ActorPS.XCN2",
      "short" : "Nom d'exercice du professionnel"
    },
    {
      "id" : "ActorPS.XCN3",
      "path" : "ActorPS.XCN3",
      "short" : "Prénom usuel de la personne"
    },
    {
      "id" : "ActorPS.XCN9.composant2",
      "path" : "ActorPS.XCN9.composant2",
      "patternString" : "1.2.250.1.71.4.2.1"
    },
    {
      "id" : "ActorPS.XCN10",
      "path" : "ActorPS.XCN10",
      "patternCode" : "D"
    },
    {
      "id" : "ActorPS.XCN13",
      "path" : "ActorPS.XCN13",
      "patternCode" : "IDNPS"
    }]
  }
}

```
