Logical: PatientId
Parent: Base
Id: PatientId
Title: "PatientId (LM)"
Description: """
Modèle logique de patientID.
PatientID représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient. 
"""

* CX1 1..1 Identifier "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique"
* CX4 1..1 string "Identifiant de l’autorité d’affectation de l’INS utilisé." """
Cet identifiant, au format HL7 v.2.5 est constitué de trois sous-composants qui prennent les valeurs suivantes.
|Valeur de Namespace ID (IS)| Valeur de Universal ID (ST)| Valeur de Universal ID type (ID)
Vide, pas de valeur |OID de l’autorité d’affectation de l’INS utilisé Valeur de Universal ID type (ID) ISO prise dans la liste des OID des autorités d'affectation des INS | ISO
"""
* CX5 1..1 string " 'NH' pour un maticule INS tel que défini dans le cadre juridique"