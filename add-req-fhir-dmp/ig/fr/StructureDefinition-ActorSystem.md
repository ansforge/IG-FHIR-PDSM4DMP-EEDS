# ActorSystem (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: ActorSystem (LM) 

 
Cet attribut représente l'acteur System. 

**Utilisations:**

* Utilise ce/t/te Modèle logique: [Author (LM)](StructureDefinition-Author.md) and [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/ActorSystem)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

** Résumé **

**Structures**

Cette structure fait référence à ces autres structures:

* [IdentifiantSysteme (https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme|0.1.0)](StructureDefinition-IdentifiantSysteme.md)

 **Vue différentielle** 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

 **Vue d'ensembleView** 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

** Résumé **

**Structures**

Cette structure fait référence à ces autres structures:

* [IdentifiantSysteme (https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme|0.1.0)](StructureDefinition-IdentifiantSysteme.md)

 

Autres représentations du profil : [CSV](../StructureDefinition-ActorSystem.csv), [Excel](../StructureDefinition-ActorSystem.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ActorSystem",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSystem",
  "version" : "0.1.0",
  "name" : "ActorSystem",
  "title" : "ActorSystem (LM)",
  "status" : "draft",
  "date" : "2026-07-02T13:38:57+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cet attribut représente l'acteur System.",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSystem",
  "baseDefinition" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorXDS|0.1.0",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ActorSystem",
      "path" : "ActorSystem",
      "short" : "ActorSystem (LM)",
      "definition" : "Cet attribut représente l'acteur System."
    },
    {
      "id" : "ActorSystem.XCN1",
      "path" : "ActorSystem.XCN1",
      "example" : [{
        "label" : "système avec un identifiant interne dans une structure de santé FINESS",
        "valueString" : "3750100125/88"
      }]
    },
    {
      "id" : "ActorSystem.XCN1.value[x]",
      "path" : "ActorSystem.XCN1.value[x]",
      "type" : [{
        "code" : "string",
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme|0.1.0"]
      }]
    },
    {
      "id" : "ActorSystem.XCN2",
      "path" : "ActorSystem.XCN2",
      "short" : "Nom du système"
    },
    {
      "id" : "ActorSystem.XCN3",
      "path" : "ActorSystem.XCN3",
      "short" : "Nom du modèle pour les dispositifs ou dénomination pour les autres systèmes."
    },
    {
      "id" : "ActorSystem.XCN9.composant2",
      "path" : "ActorSystem.XCN9.composant2",
      "patternString" : "1.2.250.1.71.4.2.1"
    },
    {
      "id" : "ActorSystem.XCN10",
      "path" : "ActorSystem.XCN10",
      "patternCode" : "U"
    },
    {
      "id" : "ActorSystem.XCN13",
      "path" : "ActorSystem.XCN13",
      "patternCode" : "RI"
    }]
  }
}

```
