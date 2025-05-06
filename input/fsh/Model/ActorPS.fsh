Logical: ActorPS
Parent: ActorXDS
Id: ActorPS
Title: "ActorPS (LM)"
Description: """
Cet attribut représente un acteur PS. 
"""
Characteristics: #can-be-target

* XCN1.value[x] only PSIdNat
* XCN1 ^example[0].label = "Professionnel avec un identifiant national RPPS (préfixe 8)"
* XCN1 ^example[=].valueString = "801234567890"
* XCN1 ^example[+].label = "Professionnel avec un identifiant interne dans une structure de santé FINESS"
* XCN1 ^example[=].valueString = "3750100125/1453"
* XCN2 ^short = "Nom d'exercice du professionnel"
* XCN3 ^short = "Prénom usuel de la personne"
* XCN9.composant2 = "1.2.250.1.71.4.2.1"
* XCN10 = #D
* XCN13 = #IDNPS

