Logical: Author
Parent: Base
Id: Author
Title: "Author (LM)"
Description: """
This Logical Mode describes the relevant attributes on the **Author** class within IHE ITI XDS.
More details are to be retrieved from IHE ITI on www.ihe.net.
(Focus for this LM is on the coded attributes.)
"""

* institution 0..1 string "institution of author"
* person 0..1 string "author"
* role 1..1 CodeableConcept "role of the author of this document" "**Author Role**"
* role from https://mos.esante.gouv.fr/NOS/JDV_J47-FunctionCode-CISIS/FHIR/JDV-J47-FunctionCode-CISIS (required)
* specialty 0..* CodeableConcept "specialty of the author for this document" "**AutorSpecialty**"
* specialty from https://mos.esante.gouv.fr/NOS/JDV_J56-AuthorSpecialty-DMP/FHIR/JDV-J56-AuthorSpecialty-DMP (required)
* telecommunication 0..1 string "contact information"