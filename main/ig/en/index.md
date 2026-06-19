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

* **Transactions DMP Patient et Document** : détail de chaque transaction (TD02, TD2, TD2.1, TD3.1a, TD3.1b, TD3.2, TD3.3a–d) avec leur équivalent FHIR
* **[Exemples d'usages DMP](exemples_usage_dmp.md)** : cinématiques concrètes illustrant des cas d'usage réels (ex. notification de documents tiers)
* **[Ressources de conformité](artifacts.md)** : profils, modèles logiques, mappings et exemples FHIR

### Vue d'ensemble des transactions

Les transactions sont organisées en quatre groupes fonctionnels :

| | |
| :--- | :--- |
| Vérification d'accès | [TD02](transaction_td02.md) |
| Alimentation | [TD2](transaction_td2.md),[TD2.1](transaction_td2.1.md) |
| Consultation | [TD3.1a](transaction_td3.1a.md),[TD3.1b](transaction_td3.1b.md),[TD3.2](transaction_td3.2.md) |
| Gestion des attributs | [TD3.3a](transaction_td3.3a.md),[TD3.3b](transaction_td3.3b.md),[TD3.3c](transaction_td3.3c.md),[TD3.3d](transaction_td3.3d.md) |

```
flowchart TD
    INS(["INS du patient"])
    TD02["TD02 - Vérifier existence DMP et conditions accès"]
    DMP_ACTIF{"DMP actif et accès autorisé ?"}
    FIN(["Fin - accès refusé"])

    subgraph ALIM["Alimentation"]
        TD2["TD2 - Soumettre de nouveaux documents - ITI-65"]
        TD21["TD2.1 - Remplacer un document - ITI-65 + UpdateDocumentRefs"]
    end

    subgraph RECH["Recherche"]
        TD31a["TD3.1a - Lister les documents du DMP - ITI-67"]
        TD31b["TD3.1b - Rechercher identifiant technique - ITI-67"]
    end

    subgraph GEST["Consultation et gestion"]
        TD32["TD3.2 - Consulter un document - DocumentReference + Binary"]
        TD33a["TD3.3a - Masquer / démasquer professionnels"]
        TD33b["TD3.3b - Visibilité patient"]
        TD33c["TD3.3c - Supprimer un document - HTTP DELETE"]
        TD33d["TD3.3d - Archiver / désarchiver - PATCH DocumentReference"]
    end

    INS --> TD02
    TD02 --> DMP_ACTIF
    DMP_ACTIF -- "Non" --> FIN
    DMP_ACTIF -- "Oui" --> ALIM
    DMP_ACTIF -- "Oui" --> RECH
    TD31a --> GEST
    TD31b --> TD33a
    TD31b --> TD33b
    TD31b --> TD33c
    TD31b --> TD33d
    TD31a --> TD21
    TD31b --> TD21

```

### Périmètre

Ce guide couvre les transactions DMP réalisées par un Logiciel de Professionnel de Santé (LPS) dans le cadre du volet CI-SIS « Partage de Documents de Santé ». Il s'appuie sur le profil PDSm et le guide HL7 FHIR France (fr-core) pour le traitement de l'identité patient (INS).

### Correspondance des transactions DMP ↔ volet PDSm

**Sources :** DMPi v2.10.0 (XDS.b) · PDSm v3.1.1 (IHE MHD / FHIR R4) · IHE ITI TF Vol3 §4.2

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Alimentation — nouveau document | TD2.1 / TD2.2 (DMP_2.1a/2.2a) | ITI-41 Provide and Register Document Set-b | ITI-65 (Flux 01)**ou**ITI-105 (Flux 09) | ITI-65 : Bundle`transaction`/ ITI-105 : POST d'une seule`DocumentReference` |
| Alimentation — remplacement | TD2.1 / TD2.2 (DMP_2.1b/2.2b) | ITI-41 + association RPLC | ITI-65 (Flux 01)**ou**ITI-105 (Flux 09) | `relatesTo.code = replaces`(cardinalité`1..1`au remplacement). ITI-65 : ancienne fiche passée à`superseded`incluse dans le Bundle. ITI-105 : POST de la nouvelle fiche (`status = current`) avec`relatesTo[replaces]`; le gestionnaire déprécie la cible |
| Recherche de documents | TD3.1 (DMP_3.1) | ITI-18 Registry Stored Query (`FindDocuments`,`GetDocuments`) | ITI-67 Find Document References | Recherche REST FHIR (`search`) sur`DocumentReference`(HTTP GET/POST) |
| Recherche de lots / classeurs | TD3.1 (`FindSubmissionSets`) | ITI-18 Registry Stored Query | ITI-66 Find Document Lists | Recherche REST FHIR sur`List`(SubmissionSet / Folder) |
| Consultation / récupération | TD3.2 (DMP_3.2) | ITI-43 Retrieve Document Set | ITI-68 Retrieve Document | Récupération du`Binary`via`attachment.url` |
| Masquer / démasquer aux professionnels | TD3.3a | ITI-57 Update DocumentEntry Metadata | Flux 03 — mise à jour des métadonnées (PATCH) | HTTP PATCH (conditional, sur identifiant métier) de`DocumentReference.securityLabel` |
| Visibilité patient / représentants légaux | TD3.3b | ITI-57 Update DocumentEntry Metadata | Flux 03 — mise à jour des métadonnées (PATCH) | HTTP PATCH de`DocumentReference.securityLabel` |
| Archiver / désarchiver | TD3.3d | ITI-57 —`availabilityStatus`=`urn:asip:ci-sis:2010:StatusType:Archived` | Flux 03 — mise à jour des métadonnées (PATCH) | HTTP PATCH de l'extension`PDSm_isArchived`(booléen) sur`DocumentReference`/`List` |
| Supprimer un document (suppression logique) | TD3.3c | ITI-57 —`availabilityStatus`=`urn:asip:ci-sis:2010:StatusType:Deleted` | Flux 03 — mise à jour des métadonnées (PATCH) | HTTP PATCH de`DocumentReference.status`→`superseded`(dépublication). Pas de suppression physique (`DELETE`absent dans MHD). RMD (ITI-62/86)**non utilisé**par le DMP |

### Dépendances














### Propriété intellectuelle

Certaines ressources sémantiques de ce guide sont protégées par des droits de propriété intellectuelle couverte par les déclarations ci-dessous. L’utilisation de ces ressources est soumise à l’acceptation et au respect des conditions précisées dans la licence d’utilisation de chacune d’entre elle.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.0.2/CodeSystem-ISO3166Part1.html): [ActorPS](StructureDefinition-ActorPS.md), [ActorPatient](StructureDefinition-ActorPatient.md)... Show 23 more, [ActorSNR](StructureDefinition-ActorSNR.md), [ActorSystem](StructureDefinition-ActorSystem.md), [ActorXDS](StructureDefinition-ActorXDS.md), [Author](StructureDefinition-Author.md), [AuthorDocumentEntry](StructureDefinition-AuthorDocumentEntry.md), [AuthorInstitution](StructureDefinition-AuthorInstitution.md), [AuthorSubmissionSet](StructureDefinition-AuthorSubmissionSet.md), [DocumentEntry](StructureDefinition-DocumentEntry.md), [EventCode](StructureDefinition-EventCode.md), [Folder](StructureDefinition-Folder.md), [Identifiant](StructureDefinition-Identifiant.md), [IdentifiantSysteme](StructureDefinition-IdentifiantSysteme.md), [MatriculeINS](StructureDefinition-MatriculeINS.md), [PDSm4DMP](index.md), [PSIdNat](StructureDefinition-PSIdNat.md), [PatientId](StructureDefinition-PatientId.md), [SNR](StructureDefinition-SNR.md), [SourcePatientId](StructureDefinition-SourcePatientId.md), [SourcePatientInfo](StructureDefinition-SourcePatientInfo.md), [StructIdNat](StructureDefinition-StructIdNat.md), [SubmissionSet](StructureDefinition-SubmissionSet.md), [documentReferenceToPDSM](ConceptMap-documentReferenceToPDSM.md) and [submissionSetToPDSM](ConceptMap-submissionSetToPDSM.md)


* Some content from IHE® Copyright © 2015 [IHE International, Inc](http://www.ihe.net/Governance/#Intellectual_Property) .

* [IHE Format Code set for use with Document Sharing](https://profiles.ihe.net/fhir/ihe.formatcode.fhir/1.1.0/CodeSystem-formatcode.html): [Bundle/example-td2-1-remplacement](Bundle-example-td2-1-remplacement.md), [Bundle/example-td2-iti65-lot-soumission](Bundle-example-td2-iti65-lot-soumission.md)... Show 4 more, [DocumentReference/doc-x-id](DocumentReference-doc-x-id.md), [DocumentReference/example-td3-1a-cr-consultation](DocumentReference-example-td3-1a-cr-consultation.md), [DocumentReference/example-td3-1a-fhir-document](DocumentReference-example-td3-1a-fhir-document.md) and [DocumentReference/example-td3-1a-ordonnance](DocumentReference-example-td3-1a-ordonnance.md)


* This material contains content from [LOINC](http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the [license](http://loinc.org/license). LOINC® is a registered United States trademark of Regenstrief Institute, Inc.

* [LOINC](http://terminology.hl7.org/6.0.2/CodeSystem-v3-loinc.html): [Bundle/example-td2-1-remplacement](Bundle-example-td2-1-remplacement.md), [Bundle/example-td2-iti65-lot-soumission](Bundle-example-td2-iti65-lot-soumission.md)... Show 6 more, [DocumentEntry](StructureDefinition-DocumentEntry.md), [DocumentReference/doc-x-id](DocumentReference-doc-x-id.md), [DocumentReference/example-td2-iti105-publication-simplifiee](DocumentReference-example-td2-iti105-publication-simplifiee.md), [DocumentReference/example-td3-1a-cr-consultation](DocumentReference-example-td3-1a-cr-consultation.md), [DocumentReference/example-td3-1a-fhir-document](DocumentReference-example-td3-1a-fhir-document.md) and [DocumentReference/example-td3-1a-ordonnance](DocumentReference-example-td3-1a-ordonnance.md)


* This material contains content that is copyright of SNOMED International. Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact [https://www.snomed.org/get-snomed](https://www.snomed.org/get-snomed) or [info@snomed.org](mailto:info@snomed.org).

* [SNOMED Clinical Terms&reg; (SNOMED CT&reg;)](http://hl7.org/fhir/R4/codesystem-snomedct.html): [Bundle/example-td2-1-remplacement](Bundle-example-td2-1-remplacement.md), [Bundle/example-td2-iti65-lot-soumission](Bundle-example-td2-iti65-lot-soumission.md)... Show 4 more, [DocumentReference/doc-x-id](DocumentReference-doc-x-id.md), [DocumentReference/example-td3-1a-cr-consultation](DocumentReference-example-td3-1a-cr-consultation.md), [DocumentReference/example-td3-1a-fhir-document](DocumentReference-example-td3-1a-fhir-document.md) and [DocumentReference/example-td3-1a-ordonnance](DocumentReference-example-td3-1a-ordonnance.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [Confidentiality](http://terminology.hl7.org/7.2.0/CodeSystem-v3-Confidentiality.html): [Bundle/example-td2-1-remplacement](Bundle-example-td2-1-remplacement.md), [Bundle/example-td2-iti65-lot-soumission](Bundle-example-td2-iti65-lot-soumission.md)... Show 4 more, [DocumentReference/doc-x-id](DocumentReference-doc-x-id.md), [DocumentReference/example-td3-1a-cr-consultation](DocumentReference-example-td3-1a-cr-consultation.md), [DocumentReference/example-td3-1a-fhir-document](DocumentReference-example-td3-1a-fhir-document.md) and [DocumentReference/example-td3-1a-ordonnance](DocumentReference-example-td3-1a-ordonnance.md)


