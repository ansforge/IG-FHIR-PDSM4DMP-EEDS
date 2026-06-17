# SubmissionSet (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: SubmissionSet (LM) 

 
Modèle logique d'un lot de soummission (SubmissionSet). 

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-SubmissionSet.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-SubmissionSet.csv), [Excel](../StructureDefinition-SubmissionSet.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SubmissionSet",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet",
  "version" : "0.1.0",
  "name" : "SubmissionSet",
  "title" : "SubmissionSet (LM)",
  "status" : "draft",
  "date" : "2026-06-17T08:46:38+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique d'un lot de soummission (SubmissionSet).",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SubmissionSet",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SubmissionSet",
      "path" : "SubmissionSet",
      "short" : "SubmissionSet (LM)",
      "definition" : "Modèle logique d'un lot de soummission (SubmissionSet)."
    },
    {
      "id" : "SubmissionSet.entryUUID",
      "path" : "SubmissionSet.entryUUID",
      "short" : "Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que uniqueId est utilisé à des fins de référence externe.",
      "definition" : "Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que uniqueId est utilisé à des fins de référence externe.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uuid"
      }]
    },
    {
      "id" : "SubmissionSet.availabilityStatus",
      "path" : "SubmissionSet.availabilityStatus",
      "short" : "Cette métadonnée représente la pertinence d'un lot de soumission. ",
      "definition" : "Cette métadonnée représente la pertinence d'un lot de soumission. ",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "example" : [{
        "label" : "version à jour du lot de soumission",
        "valueString" : "urn:oasis:names:tc:ebxml-regrep:StatusType:Approved"
      },
      {
        "label" : "version archivée du lot de soumission",
        "valueString" : "urn:asip:ci-sis:2010:StatusType:Archived "
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS|20200424120000"
      }
    },
    {
      "id" : "SubmissionSet.submissionTime",
      "path" : "SubmissionSet.submissionTime",
      "short" : "Représente la date et heure de soumission.",
      "definition" : "Représente la date et heure de soumission.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "SubmissionSet.title",
      "path" : "SubmissionSet.title",
      "short" : "Titre du lot de soumission ",
      "definition" : "Titre du lot de soumission ",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SubmissionSet.comments",
      "path" : "SubmissionSet.comments",
      "short" : "Cette métadonnée contient le commentaire associé au lot de soumission. ",
      "definition" : "Cette métadonnée contient le commentaire associé au lot de soumission. ",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "SubmissionSet.patientID",
      "path" : "SubmissionSet.patientID",
      "short" : "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient tel que défini dans le cadre juridique.",
      "definition" : "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient tel que défini dans le cadre juridique.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/PatientId"
      }]
    },
    {
      "id" : "SubmissionSet.sourceID",
      "path" : "SubmissionSet.sourceID",
      "short" : "Cette métadonnée représente l’identifiant unique global du système émetteur du lot de soumission",
      "definition" : "Cette métadonnée représente l’identifiant unique global du système émetteur du lot de soumission",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "oid"
      }]
    },
    {
      "id" : "SubmissionSet.uniqueID",
      "path" : "SubmissionSet.uniqueID",
      "short" : "Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de référence externe alors que entryUUID est destiné à des fins de gestion interne.",
      "definition" : "Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de référence externe alors que entryUUID est destiné à des fins de gestion interne.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "oid"
      }]
    },
    {
      "id" : "SubmissionSet.contentTypeCode",
      "path" : "SubmissionSet.contentTypeCode",
      "short" : "Ensemble de métadonnées représentant le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission. ",
      "definition" : "**Submission Set**",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J03-XdsContentTypeCode-CISIS/FHIR/JDV-J03-XdsContentTypeCode-CISIS|20260223120000"
      }
    },
    {
      "id" : "SubmissionSet.author",
      "path" : "SubmissionSet.author",
      "short" : "Représente la personne physique ou morale et/ou le dispositif auteur d’un lot de soumission",
      "definition" : "Représente la personne physique ou morale et/ou le dispositif auteur d’un lot de soumission",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorSubmissionSet"
      }]
    },
    {
      "id" : "SubmissionSet.homeCommunityID",
      "path" : "SubmissionSet.homeCommunityID",
      "short" : "Cette métadonnée correspond à l’identifiant de la communauté représentée par le système cible si celui-ci offre des fonctionnalités de communication avec d’autres communautés telles que présentées dans le profil XCA d’IHE. Elle n’est pas utilisée par les transactions décrites dans ce volet.",
      "definition" : "Cette métadonnée correspond à l’identifiant de la communauté représentée par le système cible si celui-ci offre des fonctionnalités de communication avec d’autres communautés telles que présentées dans le profil XCA d’IHE. Elle n’est pas utilisée par les transactions décrites dans ce volet.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "oid"
      }]
    },
    {
      "id" : "SubmissionSet.intendedRecipient",
      "path" : "SubmissionSet.intendedRecipient",
      "short" : "Cette métadonnée représente les destinataires (structure ou professionnel) auxquels lot de soumission est destiné. Elle n’est pas utilisée par les transactions décrites dans ce volet.",
      "definition" : "Cette métadonnée représente les destinataires (structure ou professionnel) auxquels lot de soumission est destiné. Elle n’est pas utilisée par les transactions décrites dans ce volet.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
