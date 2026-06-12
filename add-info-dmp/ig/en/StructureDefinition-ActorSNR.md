# ActorSNR (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: ActorSNR (LM) 

 
Cet attribut représente l'acteur SNR. 

**Usages:**

* Use this Logical Model: [Author (LM)](StructureDefinition-Author.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-ActorSNR.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ActorSNR.csv), [Excel](../StructureDefinition-ActorSNR.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ActorSNR",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSNR",
  "version" : "0.1.0",
  "name" : "ActorSNR",
  "title" : "ActorSNR (LM)",
  "status" : "draft",
  "date" : "2026-06-12T15:45:22+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cet attribut représente l'acteur SNR.",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSNR",
  "baseDefinition" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorXDS|0.1.0",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ActorSNR",
      "path" : "ActorSNR",
      "short" : "ActorSNR (LM)",
      "definition" : "Cet attribut représente l'acteur SNR."
    },
    {
      "id" : "ActorSNR.XCN1",
      "path" : "ActorSNR.XCN1",
      "example" : [{
        "label" : "General",
        "valueString" : "9.8.7.6.5.4.3.2.1"
      }]
    },
    {
      "id" : "ActorSNR.XCN1.value[x]",
      "path" : "ActorSNR.XCN1.value[x]",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SNR"
      }]
    },
    {
      "id" : "ActorSNR.XCN2",
      "path" : "ActorSNR.XCN2",
      "short" : "Nom du système"
    },
    {
      "id" : "ActorSNR.XCN3",
      "path" : "ActorSNR.XCN3",
      "short" : "Nom du modèle pour les dispositifs ou dénomination pour les autres systèmes."
    },
    {
      "id" : "ActorSNR.XCN9.composant2",
      "path" : "ActorSNR.XCN9.composant2",
      "short" : "OID de l'éditeur",
      "example" : [{
        "label" : "General",
        "valueString" : "9.8.7.6.5.4.3.2.1."
      }]
    },
    {
      "id" : "ActorSNR.XCN10",
      "path" : "ActorSNR.XCN10",
      "patternCode" : "U"
    },
    {
      "id" : "ActorSNR.XCN13",
      "path" : "ActorSNR.XCN13",
      "patternCode" : "RI"
    }]
  }
}

```
