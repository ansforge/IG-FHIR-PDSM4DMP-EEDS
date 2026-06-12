# AuthorSubmissionSet (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: AuthorSubmissionSet (LM) 

 
Modèle logique d'un auteur d'un lot de soumission Cette métadonnée représente les personnes physiques et/ou les systèmes auteurs d’un lot de soumission. Constituée des sous-attributs **authorInstitution**, **authorPerson**, **authorRole** et **authorSpecialty**, elle ne porte pas de valeur par elle-même. 

**Usages:**

* Use this Logical Model: [SubmissionSet (LM)](StructureDefinition-SubmissionSet.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-AuthorSubmissionSet.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-AuthorSubmissionSet.csv), [Excel](../StructureDefinition-AuthorSubmissionSet.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "AuthorSubmissionSet",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorSubmissionSet",
  "version" : "0.1.0",
  "name" : "AuthorSubmissionSet",
  "title" : "AuthorSubmissionSet (LM)",
  "status" : "draft",
  "date" : "2026-06-12T14:52:39+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique d'un auteur d'un lot de soumission\nCette métadonnée représente les personnes physiques et/ou les systèmes auteurs d’un lot de soumission. \nConstituée des sous-attributs **authorInstitution**, **authorPerson**, **authorRole** et **authorSpecialty**, elle ne porte pas de valeur par elle-même. ",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorSubmissionSet",
  "baseDefinition" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Author|0.1.0",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "AuthorSubmissionSet",
      "path" : "AuthorSubmissionSet",
      "short" : "AuthorSubmissionSet (LM)",
      "definition" : "Modèle logique d'un auteur d'un lot de soumission\nCette métadonnée représente les personnes physiques et/ou les systèmes auteurs d’un lot de soumission. \nConstituée des sous-attributs **authorInstitution**, **authorPerson**, **authorRole** et **authorSpecialty**, elle ne porte pas de valeur par elle-même. "
    },
    {
      "id" : "AuthorSubmissionSet.institution",
      "path" : "AuthorSubmissionSet.institution",
      "short" : "Cette métadonnée représente la structure émettrice du lot de soumission"
    },
    {
      "id" : "AuthorSubmissionSet.person[x]",
      "path" : "AuthorSubmissionSet.person[x]",
      "short" : "Cette métadonnée représente la personne physique ou le système émetteur du lot de soumission.Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient.  "
    },
    {
      "id" : "AuthorSubmissionSet.role",
      "path" : "AuthorSubmissionSet.role",
      "short" : "ette métadonnée représente le rôle joué par l’auteur vis-à-vis du patient lors de la constitution du lot de soumission, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.)."
    }]
  }
}

```
