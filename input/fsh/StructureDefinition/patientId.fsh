Logical: PatientId
Parent: Base
Id: PatientId
Title: "PatientId (LM)"
Description: """
Modèle logique de patientID.
PatientID représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient. 
"""

* CX1 1..1 Identifier "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique"
* CX4 1..1 string "Identifiant de l’autorité d’affectation de l’INS utilisé."
* CX5 1..1 string " 'NH' pour un maticule INS tel que défini dans le cadre juridique"