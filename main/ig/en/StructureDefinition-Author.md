# Author (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: Author (LM) 

 
Modèle logique d'un auteur. 
Représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document ou d'un lot de soummission. 
L’auteur peut être : 
* Un professionnel (personne physique) via son logiciel de professionnel,
* Le patient/usager (personne physique) via Mon espace Santé,
* Un système de structure (dispositif, automate, appareil connecté…),
* Un SNR (Service Numérique Référencé),
 
**author** est un ensemble constitué des sous-attributs **authorInstitution** , **authorPerson**, **authorRole** et **authorSpecialty** et ne porte pas de valeur par lui-même. 

### Type

author est un ensemble constitué des sous-attributs authorInstitution, ActorXDS, authorRole et authorSpecialty et ne porte pas de valeur par lui-même.

**Usages:**

* Derived from this Logical Model: [AuthorDocumentEntry (LM)](StructureDefinition-AuthorDocumentEntry.md) and [AuthorSubmissionSet (LM)](StructureDefinition-AuthorSubmissionSet.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-Author.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-Author.csv), [Excel](../StructureDefinition-Author.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "Author",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Author",
  "version" : "0.1.0",
  "name" : "Author",
  "title" : "Author (LM)",
  "status" : "draft",
  "date" : "2026-07-01T12:36:12+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique d'un auteur.\n\nReprésente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document ou d'un lot de soummission. \n\nL’auteur peut être : \n- Un professionnel (personne physique) via son logiciel de professionnel, \n- Le patient/usager (personne physique) via Mon espace Santé, \n- Un système de structure (dispositif, automate, appareil connecté…), \n- Un SNR (Service Numérique Référencé), \n\n\n**author** est un ensemble constitué des sous-attributs **authorInstitution** , **authorPerson**, **authorRole** et **authorSpecialty** et ne porte pas de valeur par lui-même. ",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Author",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "Author",
      "path" : "Author",
      "short" : "Author (LM)",
      "definition" : "Modèle logique d'un auteur.\n\nReprésente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document ou d'un lot de soummission. \n\nL’auteur peut être : \n- Un professionnel (personne physique) via son logiciel de professionnel, \n- Le patient/usager (personne physique) via Mon espace Santé, \n- Un système de structure (dispositif, automate, appareil connecté…), \n- Un SNR (Service Numérique Référencé), \n\n\n**author** est un ensemble constitué des sous-attributs **authorInstitution** , **authorPerson**, **authorRole** et **authorSpecialty** et ne porte pas de valeur par lui-même. "
    },
    {
      "id" : "Author.institution",
      "path" : "Author.institution",
      "short" : "Cet attribut représente la structure de l’auteur.",
      "definition" : "Cet attribut représente la structure de l’auteur.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorInstitution"
      }]
    },
    {
      "id" : "Author.person[x]",
      "path" : "Author.person[x]",
      "short" : "Author",
      "definition" : "Author",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPS"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorPatient"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSNR"
      },
      {
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/ActorSystem"
      }]
    },
    {
      "id" : "Author.role",
      "path" : "Author.role",
      "short" : "Cet attribut représente le rôle fonctionnel joué par l’auteur vis-à-vis du patient/usager lors de la création du document, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.). ",
      "definition" : "**Author Role**",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J47-FunctionCode-CISIS/FHIR/JDV-J47-FunctionCode-CISIS|20250523120000"
      }
    },
    {
      "id" : "Author.specialty",
      "path" : "Author.specialty",
      "short" : "Cet attribut représente la profession éventuellement associée au savoir-faire de l’auteur professionnel caractérisé par sa profession ou la profession associée au genre d’activité pour l’auteur professionnel caractérisé par son rôle. ",
      "definition" : "**AutorSpecialty**",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J01-XdsAuthorSpecialty-CISIS/FHIR/JDV-J01-XdsAuthorSpecialty-CISIS|20260505120000"
      }
    }]
  }
}

```
