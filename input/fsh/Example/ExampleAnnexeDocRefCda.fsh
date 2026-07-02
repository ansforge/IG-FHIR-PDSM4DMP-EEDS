Alias: $loinc = http://loinc.org
Alias: $v3-Confidentiality = http://terminology.hl7.org/CodeSystem/v3-Confidentiality
Alias: $formatcode = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode
Alias: $TRE-A03 = https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument
Alias: $SCT = http://snomed.info/sct

Instance: patient-source-annexe-cda
InstanceOf: Patient
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier.value = "123456789012345"

Instance: practitionerrole-author-annexe-cda
InstanceOf: as-practitionerrole
Usage: #inline
* identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier.value = "899700218896"

Instance: example-annexe-binary-cda
InstanceOf: Binary
Usage: #example
Title: "Exemple Annexe - Contenu CDA (Binary)"
Description: "Contenu brut (encodé en base64) d'un document CDA référencé par le DocumentReference example-annexe-docref-cda."
* contentType = #application/xml
* data = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48Q2xpbmljYWxEb2N1bWVudCB4bWxucz0idXJuOmhsNy1vcmc6djMiLz4="

Instance: example-annexe-docref-cda
InstanceOf: pdsm-comprehensive-document-reference
Usage: #example
Title: "Exemple Annexe - DocumentReference pointant vers un document CDA (Binary)"
Description: "DocumentReference dont le contenu (content.attachment) pointe vers une ressource Binary contenant un document au format CDA (application/xml). Illustre qu'un DocumentReference peut exposer un document non-FHIR."

* contained[0] = patient-source-annexe-cda
* contained[+] = practitionerrole-author-annexe-cda
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.250.1.213.1.4.8.99999.201"
* status = #current
* type = $loinc#11488-4 "Consult note"
* category = $TRE-A03#11 "Compte rendu"
* subject.reference = "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
* date = "2024-11-20T10:30:00+01:00"
* author = Reference(practitionerrole-author-annexe-cda)
* authenticator = Reference(practitionerrole-author-annexe-cda)
* securityLabel = $v3-Confidentiality#N "normal"
* content.attachment.contentType = #application/xml
* content.attachment.language = #fr-FR
* content.attachment.url = "Binary/example-annexe-binary-cda"
* content.attachment.size = 128
* content.attachment.hash = "A/hMRrv6Y15BjSM8kMLidrz+mHc="
* content.attachment.title = "Compte rendu de consultation (CDA)"
* content.attachment.creation = "2024-11-20T10:30:00+01:00"
* content.format = $formatcode#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.period.start = "2024-11-20T09:00:00+01:00"
* context.period.end = "2024-11-20T10:00:00+01:00"
* context.sourcePatientInfo = Reference(patient-source-annexe-cda)
* context.facilityType = $SCT#35971002 "Ambulatory care site"
* context.practiceSetting = $SCT#394802001 "General medicine"
