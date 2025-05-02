Logical: AuthorPersonPatient
Parent: Base
Id: AuthorPersonPatient
Title: "AuthorPersonPatient (LM)"
Description: """
Cet attribut représente l’auteur Patient. 
"""

* 1 1..1 MatriculeINS "Identifiant"
* 2 1..1 string "Nom du patient"
* 3 1..1 string "Prénom du Patient"
* 9 1..1 string " Valeur de l'OID de l’autorité d’affectation de l’identifiant ( "
* 10 1..1 string "D"
* 13 1..1 string "IDNPS"
