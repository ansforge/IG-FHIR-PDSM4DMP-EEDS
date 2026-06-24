# Identifiant - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: Identifiant 

 
Identifiant de professionnel de santé, de patient, de SNR ou de système 

**Utilisations:**

* Utilise ce/t/te Modèle logique: [ActorXDS (LM)](StructureDefinition-ActorXDS.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/Identifiant)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(1 élément obligatoire(s) imbriqué(s))

**Structures**

Cette structure fait référence à ces autres structures:

* [IdentifiantSysteme (https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme|0.1.0)](StructureDefinition-IdentifiantSysteme.md)

 **Vue différentielle** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

 **Vue d'ensembleView** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(1 élément obligatoire(s) imbriqué(s))

**Structures**

Cette structure fait référence à ces autres structures:

* [IdentifiantSysteme (https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme|0.1.0)](StructureDefinition-IdentifiantSysteme.md)

 

Autres représentations du profil : [CSV](../StructureDefinition-Identifiant.csv), [Excel](../StructureDefinition-Identifiant.xlsx) 



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
  "date" : "2026-06-24T15:07:59+00:00",
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
