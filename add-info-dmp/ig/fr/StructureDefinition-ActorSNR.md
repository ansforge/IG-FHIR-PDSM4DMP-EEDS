# ActorSNR (LM) - Utilisation de PDSm pour le DMP dans le contexte d'EEDS v0.1.0

## Modèle logique: ActorSNR (LM) 

 
Cet attribut représente l'acteur SNR. 

**Utilisations:**

* Utilise ce/t/te Modèle logique: [Author (LM)](StructureDefinition-Author.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/ActorSNR)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

** Résumé **

 **Vue différentielle** 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

 **Vue d'ensembleView** 

Cette structure est dérivée de [ActorXDS](StructureDefinition-ActorXDS.md) 

** Résumé **

 

Autres représentations du profil : [CSV](../StructureDefinition-ActorSNR.csv), [Excel](../StructureDefinition-ActorSNR.xlsx) 



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
  "date" : "2026-06-10T15:59:45+00:00",
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
