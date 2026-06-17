# Melting Pot Value Set - Utilisation de PDSm pour le DMP dans le contexte d'EEDS v0.1.0

## ValueSet: Melting Pot Value Set 

 
Melting Pot Value Set. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "MeltingPotVS",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/ValueSet/MeltingPotVS",
  "version" : "0.1.0",
  "name" : "MeltingPotVS",
  "title" : "Melting Pot Value Set",
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
  "description" : "Melting Pot Value Set.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "405738005",
        "display" : "Blue color (qualifier value)"
      },
      {
        "code" : "371254008"
      }]
    },
    {
      "system" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/CodeSystem/competence-code-system",
      "concept" : [{
        "code" : "C01"
      }]
    },
    {
      "system" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/CodeSystem/type-carte-code-system"
    }]
  }
}

```
