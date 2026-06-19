# AuthorInstitution (LM) - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: AuthorInstitution (LM) 

 
Cet attribut représente la structure de l’auteur. Pour les documents d’expression personnelle du patient, cette métadonnée est absente, cela signifie que l’élément XML  n’est pas transmis. 

## Type

XON du standard HL7 v2.5.

## Contenu

Cet attribut est constitué de plusieurs composants. Les composants 1, 6, 7 et 10 doivent être renseignés.

**Usages:**

* Use this Logical Model: [Author (LM)](StructureDefinition-Author.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-AuthorInstitution.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-AuthorInstitution.csv), [Excel](../StructureDefinition-AuthorInstitution.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "AuthorInstitution",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorInstitution",
  "version" : "0.1.0",
  "name" : "AuthorInstitution",
  "title" : "AuthorInstitution (LM)",
  "status" : "draft",
  "date" : "2026-06-19T17:16:10+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Cet attribut représente la structure de l’auteur. \nPour les documents d’expression personnelle du patient, cette métadonnée est absente, cela signifie que l’élément XML <rim:Slot name='authorInstitution'> n’est pas transmis. ",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "AuthorInstitutionCDA",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "AuthorInstitutionCDA",
    "comment" : "Mapping CDA"
  },
  {
    "identity" : "KOS",
    "uri" : "https://www.dicomstandard.org/",
    "name" : "AuthorInstitutionDICOMKOS",
    "comment" : "Mapping DICOM KOS"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/AuthorInstitution",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "AuthorInstitution",
      "path" : "AuthorInstitution",
      "short" : "AuthorInstitution (LM)",
      "definition" : "Cet attribut représente la structure de l’auteur. \nPour les documents d’expression personnelle du patient, cette métadonnée est absente, cela signifie que l’élément XML <rim:Slot name='authorInstitution'> n’est pas transmis. ",
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "AuthorInstitution"
      },
      {
        "identity" : "KOS",
        "map" : "AuthorInstitution"
      }]
    },
    {
      "id" : "AuthorInstitution.XON1",
      "path" : "AuthorInstitution.XON1",
      "short" : "Nom de la structure",
      "definition" : "Nom de la structure",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "example" : [{
        "label" : "Structure hospitalière",
        "valueString" : "Groupe Pitié Salpêtrière"
      },
      {
        "label" : "Cabinet libéral",
        "valueString" : "CABINET MEDICAL DR DURANT "
      },
      {
        "label" : "SNR",
        "valueString" : "NOM EDITEUR "
      }],
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "author/assignedAuthor/representedOrganization/name (Si l’élément name fait l’objet d’un nullFlavor dans l’en-tête CDA, le composant 1 de la métadonnée authorInstitution doit être vide)"
      },
      {
        "identity" : "KOS",
        "map" : "NA"
      }]
    },
    {
      "id" : "AuthorInstitution.XON6",
      "path" : "AuthorInstitution.XON6",
      "short" : "Autorité d’affectation",
      "definition" : "Identifiant de l’organisme gérant l’identifiant de la structure. Cet identifiant, au format HL7 v.2.5 est constitué de trois sous-composants qui prennent les valeurs suivantes. ",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "AuthorInstitution.XON6.composant1",
      "path" : "AuthorInstitution.XON6.composant1",
      "short" : "Vide, pas de valeur",
      "definition" : "Vide, pas de valeur",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "NA"
      },
      {
        "identity" : "KOS",
        "map" : "NA"
      }]
    },
    {
      "id" : "AuthorInstitution.XON6.composant2",
      "path" : "AuthorInstitution.XON6.composant2",
      "short" : "Valeur de Universal ID",
      "definition" : "Valeur de Universal ID",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "example" : [{
        "label" : "Professionnel",
        "valueString" : "1.2.250.1.71.4.2.2"
      },
      {
        "label" : "Système de structure",
        "valueString" : "1.2.250.1.71.4.2.2"
      },
      {
        "label" : "SNR",
        "valueString" : "1.3.2 (OID SIRENE)"
      }],
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "author/assignedAuthor/representedOrganization/id@root (Si l’élément id fait l’objet d’un nullFlavor dans l’en-tête CDA, les composants 6, 7 et 10 de la métadonnée authorInstitution doivent être vides)"
      },
      {
        "identity" : "KOS",
        "map" : "NA "
      }]
    },
    {
      "id" : "AuthorInstitution.XON6.composant3",
      "path" : "AuthorInstitution.XON6.composant3",
      "short" : "Valeur de Universal ID type (ID)",
      "definition" : "Valeur de Universal ID type (ID)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "NA"
      },
      {
        "identity" : "KOS",
        "map" : "NA"
      }]
    },
    {
      "id" : "AuthorInstitution.XON7",
      "path" : "AuthorInstitution.XON7",
      "short" : "Type d’identifiant",
      "definition" : "Type d’identifiant",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "example" : [{
        "label" : "Professionnel",
        "valueString" : "IDNST"
      },
      {
        "label" : "Système de structure",
        "valueString" : "IDNST"
      },
      {
        "label" : "SNR",
        "valueString" : "SIREN"
      }],
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "Valeur ne provenant pas de l’en-tête CDA"
      },
      {
        "identity" : "KOS",
        "map" : "NA"
      }]
    },
    {
      "id" : "AuthorInstitution.XON10",
      "path" : "AuthorInstitution.XON10",
      "short" : " Identifiant de la structure (Struct_IdNat)",
      "definition" : " Identifiant de la structure (Struct_IdNat)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/StructIdNat"
      }],
      "mapping" : [{
        "identity" : "AuthorInstitutionCDA",
        "map" : "author/assignedAuthor/representedOrganization/id@extension"
      },
      {
        "identity" : "KOS",
        "map" : "NA"
      }]
    }]
  }
}

```
