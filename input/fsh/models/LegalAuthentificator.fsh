Logical: LegalAuthenticator
Parent: Base
Id: LegalAuthenticator
Title: "LegalAuthenticator (LM)"
Description: """
Cette métadonnée représente l’acteur prenant la responsabilité du contenu médical du document : 
-  soit le professionnel qui prend la responsabilité du document (CDA ou DICOM KOS) produit par un professionnel (lui-même ou un autre) ou par un système rattaché à une structure (ES, …). 
-  soit le patient/usager responsable du document d'expression personnelle • soit un système : exceptionnellement et uniquement pour le cas ci-dessous : 
  - système via un SNR responsable du document produit via ce SNR. 
"""

* 1 1..1 identifier "Identifiant (PS_IdNat)"
* 2 1..1 string "Nom d'exercice du professionnel, nom du patient, nom du système."
* 3 1..1 string "Prénom usuel de la personne (par défaut le premier prénom), nom du modèle pour les dispositifs ou dénomination pour les autres systèmes."
* 9 1..1 string " Autorité d’affectation "
* 10 1..1 string "Type de nom : Valeur en fonction de l’auteur : • D, pour les personnes physiques, • U, pour les systèmes."
* 13 1..1 string "Type d’identifiant"