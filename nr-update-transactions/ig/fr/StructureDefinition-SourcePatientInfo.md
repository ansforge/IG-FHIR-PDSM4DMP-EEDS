# SourcePatientInfo (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: SourcePatientInfo (LM) 

 
Cette métadonnée contient les traits d’identité du patient concerné par le document, connus par le producteur du document. Les informations présentes dans la métadonnée sourcePatientInfo ne doivent en aucun cas être réutilisées pour calculer un identifiant, ni être mises à jour après la soumission du document. 

### Type

Un à plusieurs champs du segment PID du standard HL7 v2.5, un champ du segment PID pouvant lui-même être constitué d’une liste (voir les cardinalités des champs dans le tableau du paragraphe "Contenu" ci-après).

**Utilisations:**

* Utilise ce/t/te Modèle logique: [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/SourcePatientInfo)

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

 

Autres représentations du profil : [CSV](../StructureDefinition-SourcePatientInfo.csv), [Excel](../StructureDefinition-SourcePatientInfo.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SourcePatientInfo",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SourcePatientInfo",
  "version" : "0.1.0",
  "name" : "SourcePatientInfo",
  "title" : "SourcePatientInfo (LM)",
  "status" : "draft",
  "date" : "2026-06-24T15:11:11+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cette métadonnée contient les traits d’identité du patient concerné par le document, connus par le producteur du document. Les informations présentes dans la métadonnée sourcePatientInfo ne doivent en aucun cas être réutilisées pour calculer un identifiant, ni être mises à jour après la soumission du document. \n",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SourcePatientInfo",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SourcePatientInfo",
      "path" : "SourcePatientInfo",
      "short" : "SourcePatientInfo (LM)",
      "definition" : "Cette métadonnée contient les traits d’identité du patient concerné par le document, connus par le producteur du document. Les informations présentes dans la métadonnée sourcePatientInfo ne doivent en aucun cas être réutilisées pour calculer un identifiant, ni être mises à jour après la soumission du document. \n"
    },
    {
      "id" : "SourcePatientInfo.PID3",
      "path" : "SourcePatientInfo.PID3",
      "short" : "Liste des identifiants du patient",
      "definition" : "Liste des identifiants du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID5",
      "path" : "SourcePatientInfo.PID5",
      "short" : "Nom et prénoms du patient",
      "definition" : "Nom et prénoms du patient",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID7",
      "path" : "SourcePatientInfo.PID7",
      "short" : "Date/heure de naissance du patient",
      "definition" : "Date/heure de naissance du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID8",
      "path" : "SourcePatientInfo.PID8",
      "short" : "Sexe du patient",
      "definition" : "Sexe du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID11",
      "path" : "SourcePatientInfo.PID11",
      "short" : "Adresse du patient",
      "definition" : "Adresse du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID13",
      "path" : "SourcePatientInfo.PID13",
      "short" : "Téléphone de la résidence du patient",
      "definition" : "Téléphone de la résidence du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID14",
      "path" : "SourcePatientInfo.PID14",
      "short" : "Téléphone professionnel du patient",
      "definition" : "Téléphone professionnel du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID15",
      "path" : "SourcePatientInfo.PID15",
      "short" : "Langue du patient",
      "definition" : "Langue du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID16",
      "path" : "SourcePatientInfo.PID16",
      "short" : "Statut marital du patient",
      "definition" : "Statut marital du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID18",
      "path" : "SourcePatientInfo.PID18",
      "short" : "Numéro de compte du patient",
      "definition" : "Numéro de compte du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SourcePatientInfo.PID21",
      "path" : "SourcePatientInfo.PID21",
      "short" : "Identifiant de la mère du patient",
      "definition" : "Identifiant de la mère du patient",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
