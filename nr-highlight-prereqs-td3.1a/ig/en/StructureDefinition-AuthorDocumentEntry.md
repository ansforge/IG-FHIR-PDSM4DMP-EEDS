# AuthorDocumentEntry (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: AuthorDocumentEntry (LM) 

 
Modèle logique d'un auteur d'un document Cette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document. L’auteur peut être : 
* Un professionnel (personne physique) via son logiciel de professionnel,
* Le patient/usager (personne physique) via Mon espace Santé,
* Un système de structure (dispositif, automate, appareil connecté…),
* Un SNR (Service Numérique Référencé),
 

**Usages:**

* Use this Logical Model: [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-AuthorDocumentEntry.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-AuthorDocumentEntry.csv), [Excel](../StructureDefinition-AuthorDocumentEntry.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "AuthorDocumentEntry",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorDocumentEntry",
  "version" : "0.1.0",
  "name" : "AuthorDocumentEntry",
  "title" : "AuthorDocumentEntry (LM)",
  "status" : "draft",
  "date" : "2026-06-17T14:38:43+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique d'un auteur d'un document\nCette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document. \nL’auteur peut être : \n-  Un professionnel (personne physique) via son logiciel de professionnel, \n- Le patient/usager (personne physique) via Mon espace Santé, \n-  Un système de structure (dispositif, automate, appareil connecté…), \n-  Un SNR (Service Numérique Référencé), ",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "AuthorDocumentEntryCDA",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "AuthorDocumentEntryCDA",
    "comment" : "Mapping CDA"
  },
  {
    "identity" : "AuthorDocumentEntryDICOMKOS",
    "uri" : "https://www.dicomstandard.org/",
    "name" : "AuthorDocumentEntryDICOMKOS",
    "comment" : "Mapping DICOM KOS"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorDocumentEntry",
  "baseDefinition" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/Author|0.1.0",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "AuthorDocumentEntry",
      "path" : "AuthorDocumentEntry",
      "short" : "AuthorDocumentEntry (LM)",
      "definition" : "Modèle logique d'un auteur d'un document\nCette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document. \nL’auteur peut être : \n-  Un professionnel (personne physique) via son logiciel de professionnel, \n- Le patient/usager (personne physique) via Mon espace Santé, \n-  Un système de structure (dispositif, automate, appareil connecté…), \n-  Un SNR (Service Numérique Référencé), ",
      "mapping" : [{
        "identity" : "AuthorDocumentEntryCDA",
        "map" : "Author"
      },
      {
        "identity" : "AuthorDocumentEntryDICOMKOS",
        "map" : "Author"
      }]
    },
    {
      "id" : "AuthorDocumentEntry.institution",
      "path" : "AuthorDocumentEntry.institution",
      "short" : "Cet attribut représente la structure de l’auteur. Pour les documents d’expression personnelle du patient, cette métadonnée est absente."
    },
    {
      "id" : "AuthorDocumentEntry.person[x]",
      "path" : "AuthorDocumentEntry.person[x]",
      "short" : "Cet attribut représente l’auteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient.  "
    },
    {
      "id" : "AuthorDocumentEntry.role",
      "path" : "AuthorDocumentEntry.role",
      "short" : "cette métadonnée représente le rôle joué par l’auteur vis-à-vis du patient lors de la constitution du lot de soumission, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.).",
      "mapping" : [{
        "identity" : "AuthorDocumentEntryCDA",
        "map" : "author/functionCode@displayName"
      },
      {
        "identity" : "AuthorDocumentEntryDICOMKOS",
        "map" : "Cet attribut n'a pas besoin d’être alimenté par un élément du DICOM KOS"
      }]
    },
    {
      "id" : "AuthorDocumentEntry.specialty",
      "path" : "AuthorDocumentEntry.specialty",
      "mapping" : [{
        "identity" : "AuthorDocumentEntryCDA",
        "map" : "author/assignedAuthor/code@code"
      },
      {
        "identity" : "AuthorDocumentEntryDICOMKOS",
        "map" : "Cette métadonnée peut ne pas être renseignée dans le cas d’un DICOM KOS.   Si elle contient une valeur, elle devra contenir le code : 'DISPOSITIF' du JDV_J01_XdsAuthorSpecialty_CISIS"
      }]
    }]
  }
}

```
