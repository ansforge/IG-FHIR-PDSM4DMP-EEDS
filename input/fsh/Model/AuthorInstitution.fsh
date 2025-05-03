Logical: AuthorInstitution
Parent: Base
Id: AuthorInstitution
Title: "AuthorInstitution (LM)"
Description: """
Cette métadonnée représente la structure émettrice du lot de soumission. 
Pour les documents d’expression personnelle du patient, cette métadonnée est absente, cela signifie que l’élément XML <rim:Slot name='authorInstitution'> n’est pas transmis. 
"""

* XON1 1..1 string "Nom de la structure"
* XON1 ^example.label = "Structure hospitalière"
* XON1 ^example.valueString = "Groupe Pitié Salpêtrière"
* XON1 ^example.label = "Cabinet libéral"
* XON1 ^example.valueString = "CABINET MEDICAL DR DURANT "
* XON1 ^example.label = "SNR"
* XON1 ^example.valueString = "NOM EDITEUR "


* XON6 1..1 Base "Autorité d’affectation"
* XON6.composant1  1..1 string "Vide, pas de valeur"

* XON6.composant2  1..1 string "Valeur de Universal ID"
* XON6.composant2  ^example.label = "Professionnel"
* XON6.composant2  ^example.valueString = "1.2.250.1.71.4.2.2"
* XON6.composant2  ^example.label = "Système de structure"
* XON6.composant2  ^example.valueString = "1.2.250.1.71.4.2.2"
* XON6.composant2  ^example.label = "SNR"
* XON6.composant2  ^example.valueString = "1.3.2 (OID SIRENE)"

* XON6.composant3  1..1 string "Valeur de Universal ID type (ID)"


* XON7 1..1 code "Type d’identifiant"
* XON7  ^example.label = "Professionnel"
* XON7  ^example.valueString = "IDNST"
* XON7  ^example.label = "Système de structure"
* XON7  ^example.valueString = "IDNST"
* XON7  ^example.label = "SNR"
* XON7  ^example.valueString = "SIREN"

* XON10 1..1 StructIdNat " Identifiant de la structure (Struct_IdNat)"


Mapping: AuthorInstitutionCDA
Target : "http://hl7.org/v3/cda"
Description : "Mapping CDA"
Source: AuthorInstitution
* -> "AuthorInstitution"
* XON1 -> "author/assignedAuthor/representedOrganization/name"
* XON6.composant1 -> "NA"
* XON6.composant2 -> "author/assignedAuthor/representedOrganization/id@root "
* XON6.composant3 -> "NA"
* XON7 -> "Valeur ne provenant pas de l’en-tête CDA"
* XON10 -> "author/assignedAuthor/representedOrganization/id@extension"

Mapping: AuthorInstitutionDICOMKOS
Id: KOS
Target : "https://www.dicomstandard.org/"
Description : "Mapping DICOM KOS"
Source: AuthorInstitution
* -> "AuthorInstitution"
* XON1 -> "NA"
* XON6.composant1 -> "NA"
* XON6.composant2 -> "NA "
* XON6.composant3 -> "NA"
* XON7 -> "NA"
* XON10 -> "NA"