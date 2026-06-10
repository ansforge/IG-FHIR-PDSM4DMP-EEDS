# EventCode (LM) - Utilisation de PDSm pour le DMP dans le contexte d'EEDS v0.1.0

## Logical Model: EventCode (LM) 

 
Modèle logique d'un eventCode. Un EventCode peut contenir le code représentant : 
* un évènement documenté (acte, traitement, diagnostic, etc…),
* une modalité d’acquisition,
* une région anatomique.
 

**Usages:**

* Use this Logical Model: [Document Entry (LM)](StructureDefinition-DocumentEntry.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/ans.fhir.fr.pdsm4dmp|current/StructureDefinition/StructureDefinition-EventCode.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-EventCode.csv), [Excel](../StructureDefinition-EventCode.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "EventCode",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/EventCode",
  "version" : "0.1.0",
  "name" : "EventCode",
  "title" : "EventCode (LM)",
  "status" : "draft",
  "date" : "2026-06-10T16:12:06+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Modèle logique d'un eventCode.\nUn EventCode peut contenir le code représentant : \n-  un évènement documenté (acte, traitement, diagnostic, etc…),  \n-  une modalité d’acquisition, \n-  une région anatomique. ",
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
  "type" : "https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp/StructureDefinition/EventCode",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base|4.0.1",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "EventCode",
      "path" : "EventCode",
      "short" : "EventCode (LM)",
      "definition" : "Modèle logique d'un eventCode.\nUn EventCode peut contenir le code représentant : \n-  un évènement documenté (acte, traitement, diagnostic, etc…),  \n-  une modalité d’acquisition, \n-  une région anatomique. "
    },
    {
      "id" : "EventCode.eventCode",
      "path" : "EventCode.eventCode",
      "short" : "Cet attribut peut contenir le code représentant : • un évènement documenté (acte, traitement, diagnostic, etc…),  • une modalité d'acquisition, • une région anatomique. ",
      "definition" : "Cet attribut peut contenir le code représentant : • un évènement documenté (acte, traitement, diagnostic, etc…),  • une modalité d'acquisition, • une région anatomique. ",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
