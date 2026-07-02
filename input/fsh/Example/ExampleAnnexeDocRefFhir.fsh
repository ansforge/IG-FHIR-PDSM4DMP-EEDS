Alias: $loinc = http://loinc.org
Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $formatcode = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode
Alias: $TRE-A03 = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument
Alias: $SCT = http://snomed.info/sct

Instance: patient-source-annexe-fhir
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier.value = "123456789012345"

Instance: practitionerrole-author-annexe-fhir
InstanceOf: as-practitionerrole
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier.value = "899700218896"

Instance: example-annexe-docref-fhir
InstanceOf: pdsm-comprehensive-document-reference
Usage: #example
Title: "Exemple Annexe - DocumentReference pointant vers un document FHIR (Bundle)"
Description: "DocumentReference dont le contenu (content.attachment) pointe vers une ressource Bundle de type document (application/fhir+json). Illustre qu'un DocumentReference peut exposer un document FHIR natif."

* contained[0] = patient-source-annexe-fhir
* contained[+] = practitionerrole-author-annexe-fhir
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.250.1.213.1.4.8.99999.202"
* status = #current
* type = $loinc#60591-5 "Patient summary Document"
* category = $TRE-A03#11 "Synthèse"
* subject.reference = "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
* date = "2024-11-20T11:00:00+01:00"
* author = Reference(practitionerrole-author-annexe-fhir)
* authenticator = Reference(practitionerrole-author-annexe-fhir)
* securityLabel = $v3-Confidentiality#N "normal"
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #fr-FR
* content.attachment.url = "Bundle/example-annexe-fhir-document"
* content.attachment.size = 4096
* content.attachment.hash = "C/jOTtuBZ37DlUN0mNPjfsu1nHf="
* content.attachment.title = "Synthèse patient 20/11/2024"
* content.attachment.creation = "2024-11-20T11:00:00+01:00"
* content.format = $formatcode#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.period.start = "2024-11-20T09:00:00+01:00"
* context.sourcePatientInfo = Reference(patient-source-annexe-fhir)
* context.facilityType = $SCT#35971002 "Ambulatory care site"
* context.practiceSetting = $SCT#394802001 "General medicine"
