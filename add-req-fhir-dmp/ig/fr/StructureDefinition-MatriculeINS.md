# MatriculeINS - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: MatriculeINS 

 
Matricule de l'Identité Nationale de Santé (INS). Il correspond au NIR (Numéro d’Identification au Répertoire des personnes physiques) ou au NIA (Numéro Identifiant Attente) de l’individu). 

**Utilisations:**

* Utilise ce/t/te Modèle logique: [ActorPatient (LM)](StructureDefinition-ActorPatient.md) and [Identifiant](StructureDefinition-Identifiant.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/MatriculeINS)

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

 **Vue différentielle** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

 **Vue d'ensembleView** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(1 élément obligatoire(s) imbriqué(s))

 

Autres représentations du profil : [CSV](../StructureDefinition-MatriculeINS.csv), [Excel](../StructureDefinition-MatriculeINS.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "MatriculeINS",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/MatriculeINS",
  "version" : "0.1.0",
  "name" : "MatriculeINS",
  "title" : "MatriculeINS",
  "status" : "draft",
  "date" : "2026-07-02T14:16:33+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Matricule de l'Identité Nationale de Santé (INS). Il correspond au NIR (Numéro d’Identification au Répertoire des personnes physiques) ou au NIA (Numéro Identifiant Attente) de l’individu).",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/MatriculeINS",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "MatriculeINS",
      "path" : "MatriculeINS",
      "short" : "MatriculeINS",
      "definition" : "Matricule de l'Identité Nationale de Santé (INS). Il correspond au NIR (Numéro d’Identification au Répertoire des personnes physiques) ou au NIA (Numéro Identifiant Attente) de l’individu)."
    },
    {
      "id" : "MatriculeINS.matriculeINS",
      "path" : "MatriculeINS.matriculeINS",
      "short" : "Matricule INS",
      "definition" : "Matricule INS",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
