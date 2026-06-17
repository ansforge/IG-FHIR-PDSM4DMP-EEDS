# Folder (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: Folder (LM) 

 
Modèle logique d’une classeur 

**Utilisations:**

* Ce Modèle logique n'est utilisé par aucun autre profil dans ce guide d'implémentation

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/Folder)

### Vues formelles du contenu du profil

 [Description des profils, des différentiels, des instantanés et de leurs représentations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Tableau différentiel (differential)](#tabs-diff) 
*  [Tableau récapitulatif (snapshot)](#tabs-snap) 
*  [Statistiques/Références](#tabs-summ) 
*  [Tous](#tabs-all) 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

#### Bindings terminologiques (différentiel)

#### Bindings terminologiques

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(8 éléments obligatoire(s) imbriqué(s))

 **Vue différentielle** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

#### Bindings terminologiques (différentiel)

 **Vue d'ensembleView** 

#### Bindings terminologiques

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(8 éléments obligatoire(s) imbriqué(s))

 

Autres représentations du profil : [CSV](../StructureDefinition-Folder.csv), [Excel](../StructureDefinition-Folder.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "Folder",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Folder",
  "version" : "0.1.0",
  "name" : "Folder",
  "title" : "Folder (LM)",
  "status" : "draft",
  "date" : "2026-06-17T07:47:53+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique  d’une classeur",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Folder",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Folder",
      "path" : "Folder",
      "short" : "Folder (LM)",
      "definition" : "Modèle logique  d’une classeur"
    },
    {
      "id" : "Folder.availabilityStatus",
      "path" : "Folder.availabilityStatus",
      "short" : "Cette métadonnée représente la pertinence de la version de la fiche d'un document. ",
      "definition" : "**Availability Status**",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS|20200424120000"
      }
    },
    {
      "id" : "Folder.codeList",
      "path" : "Folder.codeList",
      "short" : "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document.",
      "definition" : "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Folder.comments",
      "path" : "Folder.comments",
      "short" : "Cette métadonnée contient le commentaire associé au classeur.",
      "definition" : "Cette métadonnée contient le commentaire associé au classeur.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Folder.entryUUID",
      "path" : "Folder.entryUUID",
      "short" : "Cette métadonnée représente l’identifiant unique du classeur.",
      "definition" : "Cette métadonnée représente l’identifiant unique du classeur.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uuid"
      }]
    },
    {
      "id" : "Folder.lastUpdateTime",
      "path" : "Folder.lastUpdateTime",
      "short" : "Cette métadonnée correspond à la date et l’heure de la dernière mise à jour du classeur.",
      "definition" : "Cette métadonnée correspond à la date et l’heure de la dernière mise à jour du classeur.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Folder.patientID",
      "path" : "Folder.patientID",
      "short" : "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient\ntel que défini dans le cadre juridique.",
      "definition" : "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient\ntel que défini dans le cadre juridique.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PatientId"
      }]
    },
    {
      "id" : "Folder.title",
      "path" : "Folder.title",
      "short" : "Cette métadonnée représente le titre du classeur.",
      "definition" : "Cette métadonnée représente le titre du classeur.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Folder.uniqueId",
      "path" : "Folder.uniqueId",
      "short" : "Cette métadonnée représente l’identifiant unique global affecté au classeur par son créateur.",
      "definition" : "Cette métadonnée représente l’identifiant unique global affecté au classeur par son créateur.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "Folder.homeCommunityId",
      "path" : "Folder.homeCommunityId",
      "short" : "Cette métadonnée correspond à l’identifiant de la communauté représentée par le système cible si celui-ci offre\ndes fonctionnalités de communication avec d’autres communautés telles que présentées dans le profil XCA\nd’IHE. Elle n’est pas utilisée par les transactions décrites dans ce volet.",
      "definition" : "Cette métadonnée correspond à l’identifiant de la communauté représentée par le système cible si celui-ci offre\ndes fonctionnalités de communication avec d’autres communautés telles que présentées dans le profil XCA\nd’IHE. Elle n’est pas utilisée par les transactions décrites dans ce volet.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "oid"
      }]
    },
    {
      "id" : "Folder.logicalId",
      "path" : "Folder.logicalId",
      "short" : "Cette métadonnée représente un identifiant invariable pour toutes les versions du classeur, à la différence de la\nmétadonnée entryUUID qui a une valeur différente pour chaque version du classeur",
      "definition" : "Cette métadonnée représente un identifiant invariable pour toutes les versions du classeur, à la différence de la\nmétadonnée entryUUID qui a une valeur différente pour chaque version du classeur",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "Folder.version",
      "path" : "Folder.version",
      "short" : "Cette métadonnée représente le numéro de version du classeur",
      "definition" : "Cette métadonnée représente le numéro de version du classeur",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    }]
  }
}

```
