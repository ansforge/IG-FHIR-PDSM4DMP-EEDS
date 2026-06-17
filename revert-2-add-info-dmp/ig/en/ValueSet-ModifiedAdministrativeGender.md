# ModifiedAdministrativeGender - Utilisation de PDSm pour le DMP dans le contexte d'EEDS v0.1.0

## ValueSet: ModifiedAdministrativeGender 

 
AdministrativeGender without unknown code 

 **References** 

* [Patient français](StructureDefinition-fr-patient.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "ModifiedAdministrativeGender",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/ValueSet/ModifiedAdministrativeGender",
  "version" : "0.1.0",
  "name" : "ModifiedAdministrativeGender",
  "title" : "ModifiedAdministrativeGender",
  "status" : "draft",
  "date" : "2026-06-17T13:47:59+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "AdministrativeGender without unknown code",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://hl7.org/fhir/administrative-gender"
    }],
    "exclude" : [{
      "system" : "http://hl7.org/fhir/administrative-gender",
      "concept" : [{
        "code" : "unknown"
      }]
    }]
  }
}

```
