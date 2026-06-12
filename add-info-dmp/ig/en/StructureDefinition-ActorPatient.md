# ActorPatient (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: ActorPatient (LM) 

 
Cet attribut représente l'acteur Patient. 

**Usages:**

* Use this Logical Model: [Author (LM)](StructureDefinition-Author.md) and [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-ActorPatient.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ActorPatient.csv), [Excel](../StructureDefinition-ActorPatient.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ActorPatient",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPatient",
  "version" : "0.1.0",
  "name" : "ActorPatient",
  "title" : "ActorPatient (LM)",
  "status" : "draft",
  "date" : "2026-06-12T15:09:19+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cet attribut représente l'acteur Patient.",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPatient",
  "baseDefinition" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorXDS|0.1.0",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ActorPatient",
      "path" : "ActorPatient",
      "short" : "ActorPatient (LM)",
      "definition" : "Cet attribut représente l'acteur Patient."
    },
    {
      "id" : "ActorPatient.XCN1",
      "path" : "ActorPatient.XCN1",
      "example" : [{
        "label" : "General",
        "valueString" : "124018852493334"
      }]
    },
    {
      "id" : "ActorPatient.XCN1.value[x]",
      "path" : "ActorPatient.XCN1.value[x]",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/MatriculeINS"
      }]
    },
    {
      "id" : "ActorPatient.XCN2",
      "path" : "ActorPatient.XCN2",
      "short" : "Nom du patient"
    },
    {
      "id" : "ActorPatient.XCN3",
      "path" : "ActorPatient.XCN3",
      "short" : "Prénom du patient"
    },
    {
      "id" : "ActorPatient.XCN9.composant2",
      "path" : "ActorPatient.XCN9.composant2",
      "short" : "Valeur de l'OID de l’autorité d’affectation de l’identifiant"
    },
    {
      "id" : "ActorPatient.XCN10",
      "path" : "ActorPatient.XCN10",
      "patternCode" : "D"
    },
    {
      "id" : "ActorPatient.XCN13",
      "path" : "ActorPatient.XCN13",
      "patternCode" : "NH"
    }]
  }
}

```
