Logical: StructIdNat
Title: " StructIdNat"
Description: """
Identification nationale principale d’une structure propre aux SI de l'ANS et au CI-SIS 4. 

L’identification nationale d’une structure est construite selon le tableau dessous :
-  0 + Identifiant cabinet ADELI 
- 1 + N° FINESS 2 + N° SIREN 
- 3 + N° SIRET 
- 4 + N° RPPS-rang 
- Néant + N° technique 

"""


* StructIdNat 1..1 string "StructIdNat" "StructIdNat"