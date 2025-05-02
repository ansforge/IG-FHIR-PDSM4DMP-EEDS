Logical:  SourcePatientInfo
Parent: Base
Id:  SourcePatientInfo
Title: " SourcePatientInfo (LM)"
Description: """
Cette métadonnée contient les traits d’identité du patient concerné par le document, connus par le producteur du document. Les informations présentes dans la métadonnée sourcePatientInfo ne doivent en aucun cas être réutilisées pour calculer un identifiant, ni être mises à jour après la soumission du document. 

"""

* PID 1..1 Base "type PID"
* PID.3 0..1 Identifier "Liste des identifiants du patient"
* PID.5 1..* string "Nom et prénoms du patient"
* PID.7 0..1 string "Date/heure de naissance du patient"
* PID.8 0..1 string "Sexe du patient"
* PID.11 0..1 string "Adresse du patient"
* PID.13 0..1 string "Téléphone de la résidence du patient"
* PID.14 0..1 string "Téléphone professionnel du patient"
* PID.15 0..1 string "Langue du patient"
* PID.16 0..1 string "Statut marital du patient"
* PID.18 0..1 string "Numéro de compte du patient"
* PID.21 0..1 string "Identifiant de la mère du patient"
