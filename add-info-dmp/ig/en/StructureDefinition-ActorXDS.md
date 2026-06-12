# ActorXDS (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: ActorXDS (LM) 

 
Cet attribut représente un acteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient. 
XCN de HL7 v2.5 

**Usages:**

* Derived from this Logical Model: [ActorPS (LM)](StructureDefinition-ActorPS.md), [ActorPatient (LM)](StructureDefinition-ActorPatient.md), [ActorSNR (LM)](StructureDefinition-ActorSNR.md) and [ActorSystem (LM)](StructureDefinition-ActorSystem.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-ActorXDS.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ActorXDS.csv), [Excel](../StructureDefinition-ActorXDS.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ActorXDS",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorXDS",
  "version" : "0.1.0",
  "name" : "ActorXDS",
  "title" : "ActorXDS (LM)",
  "status" : "draft",
  "date" : "2026-06-12T16:24:39+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cet attribut représente un acteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient. \n\nXCN de HL7 v2.5",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorXDS",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ActorXDS",
      "path" : "ActorXDS",
      "short" : "ActorXDS (LM)",
      "definition" : "Cet attribut représente un acteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient. \n\nXCN de HL7 v2.5",
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "ActorXDS"
      }]
    },
    {
      "id" : "ActorXDS.XCN1",
      "path" : "ActorXDS.XCN1",
      "short" : "Identifiant de l'acteur",
      "definition" : "Identifiant de l'acteur",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Identifiant"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "author/assignedAuthor/id@extension"
      }]
    },
    {
      "id" : "ActorXDS.XCN2",
      "path" : "ActorXDS.XCN2",
      "short" : "Nom d'exercice du professionnel, nom du patient, nom du système.",
      "definition" : "Nom d'exercice du professionnel, nom du patient, nom du système.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "author/assignedAuthor/assignedPerson/name/family"
      }]
    },
    {
      "id" : "ActorXDS.XCN3",
      "path" : "ActorXDS.XCN3",
      "short" : "Prénom usuel de la personne (par défaut le premier prénom), nom du modèle pour les dispositifs ou dénomination pour les autres systèmes.",
      "definition" : "Prénom usuel de la personne (par défaut le premier prénom), nom du modèle pour les dispositifs ou dénomination pour les autres systèmes.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "author/assignedAuthor/assignedPerson/name/given"
      }]
    },
    {
      "id" : "ActorXDS.XCN9",
      "path" : "ActorXDS.XCN9",
      "short" : " Autorité d’affectation",
      "definition" : " Autorité d’affectation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "NA"
      }]
    },
    {
      "id" : "ActorXDS.XCN9.composant1",
      "path" : "ActorXDS.XCN9.composant1",
      "short" : "Vide, pas de valeur",
      "definition" : "Vide, pas de valeur",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "NA"
      }]
    },
    {
      "id" : "ActorXDS.XCN9.composant2",
      "path" : "ActorXDS.XCN9.composant2",
      "short" : "Valeur de Universal ID",
      "definition" : "Valeur de Universal ID",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "author/assignedAuthor/id@root"
      }]
    },
    {
      "id" : "ActorXDS.XCN9.composant3",
      "path" : "ActorXDS.XCN9.composant3",
      "short" : "Valeur de Universal ID type (ID)",
      "definition" : "Valeur de Universal ID type (ID)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "NA"
      }]
    },
    {
      "id" : "ActorXDS.XCN10",
      "path" : "ActorXDS.XCN10",
      "short" : "Type de nom : Valeur en fonction de l’auteur :  D, pour les personnes physiques, -U, pour les systèmes.",
      "definition" : "Type de nom : Valeur en fonction de l’auteur :  D, pour les personnes physiques, -U, pour les systèmes.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "NA"
      }]
    },
    {
      "id" : "ActorXDS.XCN13",
      "path" : "ActorXDS.XCN13",
      "short" : "Type d’identifiant",
      "definition" : "Type d’identifiant",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "ActorXDSCDA",
        "map" : "Valeur ne provenant pas de l’en-tête CDA"
      }]
    }]
  }
}

```
