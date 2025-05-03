Logical: AuthorDocumentEntry
Parent: Author
Id: AuthorDocumentEntry
Title: "AuthorDocumentEntry (LM)"
Description: """
Modèle logique d'un auteur d'un documeny
Cette métadonnée représente les personnes physiques et/ou les systèmes (dispositifs, automates, services numériques référencés…) auteurs d’un document. 
L’auteur peut être : 
-  Un professionnel (personne physique) via son logiciel de professionnel, 
- Le patient/usager (personne physique) via Mon espace Santé, 
-  Un système de structure (dispositif, automate, appareil connecté…), 
-  Un SNR (Service Numérique Référencé), """

* institution ^short =  "Cet attribut représente la structure de l’auteur. Pour les documents d’expression personnelle du patient, cette métadonnée est absente."
* person ^short = "Cet attribut représente l’auteur (humain ou système) ayant contribué au document. Pour les documents d’expression personnelle du patient, cette métadonnée fait référence au patient.  "
* role ^short = "ette métadonnée représente le rôle joué par l’auteur vis-à-vis du patient lors de la constitution du lot de soumission, c'est-à-dire à quel titre l’auteur est intervenu vis-à-vis du patient (ex : médecin traitant, Responsable de l'admission, Membre de l'équipe de soins, etc.)."


Mapping: AuthorDocumentEntryCDA
Target : "http://hl7.org/v3/cda"
Description : "Mapping CDA"
Source: AuthorDocumentEntry
* -> "Author"
* role -> "author/functionCode@displayName"
* specialty -> "author/assignedAuthor/code@code"

Mapping: AuthorDocumentEntryDICOMKOS
Target : "https://www.dicomstandard.org/"
Description : "Mapping DICOM KOS"
Source: AuthorDocumentEntry
* -> "Author"
* role -> "Cet attribut n'a pas besoin d’être alimenté par un élément du DICOM KOS"
* specialty -> "Cette métadonnée peut ne pas être renseignée dans le cas d’un DICOM KOS.   Si elle contient une valeur, elle devra contenir le code : 'DISPOSITIF' du JDV_J01_XdsAuthorSpecialty_CISIS"
