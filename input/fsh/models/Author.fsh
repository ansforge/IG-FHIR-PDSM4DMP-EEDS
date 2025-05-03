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


author est un ensemble constitué des sous-attributs authorInstitution, authorPerson, authorRole et authorSpecialty et ne porte pas de valeur par lui-même. 
"""

* institution 0..1 AuthorInstitution "Cet attribut représente la structure de l’auteur."


* person 1..1 Reference(AuthorPersonPS or AuthorPersonPatient or AuthorPersonSNR or AuthorPersonSystem) "author"


* role 1..1 CodeableConcept "Cet attribut représente le rôle fonctionnel joué par l’auteur vis-à-vis du patient/usager lors de la création du document, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.). " "**Author Role**"
* role from https://mos.esante.gouv.fr/NOS/JDV_J47-FunctionCode-CISIS/FHIR/JDV-J47-FunctionCode-CISIS (required)
* specialty 0..1 CodeableConcept "Cet attribut représente la profession éventuellement associée au savoir-faire de l’auteur professionnel caractérisé par sa profession ou la profession associée au genre d’activité pour l’auteur professionnel caractérisé par son rôle. " "**AutorSpecialty**"
* specialty from https://mos.esante.gouv.fr/NOS/JDV_J56-AuthorSpecialty-DMP/FHIR/JDV-J56-AuthorSpecialty-DMP (required)


Mapping: AuthorCDA
Target : "http://hl7.org/v3/cda"
Description : "Mapping CDA"
Source: Author
* -> "Author"
* role -> "author/functionCode@displayName"
* specialty -> "author/assignedAuthor/code@code"

Mapping: AuthorDICOMKOS
Id: KOS
Target : "https://www.dicomstandard.org/"
Description : "Mapping DICOM KOS"
Source: Author
* -> "Author"
* role -> "Cet attribut n'a pas besoin d’être alimenté par un élément du DICOM KOS"
* specialty -> "Cette métadonnée peut ne pas être renseignée dans le cas d’un DICOM KOS.   Si elle contient une valeur, elle devra contenir le code : 'DISPOSITIF' du JDV_J01_XdsAuthorSpecialty_CISIS"
