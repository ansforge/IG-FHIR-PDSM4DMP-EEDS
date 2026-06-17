Alias: $loinc = http://loinc.org
Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $formatcode = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode
Alias: $TRE-A03 = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument
Alias: $SCT = http://snomed.info/sct

Instance: patient-source-td31a-cr
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier.value = "123456789012345"

Instance: practitioner-author-td31a-cr
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier.value = "899700218896"

Instance: example-td3-1a-cr-consultation
InstanceOf: pdsm-comprehensive-document-reference
Usage: #example
Title: "Exemple TD3.1a - Compte rendu de consultation"
Description: "DocumentReference retourné par la transaction ITI-67 (TD3.1a) pour un compte rendu de consultation"

* contained[0] = patient-source-td31a-cr
* contained[+] = practitioner-author-td31a-cr
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.250.1.213.1.4.8.99999.101"
* status = #current
* type = $loinc#11488-4 "Consult note"
* category = $TRE-A03#11 "Compte rendu"
* subject = Reference(Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345)
* date = "2024-11-20T10:30:00+01:00"
* author = Reference(practitioner-author-td31a-cr)
* authenticator = Reference(practitioner-author-td31a-cr)
* securityLabel = $v3-Confidentiality#N "normal"
* content.attachment.contentType = #application/pdf
* content.attachment.language = #fr-FR
* content.attachment.url = "urn:oid:1.2.250.1.213.1.4.8.99999.101"
* content.attachment.size = 45678
* content.attachment.hash = "A/hMRrv6Y15BjSM8kMLidrz+mHc="
* content.attachment.title = "CR Consultation 20/11/2024"
* content.attachment.creation = "2024-11-20T10:30:00+01:00"
* content.format = $formatcode#urn:ihe:iti:xds-sd:pdf:2008 "PDF Non-Structured"
* context.period.start = "2024-11-20T09:00:00+01:00"
* context.period.end = "2024-11-20T10:00:00+01:00"
* context.sourcePatientInfo = Reference(patient-source-td31a-cr)
* context.facilityType = $SCT#35971002 "Ambulatory care site"
* context.practiceSetting = $SCT#394802001 "General medicine"
