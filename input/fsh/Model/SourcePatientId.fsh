Logical:  SourcePatientId
Parent: Base
Id:  SourcePatientId
Title: " SourcePatientId (LM)"
Description: """
Cette métadonnée contient l’identifiant secondaire du patient dans le système d’information du producteur (IPP) ou l’INS, s’il n’y a pas d’identifiant secondaire. Pour les documents d’expression personnelle du patient, cette métadonnée contient l’INS du patient, à savoir le même identifiant que patientId. 
"""

* CX1 1..1 Identifier "Identifiant du patient, en l’occurrence, le matricule INS du patient tel que défini dans le cadre juridique"
* CX4 1..1 string "Identifiant de l’autorité d’affectation de l’INS utilisé."
* CX5 1..1 string " 'NH' pour un maticule INS tel que défini dans le cadre juridique"
