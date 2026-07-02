# PSIdNat - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: PSIdNat 

 
Identification nationale principale du professionnel propre aux SI de l’ANS et au CI-SIS. (Correspondance dans le MOS : idNat_PS) 
L’identification nationale du PS est construite selon le tableau dessous : 
* 0 + N° ADELI
* 1 + Identifiant cabinet ADELI/identifiant interne
* 3 + FINESS/identifiant interne
* 4 + SIREN/identifiant interne
* 5 + SIRET/identifiant interne
* 6 + Identifiant cabinet RPPS/identifiant interne
* 8 + N° RPPS
 

**Utilisations:**

* Utilise ce/t/te Modèle logique: [ActorPS (LM)](StructureDefinition-ActorPS.md) and [Identifiant](StructureDefinition-Identifiant.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/PSIdNat)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

#### Contraintes

#### Contraintes

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(1 élément obligatoire(s) imbriqué(s))

 **Vue différentielle** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

#### Contraintes

 **Vue d'ensembleView** 

#### Contraintes

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(1 élément obligatoire(s) imbriqué(s))

 

Autres représentations du profil : [CSV](../StructureDefinition-PSIdNat.csv), [Excel](../StructureDefinition-PSIdNat.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PSIdNat",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PSIdNat",
  "version" : "0.1.0",
  "name" : "PSIdNat",
  "title" : "PSIdNat",
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
  "description" : "Identification nationale principale du professionnel propre aux SI de l’ANS et au CI-SIS. (Correspondance dans le MOS : idNat_PS) \n\nL’identification nationale du PS est construite selon le tableau dessous :\n-  0 + N° ADELI \n- 1 + Identifiant cabinet ADELI/identifiant interne \n- 3 + FINESS/identifiant interne \n- 4 + SIREN/identifiant interne \n- 5 + SIRET/identifiant interne \n- 6 + Identifiant cabinet RPPS/identifiant interne \n- 8 + N° RPPS \n",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PSIdNat",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "PSIdNat",
      "path" : "PSIdNat",
      "short" : "PSIdNat",
      "definition" : "Identification nationale principale du professionnel propre aux SI de l’ANS et au CI-SIS. (Correspondance dans le MOS : idNat_PS) \n\nL’identification nationale du PS est construite selon le tableau dessous :\n-  0 + N° ADELI \n- 1 + Identifiant cabinet ADELI/identifiant interne \n- 3 + FINESS/identifiant interne \n- 4 + SIREN/identifiant interne \n- 5 + SIRET/identifiant interne \n- 6 + Identifiant cabinet RPPS/identifiant interne \n- 8 + N° RPPS \n"
    },
    {
      "id" : "PSIdNat.PSIdNat",
      "path" : "PSIdNat.PSIdNat",
      "short" : "PSIdNat",
      "definition" : "PSIdNat",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "constraint" : [{
        "key" : "PSIdNat-invariant",
        "severity" : "error",
        "human" : "Le numéro PSIdNat doit être un entier commençant par 0, 1, 3, 4, 5, 6 ou 8",
        "expression" : "$this.matches('^(0|1|3|4|5|6|8)\\d*$')",
        "source" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PSIdNat|0.1.0"
      }]
    }]
  }
}

```
