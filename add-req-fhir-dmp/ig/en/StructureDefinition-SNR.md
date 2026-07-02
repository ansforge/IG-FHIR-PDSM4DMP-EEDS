# SNR - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Logical Model: SNR 

 
Identifiant interne de l’instance de la solution ayant produit le document au format OID 

**Usages:**

* Use this Logical Model: [ActorSNR (LM)](StructureDefinition-ActorSNR.md) and [Identifiant](StructureDefinition-Identifiant.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-SNR.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-SNR.csv), [Excel](../StructureDefinition-SNR.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SNR",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SNR",
  "version" : "0.1.0",
  "name" : "SNR",
  "title" : "SNR",
  "status" : "draft",
  "date" : "2026-07-02T13:05:16+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Identifiant interne de l’instance de la solution ayant produit le document au format OID ",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/SNR",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "SNR",
      "path" : "SNR",
      "short" : "SNR",
      "definition" : "Identifiant interne de l’instance de la solution ayant produit le document au format OID "
    },
    {
      "id" : "SNR.SNR",
      "path" : "SNR.SNR",
      "short" : "SNR",
      "definition" : "SNR",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
