# Accueil - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Accueil

 
There is no translation page available for the current page, so it has been rendered in the default language 

 **Brief description of this Implementation Guide**
 This Implementation Guide describes how to use PDSm (FHIR-based Mobile access to Health Documents) for the French shared medical record (DMP - Dossier Médical Partagé) in the context of EEDS (European Health Data Space / Espace Européen des Données de Santé). 

> Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp

### Introduction

Ce guide d'implémentation décrit l'utilisation du profil [PDSm (Partage de Documents de Santé en mobilité)](https://interop.esante.gouv.fr/ig/fhir/pdsm/) pour les échanges avec le Dossier Médical Partagé (DMP) dans le contexte de l'Espace Européen des Données de Santé (EEDS).

Le DMP est le carnet de santé numérique de chaque Français. Il permet aux professionnels de santé d'accéder aux documents médicaux d'un patient (comptes rendus, ordonnances, imagerie, etc.) et d'y contribuer, sous réserve du consentement du patient.

PDSm est le profil FHIR français basé sur [IHE MHD (Mobile access to Health Documents)](https://profiles.ihe.net/ITI/MHD/index.html). Il définit les transactions FHIR permettant de soumettre, rechercher et consulter des documents de santé. Ce guide précise comment ces transactions s'appliquent au contexte DMP, et documente les extensions nécessaires pour les données spécifiques au DMP qui n'ont pas d'équivalent dans MHD.

Les principales sections de ce guide sont :

* **[Transactions DMP Patient](construction_des_flux.md)** : vue d'ensemble et détail de chaque transaction (TD02, TD2, TD2.1, TD3.1a, TD3.1b, TD3.2, TD3.3a–d) avec leur équivalent FHIR
* **[Exemples d'usages DMP](exemples_usage_dmp.md)** : cinématiques concrètes illustrant des cas d'usage réels (ex. notification de documents tiers)
* **[Ressources de conformité](artifacts.md)** : profils, modèles logiques, mappings et exemples FHIR

### Périmètre

Ce guide couvre les transactions DMP réalisées par un Logiciel de Professionnel de Santé (LPS) dans le cadre du volet CI-SIS « Partage de Documents de Santé ». Il s'appuie sur le profil PDSm et le guide HL7 FHIR France (fr-core) pour le traitement de l'identité patient (INS).

Les transactions couvertes sont :

| | |
| :--- | :--- |
| [TD02](transaction_td02.md) | Vérifier l'existence d'un DMP actif et les conditions d'accès |
| [TD2](transaction_td2.md) | Alimenter le DMP avec de nouveaux documents |
| [TD2.1](transaction_td2.1.md) | Remplacer un document existant |
| [TD3.1a](transaction_td3.1a.md) | Lister les documents du DMP |
| [TD3.1b](transaction_td3.1b.md) | Rechercher l'identifiant technique d'un document |
| [TD3.2](transaction_td3.2.md) | Consulter un document |
| [TD3.3a](transaction_td3.3a.md) | Masquer / démasquer un document aux professionnels |
| [TD3.3b](transaction_td3.3b.md) | Gérer la visibilité d'un document pour le patient |
| [TD3.3c](transaction_td3.3c.md) | Supprimer un document |
| [TD3.3d](transaction_td3.3d.md) | Archiver / désarchiver un document |

### Dépendances














### Propriété intellectuelle

Certaines ressources sémantiques de ce guide sont protégées par des droits de propriété intellectuelle couverte par les déclarations ci-dessous. L’utilisation de ces ressources est soumise à l’acceptation et au respect des conditions précisées dans la licence d’utilisation de chacune d’entre elle.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.0.2/CodeSystem-ISO3166Part1.html): [ActorPS](StructureDefinition-ActorPS.md), [ActorPatient](StructureDefinition-ActorPatient.md)... Show 23 more, [ActorSNR](StructureDefinition-ActorSNR.md), [ActorSystem](StructureDefinition-ActorSystem.md), [ActorXDS](StructureDefinition-ActorXDS.md), [Author](StructureDefinition-Author.md), [AuthorDocumentEntry](StructureDefinition-AuthorDocumentEntry.md), [AuthorInstitution](StructureDefinition-AuthorInstitution.md), [AuthorSubmissionSet](StructureDefinition-AuthorSubmissionSet.md), [DocumentEntry](StructureDefinition-DocumentEntry.md), [EventCode](StructureDefinition-EventCode.md), [Folder](StructureDefinition-Folder.md), [Identifiant](StructureDefinition-Identifiant.md), [IdentifiantSysteme](StructureDefinition-IdentifiantSysteme.md), [MatriculeINS](StructureDefinition-MatriculeINS.md), [PDSm4DMP](index.md), [PSIdNat](StructureDefinition-PSIdNat.md), [PatientId](StructureDefinition-PatientId.md), [SNR](StructureDefinition-SNR.md), [SourcePatientId](StructureDefinition-SourcePatientId.md), [SourcePatientInfo](StructureDefinition-SourcePatientInfo.md), [StructIdNat](StructureDefinition-StructIdNat.md), [SubmissionSet](StructureDefinition-SubmissionSet.md), [documentReferenceToPDSM](ConceptMap-documentReferenceToPDSM.md) and [submissionSetToPDSM](ConceptMap-submissionSetToPDSM.md)


* This material contains content from [LOINC](http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the [license](http://loinc.org/license). LOINC® is a registered United States trademark of Regenstrief Institute, Inc.

* [LOINC](http://terminology.hl7.org/6.0.2/CodeSystem-v3-loinc.html): [DocumentEntry](StructureDefinition-DocumentEntry.md)


