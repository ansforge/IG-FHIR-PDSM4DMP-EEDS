# IdentifiantSysteme - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Profil du type de données: IdentifiantSysteme 

 
Identification d'un systeme 
L’identification du ssyteme est construite selon le tableau dessous : 
* 1 + Identifiant cabinet ADELI/Identifiant interne du système dans la structure
* 3 + FINESS/Identifiant interne du système dans la structure
* 4 + SIREN/Identifiant interne du système dans la structure
* 5 + SIRET/Identifiant interne du système dans la structure
* 6 + Identifiant cabinet RPPS/Identifiant interne du système dans la structure
 

**Utilisations:**

* Utilise ce/t/te Profil de type primitif: [ActorSystem (LM)](StructureDefinition-ActorSystem.md) and [Identifiant](StructureDefinition-Identifiant.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/IdentifiantSysteme)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau des éléments clés](#tabs-key) 
*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

#### Contraintes

Cette structure est dérivée de [string](http://hl7.org/fhir/R4/datatypes.html#string) 

#### Contraintes

Cette structure est dérivée de [string](http://hl7.org/fhir/R4/datatypes.html#string) 

** Résumé **

 **Vue des éléments clés** 

#### Contraintes

 **Vue différentielle** 

Cette structure est dérivée de [string](http://hl7.org/fhir/R4/datatypes.html#string) 

 **Vue d'ensembleView** 

#### Contraintes

Cette structure est dérivée de [string](http://hl7.org/fhir/R4/datatypes.html#string) 

** Résumé **

 

Autres représentations du profil : [CSV](../StructureDefinition-IdentifiantSysteme.csv), [Excel](../StructureDefinition-IdentifiantSysteme.xlsx), [Schematron](../StructureDefinition-IdentifiantSysteme.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "IdentifiantSysteme",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/IdentifiantSysteme",
  "version" : "0.1.0",
  "name" : "IdentifiantSysteme",
  "title" : "IdentifiantSysteme",
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
  "description" : "Identification d'un systeme\n\nL’identification du ssyteme  est construite selon le tableau dessous :\n- 1 + Identifiant cabinet ADELI/Identifiant interne du système dans la structure \n- 3 + FINESS/Identifiant interne du système dans la structure  \n- 4 + SIREN/Identifiant interne du système dans la structure \n- 5 + SIRET/Identifiant interne du système dans la structure \n- 6 + Identifiant cabinet RPPS/Identifiant interne du système dans la structure \n",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "primitive-type",
  "abstract" : false,
  "type" : "string",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/string|4.0.1",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "string",
      "path" : "string"
    }]
  }
}

```
