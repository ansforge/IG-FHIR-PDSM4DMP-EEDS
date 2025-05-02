Logical: EventCode
Parent: Base
Id: EventCode
Title: "EventCode (LM)"
Description: """
Model logique d'un eventCode.
Un EventCode peut contenir le code représentant : 
-  un évènement documenté (acte, traitement, diagnostic, etc…),  
-  une modalité d’acquisition, 
-  une région anatomique. 
"""

* eventCode 1..1 CodeableConcept "Cet attribut peut contenir le code représentant : • un évènement documenté (acte, traitement, diagnostic, etc…),  • une modalité d'acquisition, • une région anatomique. " 
