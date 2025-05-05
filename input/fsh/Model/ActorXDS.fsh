Logical: ActorXDS
Parent: Base
Id: ActorXDS
Title: "ActorXDS (LM)"
Description: """
Cet attribut représente un acteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient. 

XCN de HL7 v2.5
"""

* XCN1 1..1 Reference(PSIdNat or  MatriculeINS or SNR or IdentifiantSysteme) "Identifiant"
* XCN2 1..1 string "Nom d'exercice du professionnel, nom du patient, nom du système."
* XCN3 1..1 string "Prénom usuel de la personne (par défaut le premier prénom), nom du modèle pour les dispositifs ou dénomination pour les autres systèmes."
* XCN9 1..1 Base " Autorité d’affectation"
* XCN9.composant1  0..0 string "Vide, pas de valeur"
* XCN9.composant2  1..1 string "Valeur de Universal ID"
* XCN9.composant3  1..1 string "Valeur de Universal ID type (ID)"
* XCN10 1..1 code "Type de nom : Valeur en fonction de l’auteur :  D, pour les personnes physiques, • U, pour les systèmes."
* XCN13 1..1 code "Type d’identifiant"

Mapping: ActorXDSCDA
Target : "http://hl7.org/v3/cda"
Description : "Mapping CDA"
Source: ActorXDS
* -> "ActorXDS"
* XCN1 -> "author/assignedAuthor/id@extension"
* XCN2 -> "author/assignedAuthor/assignedPerson/name/family"
* XCN3 -> "author/assignedAuthor/assignedPerson/name/given"
* XCN9 -> "NA"
* XCN9.composant1 -> "NA"
* XCN9.composant2 -> "author/assignedAuthor/id@root"
* XCN9.composant3 -> "NA"
* XCN10 -> "NA"
* XCN13 -> "Valeur ne provenant pas de l’en-tête CDA"