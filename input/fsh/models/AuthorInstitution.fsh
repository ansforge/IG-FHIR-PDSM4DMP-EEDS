Logical: AuthorInstitution
Parent: Base
Id: AuthorInstitution
Title: "AuthorInstitution (LM)"
Description: """
Cet attribut représente la structure de l’auteur. Pour les documents d’expression personnelle du patient, cette métadonnée est absente, cela signifie que l’élément XML <rim:Slot name='authorInstitution'> n’est pas transmis. 
"""

* 1 1..1 string "Nom de la structure"
* 6 1..1 string "Autorité d’affectation"
* 7 1..1 string "Type d’identifiant"
* 10 1..1 identifier " Identifiant de la structure (Struct_IdNat)"
