Logical: ActorPatient
Parent: ActorXDS
Id: ActorPatient
Title: "ActorPatient (LM)"
Description: """
Cet attribut représente l'acteur Patient. 
"""
Characteristics: #can-be-target

* XCN1.value[x] only MatriculeINS
* XCN1 ^example.label = "General"
* XCN1 ^example.valueString = "124018852493334"
* XCN2 ^short = "Nom du patient"
* XCN3 ^short = "Prénom du patient"
* XCN9.composant2  ^short = "Valeur de l'OID de l’autorité d’affectation de l’identifiant"
* XCN10  = #D
* XCN13 = #NH