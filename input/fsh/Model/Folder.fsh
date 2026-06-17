Logical: Folder
Parent: Base
Id: Folder
Title: "Folder (LM)"
Description: """
Modèle logique  d’une classeur
"""
* availabilityStatus 1..1 CodeableConcept "Cette métadonnée représente la pertinence de la version de la fiche d'un document. " "**Availability Status**"
* availabilityStatus from https://mos.esante.gouv.fr/NOS/JDV_J52-AvailabilityStatus-CISIS/FHIR/JDV-J52-AvailabilityStatus-CISIS (preferred)
* codeList 1..* CodeableConcept "Cette métadonnée contient une liste d'un ou plusieurs identifiant(s) d'objet(s) associé(s) au document."
* comments 0..1 string "Cette métadonnée contient le commentaire associé au classeur."
* entryUUID 1..1 uuid "Cette métadonnée représente l’identifiant unique du classeur." 
* lastUpdateTime 1..1 dateTime "Cette métadonnée correspond à la date et l’heure de la dernière mise à jour du classeur."
* patientID 1..1 PatientId "Cette métadonnée représente l’identifiant du patient, en l’occurrence, le matricule INS (NIR ou NIA) du patient
tel que défini dans le cadre juridique."
* title 1..1 string "Cette métadonnée représente le titre du classeur."
* uniqueId 1..1 Identifier "Cette métadonnée représente l’identifiant unique global affecté au classeur par son créateur."
* homeCommunityId  0..1 oid "Cette métadonnée correspond à l’identifiant de la communauté représentée par le système cible si celui-ci offre
des fonctionnalités de communication avec d’autres communautés telles que présentées dans le profil XCA
d’IHE. Elle n’est pas utilisée par les transactions décrites dans ce volet."
* logicalId 1..1 Identifier "Cette métadonnée représente un identifiant invariable pour toutes les versions du classeur, à la différence de la
métadonnée entryUUID qui a une valeur différente pour chaque version du classeur"
* version 0..1 integer "Cette métadonnée représente le numéro de version du classeur"


