Logical: AuthorPerson
Parent: Base
Id: AuthorPerson
Title: "AuthorPerson (LM)"
Description: """
Cet attribut représente l’auteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient. 
"""

* 1 1..1 PSIdNat "Identifiant (PS_IdNat)"
* 2 1..1 string "Nom d'exercice du professionnel, nom du patient, nom du système."
* 3 1..1 string "Prénom usuel de la personne (par défaut le premier prénom), nom du modèle pour les dispositifs ou dénomination pour les autres systèmes."
* 9 1..1 string " Autorité d’affectation "
* 10 1..1 string "Type de nom : Valeur en fonction de l’auteur : • D, pour les personnes physiques, • U, pour les systèmes."
* 13 1..1 string "Type d’identifiant"
