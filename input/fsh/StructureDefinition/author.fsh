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
"""

* institution 0..1 BackboneElement "Cet attribut représente la structure de l’auteur."
* institution.XON1 1..1 string "Nom de la structure"
* institution.XON6 1..1 string "Autorité d’affectation"
* institution.XON7 1..1 string "Type d’identifiant"
* institution.XON10 1..1 identifier " Identifiant de la structure (Struct_IdNat)"

* person 1..1 BackboneElement "author"
* person.XCN1 1..1 identifier "Identifiant (PS_IdNat)"
* person.XCN2 1..1 string "Nom d'exercice du professionnel, nom du patient, nom du système."
* person.XCN3 1..1 string "Prénom usuel de la personne (par défaut le premier prénom), nom du modèle pour les dispositifs ou dénomination pour les autres systèmes."
* person.XCN9 1..1 string " Autorité d’affectation "
* person.XCN10 1..1 string "Type de nom : Valeur en fonction de l’auteur : • D, pour les personnes physiques, • U, pour les systèmes."
* person.XCN13 1..1 string "Type d’identifiant"

* role 1..1 CodeableConcept "Cet attribut représente le rôle fonctionnel joué par l’auteur vis-à-vis du patient/usager lors de la création du document, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.). " "**Author Role**"
* role from https://mos.esante.gouv.fr/NOS/JDV_J47-FunctionCode-CISIS/FHIR/JDV-J47-FunctionCode-CISIS (required)
* specialty 0..1 CodeableConcept "Cet attribut représente la profession éventuellement associée au savoir-faire de l’auteur professionnel caractérisé par sa profession ou la profession associée au genre d’activité pour l’auteur professionnel caractérisé par son rôle. " "**AutorSpecialty**"
* specialty from https://mos.esante.gouv.fr/NOS/JDV_J56-AuthorSpecialty-DMP/FHIR/JDV-J56-AuthorSpecialty-DMP (required)
