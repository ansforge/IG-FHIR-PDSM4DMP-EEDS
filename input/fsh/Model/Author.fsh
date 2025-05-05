Logical: Author
Parent: Base
Id: Author
Title: "Author (LM)"
Description: """
Modèle logique d'un auteur.

Représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document ou d'un lot de soummission. 

L’auteur peut être : 
- Un professionnel (personne physique) via son logiciel de professionnel, 
- Le patient/usager (personne physique) via Mon espace Santé, 
- Un système de structure (dispositif, automate, appareil connecté…), 
- Un SNR (Service Numérique Référencé), 


**author** est un ensemble constitué des sous-attributs **authorInstitution** , **authorPerson**, **authorRole** et **authorSpecialty** et ne porte pas de valeur par lui-même. 
"""

* institution 0..1 AuthorInstitution "Cet attribut représente la structure de l’auteur." """Cet attribut représente la structure de l’auteur."""


* person[x] 1..1 ActorPS or ActorPatient or ActorSNR or ActorSystem "Author" """Author"""

* role 0..* CodeableConcept "Cet attribut représente le rôle fonctionnel joué par l’auteur vis-à-vis du patient/usager lors de la création du document, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.). " "**Author Role**"
* role from https://mos.esante.gouv.fr/NOS/JDV_J47-FunctionCode-CISIS/FHIR/JDV-J47-FunctionCode-CISIS (required)
* specialty 0..1 CodeableConcept "Cet attribut représente la profession éventuellement associée au savoir-faire de l’auteur professionnel caractérisé par sa profession ou la profession associée au genre d’activité pour l’auteur professionnel caractérisé par son rôle. " "**AutorSpecialty**"
* specialty from https://mos.esante.gouv.fr/NOS/JDV_J56-AuthorSpecialty-DMP/FHIR/JDV-J56-AuthorSpecialty-DMP (required)


