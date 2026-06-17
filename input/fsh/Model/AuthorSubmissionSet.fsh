Logical: AuthorSubmissionSet
Parent: Author
Id: AuthorSubmissionSet
Title: "AuthorSubmissionSet (LM)"
Description: """
Modèle logique d'un auteur d'un lot de soumission
Cette métadonnée représente les personnes physiques et/ou les systèmes auteurs d’un lot de soumission. 
Constituée des sous-attributs **authorInstitution**, **authorPerson**, **authorRole** et **authorSpecialty**, elle ne porte pas de valeur par elle-même. 
"""

* institution ^short =  "Cette métadonnée représente la structure émettrice du lot de soumission"
* person[x] ^short = "Cette métadonnée représente la personne physique ou le système émetteur du lot de soumission.Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient.  "
* role ^short = "ette métadonnée représente le rôle joué par l’auteur vis-à-vis du patient lors de la constitution du lot de soumission, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.)."
