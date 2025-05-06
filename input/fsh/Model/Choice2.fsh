
Logical: Choice2
Title: "Choice2"
Description: """
Identification nationale principale du professionnel propre aux SI de l’ANS et au CI-SIS. (Correspondance dans le MOS : idNat_PS) 

L’identification nationale du PS est construite selon le tableau dessous :
-  0 + N° ADELI 
- 1 + Identifiant cabinet ADELI/identifiant interne 
- 3 + FINESS/identifiant interne 
- 4 + SIREN/identifiant interne 
- 5 + SIRET/identifiant interne 
- 6 + Identifiant cabinet RPPS/identifiant interne 
- 8 + N° RPPS 

"""
* . obeys PSIdNat-invariant

Invariant:   PSIdNat-invariant
Description: "Le numéro PSIdNat doit être un entier commençant par 0, 1, 3, 4, 5, 6 ou 8"
Expression: "$this.matches('^(0|1|3|4|5|6|8)\\d*$')"
Severity:    #error