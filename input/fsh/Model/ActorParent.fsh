Logical: ActorParent
Parent: Base
Id: ActorParent
Title: "ActorParent (LM)"
Description: """
Cet attribut représente un acteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient. 

XCN de HL7 v2.5
"""

* XCN1[x] 1..1 Choice1 or Choice2 or Choice3  "Identifiant de l'acteur"



Mapping: ActorXDSCDA
Target : "http://hl7.org/v3/cda"
Description : "Mapping CDA"
Source: ActorParent
* -> "ActorParent"
* XCN1[x] -> "author/assignedAuthor/id@extension"