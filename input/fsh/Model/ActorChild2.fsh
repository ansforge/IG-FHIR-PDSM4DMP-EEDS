Logical: ActorChild2
Parent: ActorParent
Id: ActorChild2
Title: "ActorChild2 (LM)"
Description: """
Cet attribut représente un acteur PS. 
"""
Characteristics: #can-be-target

* XCN1[x] only Choice2
* XCN1[x] ^example[0].label = "Professionnel avec un identifiant national RPPS (préfixe 8)"
* XCN1[x] ^example[=].valueString = "801234567890"
* XCN1[x] ^example[+].label = "Professionnel avec un identifiant interne dans une structure de santé FINESS"
* XCN1[x] ^example[=].valueString = "3750100125/1453"
* XCN3 ^short = "Prénom usuel de la personne"