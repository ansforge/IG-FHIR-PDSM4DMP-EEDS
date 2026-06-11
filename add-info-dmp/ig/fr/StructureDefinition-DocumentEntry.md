# Document Entry (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Modèle logique: Document Entry (LM) 

 
Modèle logique d’une fiche 

**Utilisations:**

* Ce Modèle logique n'est utilisé par aucun autre profil dans ce guide d'implémentation

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/DocumentEntry)

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

Obligatoire : 0 élément(27 éléments obligatoire(s) imbriqué(s))

**Structures**

Cette structure fait référence à ces autres structures:

* [Identifier (http://hl7.org/fhir/StructureDefinition/elementdefinition-identifier|5.3.0)](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-elementdefinition-identifier.html)

 **Vue différentielle** 

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

#### Bindings terminologiques (différentiel)

 **Vue d'ensembleView** 

#### Bindings terminologiques

Cette structure est dérivée de [Base](http://build.fhir.org/types.html#Base) 

** Résumé **

Obligatoire : 0 élément(27 éléments obligatoire(s) imbriqué(s))

**Structures**

Cette structure fait référence à ces autres structures:

* [Identifier (http://hl7.org/fhir/StructureDefinition/elementdefinition-identifier|5.3.0)](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-elementdefinition-identifier.html)

 

Autres représentations du profil : [CSV](../StructureDefinition-DocumentEntry.csv), [Excel](../StructureDefinition-DocumentEntry.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "DocumentEntry",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/DocumentEntry",
  "version" : "0.1.0",
  "name" : "DocumentEntry",
  "title" : "Document Entry (LM)",
  "status" : "draft",
  "date" : "2026-06-11T15:47:13+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique  d’une fiche",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "DocumentEntryCDA",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "DocumentEntryCDA",
    "comment" : "Mapping CDA"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/DocumentEntry",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "DocumentEntry",
      "path" : "DocumentEntry",
      "short" : "Document Entry (LM)",
      "definition" : "Modèle logique  d’une fiche",
      "mapping" : [{
        "identity" : "DocumentEntryCDA",
        "map" : "DocumentEntry"
      }]
    },
    {
      "id" : "DocumentEntry.entryUUID",
      "path" : "DocumentEntry.entryUUID",
      "short" : "Identifiant unique affecté à la version de la fiche référençant le document.",
      "definition" : "Les valeurs possibles pour cette métadonnée doivent être un code provenant du jeu de valeurs mis à disposition par le projet. En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J52_AvailabilityStatus_CISIS peut être utilisé.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uuid"
      }]
    },
    {
      "id" : "DocumentEntry.logicalId",
      "path" : "DocumentEntry.logicalId",
      "short" : "Cette métadonnée représente un identifiant invariable pour toutes les versions de la fiche d'un document, à la différence de la métadonnée entryUUID qui a une valeur différente pour chaque version de la fiche",
      "definition" : "Cette métadonnée représente un identifiant invariable pour toutes les versions de la fiche d'un document, à la différence de la métadonnée entryUUID qui a une valeur différente pour chaque version de la fiche",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "DocumentEntry.mimeType",
      "path" : "DocumentEntry.mimeType",
      "short" : "Cette métadonnée représente le type de contenu du document, défini par le standard MIME.",
      "definition" : "Cette métadonnée représente le type de contenu du document, défini par le standard MIME.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.availabilityStatus",
      "path" : "DocumentEntry.availabilityStatus",
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
      },
      "mapping" : [{
        "identity" : "DocumentEntryCDA",
        "map" : "Non applicable, cette métadonnée n'est pas soumise par le système initiateur. Le registre du système cible gère cette information et fournit sa valeur en réponse à une requête stockée."
      }]
    },
    {
      "id" : "DocumentEntry.hash",
      "path" : "DocumentEntry.hash",
      "short" : "Cette métadonnée contient le résultat du hachage du document déposé",
      "definition" : "Cette métadonnée contient le résultat du hachage du document déposé",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.size",
      "path" : "DocumentEntry.size",
      "short" : "Cette métadonnée correspond à la taille du document déposé.",
      "definition" : "Cette métadonnée correspond à la taille du document déposé.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "DocumentEntry.languageCode",
      "path" : "DocumentEntry.languageCode",
      "short" : "Cette métadonnée représente le code de la langue dans laquelle le document est rédigé.",
      "definition" : "Pour tous les documents produits système initiateur français : 'fr-FR'",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.author",
      "path" : "DocumentEntry.author",
      "short" : "Cette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document.",
      "definition" : "Cette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorDocumentEntry"
      }]
    },
    {
      "id" : "DocumentEntry.legalAuthenticator[x]",
      "path" : "DocumentEntry.legalAuthenticator[x]",
      "short" : "Cette métadonnée représente l'acteur prenant la responsabilité du contenu médical du document",
      "definition" : "XCN",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPS"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPatient"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSystem"
      }]
    },
    {
      "id" : "DocumentEntry.repositoryUniqueId",
      "path" : "DocumentEntry.repositoryUniqueId",
      "short" : "Cette métadonnée représente l'identifiant unique global de l'entrepôt de documents dans lequel est stocké le document",
      "definition" : "Cette métadonnée représente l'identifiant unique global de l'entrepôt de documents dans lequel est stocké le document",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "oid"
      }]
    },
    {
      "id" : "DocumentEntry.serviceStartTime",
      "path" : "DocumentEntry.serviceStartTime",
      "short" : "Cette métadonnée représente la date de début de l'acte de référence.",
      "definition" : "Cette métadonnée représente la date de début de l'acte de référence.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "DocumentEntry.serviceEndTime",
      "path" : "DocumentEntry.serviceEndTime",
      "short" : "Cette métadonnée correspond à la date de fin de l'acte de référence, si connue.",
      "definition" : "Cette métadonnée correspond à la date de fin de l'acte de référence, si connue.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "DocumentEntry.sourcePatientID",
      "path" : "DocumentEntry.sourcePatientID",
      "short" : "Cette métadonnée contient l'identifiant secondaire du patient dans le système d'information du producteur (IPP) ou l'INS, s'il n'y a pas d'identifiant secondaire.",
      "definition" : "Cette métadonnée contient l'identifiant secondaire du patient dans le système d'information du producteur (IPP) ou l'INS, s'il n'y a pas d'identifiant secondaire.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SourcePatientId"
      }]
    },
    {
      "id" : "DocumentEntry.sourcePatientInfo",
      "path" : "DocumentEntry.sourcePatientInfo",
      "short" : "Cette métadonnée contient les traits d'identité du patient concerné par le document, connus par le producteur du document.",
      "definition" : "Cette métadonnée contient les traits d'identité du patient concerné par le document, connus par le producteur du document.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SourcePatientInfo"
      }]
    },
    {
      "id" : "DocumentEntry.URI",
      "path" : "DocumentEntry.URI",
      "short" : "Cette métadonnée n'est exploitée que par la transaction XDM 'Distribute document set on media ITI-32'",
      "definition" : "Cette métadonnée n'est exploitée que par la transaction XDM 'Distribute document set on media ITI-32'",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.title",
      "path" : "DocumentEntry.title",
      "short" : "Cette métadonnée représente le titre du document.",
      "definition" : "Cette métadonnée représente le titre du document.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.comments",
      "path" : "DocumentEntry.comments",
      "short" : "Cette métadonnée contient le commentaire associé au document.",
      "definition" : "Cette métadonnée contient le commentaire associé au document.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.patientID",
      "path" : "DocumentEntry.patientID",
      "short" : "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient.",
      "definition" : "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PatientId"
      }]
    },
    {
      "id" : "DocumentEntry.uniqueId",
      "path" : "DocumentEntry.uniqueId",
      "short" : "Identifiant unique affecté au document par son créateur. ",
      "definition" : "Identifiant unique affecté au document par son créateur. ",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "DocumentEntry.class",
      "path" : "DocumentEntry.class",
      "short" : "class représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, etc.).",
      "definition" : "class est constitué des attributs : \n- **classCode**\n- **classCodeDisplayName**\n- **codingScheme***\n\n**classCode**\n- Type : Non contraint\n- Contenu : Les valeurs possibles doivent être un code provenant du jeu de valeurs mis à disposition par le projet (exemple : JDV_J57_ClassCode_DMP). En l’absence de spécifications complémentaires, le JDV_J06_XdsClassCode_CISIS peut être utilisé. \n- Source : En fonction de l’interface fournie (ex. paramétrage fixe ou choix dans un menu déroulant). \n\n**classCodeDisplayName**\n- Type : Non contraint\n- Contenu : L’intitulé de la classe de document correspond au libellé associé au code de **classCode**.\n- Source : En fonction de l’interface fournie (ex. paramétrage fixe ou choix dans un menu déroulant). \n\n**codingScheme**\n- Type : OID\n- Le code système de la classe de document correspond à l’OID associé au code de classCode. \n- Source : En fonction de l’interface fournie (ex. paramétrage fixe ou choix dans un menu déroulant). \n",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J06-XdsClassCode-CISIS/FHIR/JDV-J06-XdsClassCode-CISIS|20230922120000"
      },
      "mapping" : [{
        "identity" : "DocumentEntryCDA",
        "map" : "code@code (classCode est déduit de typeCode selon la table de correspondance entre ces deux métadonnées référencée dans les Nomenclatures des Objets de Santé (NOS) : ASS_X04-CorrespondanceType-Classe)"
      }]
    },
    {
      "id" : "DocumentEntry.confidentiality",
      "path" : "DocumentEntry.confidentiality",
      "short" : "Métadonnée contenant les informations définissant le niveau de confidentialité d'un document déposé dans l'entrepôt. Dans le cadre de la mise en œuvre du masquage et de la non-visibilité, ces métadonnées sont utilisées pour rendre inaccessible un document à l'utilisateur",
      "definition" : "**Confidentiality Code**",
      "min" : 1,
      "max" : "4",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J58-ConfidentialityCode-DMP/FHIR/JDV-J58-ConfidentialityCode-DMP|20200424120000"
      }
    },
    {
      "id" : "DocumentEntry.eventCodeList",
      "path" : "DocumentEntry.eventCodeList",
      "short" : "Cette métadonnée contient les codes, libellés et codes système représentant :  -un évènement documenté (acte, traitement, diagnostic, etc…), -une modalité d'acquisition (contexte imagerie), -une région anatomique (contexte imagerie). ",
      "definition" : "Cette métadonnée contient les codes, libellés et codes système représentant :  -un évènement documenté (acte, traitement, diagnostic, etc…), -une modalité d'acquisition (contexte imagerie), -une région anatomique (contexte imagerie). ",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/EventCode"
      }]
    },
    {
      "id" : "DocumentEntry.format",
      "path" : "DocumentEntry.format",
      "short" : "Métadonnée contenant les informations définissant le format du document.",
      "definition" : "**Format Code**",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J10-XdsFormatCode-CISIS/FHIR/JDV-J10-XdsFormatCode-CISIS|20251029120000"
      }
    },
    {
      "id" : "DocumentEntry.healthcareFacilityTypeCode",
      "path" : "DocumentEntry.healthcareFacilityTypeCode",
      "short" : "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit. ",
      "definition" : "Healthcare Facility Type Code**",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J02-XdsHealthcareFacilityTypeCode-CISIS/FHIR/JDV-J02-XdsHealthcareFacilityTypeCode-CISIS|20260223120000"
      }
    },
    {
      "id" : "DocumentEntry.practiceSetting",
      "path" : "DocumentEntry.practiceSetting",
      "short" : "Contexte de l’acte qui a engendré la création du document. ",
      "definition" : "**Practice Setting**",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J04-XdsPracticeSettingCode-CISIS/FHIR/JDV-J04-XdsPracticeSettingCode-CISIS|20240927120000"
      }
    },
    {
      "id" : "DocumentEntry.type",
      "path" : "DocumentEntry.type",
      "short" : "Métadonnée représentant le type du document.",
      "definition" : "**Type Code**",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J07-XdsTypeCode-CISIS/FHIR/JDV-J07-XdsTypeCode-CISIS|20260601120000"
      }
    },
    {
      "id" : "DocumentEntry.documentAvailability",
      "path" : "DocumentEntry.documentAvailability",
      "short" : "Cette métadonnée représente '’accessibilité du document en indiquant si celui-ci est accessible en ligne ou non",
      "definition" : "Cette métadonnée représente '’accessibilité du document en indiquant si celui-ci est accessible en ligne ou non",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "DocumentEntry.homeCommunityId",
      "path" : "DocumentEntry.homeCommunityId",
      "short" : "Cette métadonnée correspond à l'identifiant de la communauté représentée par le système cible, si celui-ci offre les fonctionnalités de communication avec d'autres communautés, présentées dans le profil XCA d'IHE. Elle n'est pas utilisée par les transactions décrites dans ce volet.",
      "definition" : "Cette métadonnée correspond à l'identifiant de la communauté représentée par le système cible, si celui-ci offre les fonctionnalités de communication avec d'autres communautés, présentées dans le profil XCA d'IHE. Elle n'est pas utilisée par les transactions décrites dans ce volet.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "oid"
      }]
    },
    {
      "id" : "DocumentEntry.creationTime",
      "path" : "DocumentEntry.creationTime",
      "short" : "Cette métadonnée représente la date et l’heure de la création du document.",
      "definition" : "Cette métadonnée représente la date et l’heure de la création du document.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "DocumentEntry.referenceIdList",
      "path" : "DocumentEntry.referenceIdList",
      "short" : "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document.",
      "definition" : "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "DocumentEntry.referenceIdList.CX1",
      "path" : "DocumentEntry.referenceIdList.CX1",
      "short" : "Identifiant de l'objet référencé",
      "definition" : "Identifiant de l'objet référencé",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/elementdefinition-identifier|5.3.0"]
      }]
    },
    {
      "id" : "DocumentEntry.referenceIdList.CX4",
      "path" : "DocumentEntry.referenceIdList.CX4",
      "short" : "Identifiant de l’organisme ayant attribué l’identifiant de l'objet référencé",
      "definition" : "Identifiant de l’organisme ayant attribué l’identifiant de l'objet référencé",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/elementdefinition-identifier|5.3.0"]
      }]
    },
    {
      "id" : "DocumentEntry.referenceIdList.CX5",
      "path" : "DocumentEntry.referenceIdList.CX5",
      "short" : "Type d’identifiant",
      "definition" : "Type d’identifiant",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J197-XdsTypesIdentifiantsReferenceId-CISIS/FHIR/JDV-J197-XdsTypesIdentifiantsReferenceId-CISIS|20220624120000"
      }
    },
    {
      "id" : "DocumentEntry.version",
      "path" : "DocumentEntry.version",
      "short" : "Cette métadonnée représente le numéro de version de la fiche d’un document.",
      "definition" : "Cette métadonnée représente le numéro de version de la fiche d’un document.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    }]
  }
}

```
