# StructIdNat - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: StructIdNat 

 
Identification nationale principale d’une structure propre aux SI de l'ANS et au CI-SIS 4. 
L’identification nationale d’une structure est construite selon le tableau dessous : 
* 0 + Identifiant cabinet ADELI
* 1 + N° FINESS 2 + N° SIREN
* 3 + N° SIRET
* 4 + N° RPPS-rang
* Néant + N° technique
 

**Utilisations:**

* Utilise ce/t/te Modèle logique: [AuthorInstitution (LM)](StructureDefinition-AuthorInstitution.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructIdNat)

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

 

Autres représentations du profil : [CSV](../StructureDefinition-StructIdNat.csv), [Excel](../StructureDefinition-StructIdNat.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "StructIdNat",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/StructIdNat",
  "version" : "0.1.0",
  "name" : "StructIdNat",
  "title" : "StructIdNat",
  "status" : "draft",
  "date" : "2026-06-24T15:05:22+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Identification nationale principale d’une structure propre aux SI de l'ANS et au CI-SIS 4. \n\nL’identification nationale d’une structure est construite selon le tableau dessous :\n-  0 + Identifiant cabinet ADELI \n- 1 + N° FINESS 2 + N° SIREN \n- 3 + N° SIRET \n- 4 + N° RPPS-rang \n- Néant + N° technique \n",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/StructIdNat",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "StructIdNat",
      "path" : "StructIdNat",
      "short" : "StructIdNat",
      "definition" : "Identification nationale principale d’une structure propre aux SI de l'ANS et au CI-SIS 4. \n\nL’identification nationale d’une structure est construite selon le tableau dessous :\n-  0 + Identifiant cabinet ADELI \n- 1 + N° FINESS 2 + N° SIREN \n- 3 + N° SIRET \n- 4 + N° RPPS-rang \n- Néant + N° technique \n"
    },
    {
      "id" : "StructIdNat.StructIdNat",
      "path" : "StructIdNat.StructIdNat",
      "short" : "StructIdNat",
      "definition" : "StructIdNat",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
