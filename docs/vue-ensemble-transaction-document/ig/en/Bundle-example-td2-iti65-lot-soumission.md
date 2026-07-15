# example-td2-iti65-lot-soumission - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Example Bundle: example-td2-iti65-lot-soumission



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "example-td2-iti65-lot-soumission",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"]
  },
  "type" : "transaction",
  "entry" : [{
    "fullUrl" : "urn:uuid:aaaaaaaa-0000-0000-0000-000000000001",
    "resource" : {
      "resourceType" : "List",
      "id" : "submissionset-td2",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"fr\" lang=\"fr\"><hr/><p><b>French</b></p><hr/><a name=\"List_submissionset-td2\"> </a><p class=\"res-header-id\"><b>Narratif généré : Liste submissionset-td2</b></p><a name=\"submissionset-td2\"> </a><a name=\"hcsubmissionset-td2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-submissionset-comprehensive.html\">PDSm SubmissionSet Comprehensive</a></p></div><table class=\"clstu\"><tr><td>Date : 2026-06-12 10:00:00+0200 </td><td>Mode : Working List </td><td>Statut : Current </td><td>Code : SubmissionSet as a FHIR List </td></tr><tr><td>Sujet : <code>Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345</code>Source </td></tr></table><table class=\"grid\"><tr style=\"backgound-color: #eeeeee\"><td><b>Éléments</b></td></tr><tr><td><a href=\"Bundle-example-td2-iti65-lot-soumission.html#urn-uuid-aaaaaaaa-0000-0000-0000-000000000002\">DocumentReference : masterIdentifier = OID:1.2.250.1.213.1.4.8.99999.2; status = current; type = Consult note; category = Synthèse; date = 2026-06-12 10:00:00+0200; securityLabel = normal</a></td></tr></table><hr/><p><b>Ressources contenues</b></p><hr/><a name=\"submissionset-td2/patient-source\"> </a><p class=\"res-header-id\"><b>Patient #patient-source</b></p><a name=\"hcsubmissionset-td2/patient-source\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)</p><hr/><hr/><a name=\"submissionset-td2/practitioner-author\"> </a><p class=\"res-header-id\"><b>Praticien #practitioner-author</b></p><a name=\"hcsubmissionset-td2/practitioner-author\"> </a><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.1</code>/899700218896</p></div></div>"
      },
      "contained" : [{
        "resourceType" : "Patient",
        "id" : "patient-source",
        "identifier" : [{
          "system" : "urn:oid:1.2.250.1.213.1.4.8",
          "value" : "123456789012345"
        }]
      },
      {
        "resourceType" : "Practitioner",
        "id" : "practitioner-author",
        "identifier" : [{
          "system" : "urn:oid:1.2.250.1.71.4.2.1",
          "value" : "899700218896"
        }]
      }],
      "extension" : [{
        "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-designationType",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
            "code" : "11",
            "display" : "Synthèse"
          }]
        }
      },
      {
        "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-sourceId",
        "valueIdentifier" : {
          "system" : "urn:ietf:rfc:3986",
          "value" : "urn:oid:1.2.3.4.5.6.7.8"
        }
      },
      {
        "url" : "https://profiles.ihe.net/ITI/MHD/StructureDefinition/ihe-sourcePatientId",
        "valueReference" : {
          "reference" : "#patient-source"
        }
      }],
      "status" : "current",
      "mode" : "working",
      "code" : {
        "coding" : [{
          "system" : "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes",
          "code" : "submissionset"
        }]
      },
      "subject" : {
        "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
      },
      "date" : "2026-06-12T10:00:00+02:00",
      "source" : {
        "reference" : "#practitioner-author"
      },
      "entry" : [{
        "item" : {
          "reference" : "urn:uuid:aaaaaaaa-0000-0000-0000-000000000002"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "List"
    }
  },
  {
    "fullUrl" : "urn:uuid:aaaaaaaa-0000-0000-0000-000000000002",
    "resource" : {
      "resourceType" : "DocumentReference",
      "id" : "docref-td2",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"fr\" lang=\"fr\"><hr/><p><b>French</b></p><hr/><a name=\"DocumentReference_docref-td2\"> </a><p class=\"res-header-id\"><b>Narratif généré : RéférenceDocument docref-td2</b></p><a name=\"docref-td2\"> </a><a name=\"hcdocref-td2\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-comprehensive-document-reference.html\">PDSm Comprehensive DocumentReference</a></p></div><p><b>masterIdentifier</b>: <a href=\"http://terminology.hl7.org/5.5.0/NamingSystem-uri.html\" title=\"As defined by RFC 3986 (http://www.ietf.org/rfc/rfc3986.txt)(with many schemes defined in many RFCs). For OIDs and UUIDs, use the URN form (urn:oid:(note: lowercase) and urn:uuid:). See http://www.ietf.org/rfc/rfc3001.txt and http://www.ietf.org/rfc/rfc4122.txt \r\n\r\nThis oid is used as an identifier II.root to indicate the the extension is an absolute URI (technically, an IRI). Typically, this is used for OIDs and GUIDs. Note that when this OID is used with OIDs and GUIDs, the II.extension should start with urn:oid or urn:uuid: \r\n\r\nNote that this OID is created to aid with interconversion between CDA and FHIR - FHIR uses urn:ietf:rfc:3986 as equivalent to this OID. URIs as identifiers appear more commonly in FHIR.\r\n\r\nThis OID may also be used in CD.codeSystem.\">Uniform Resource Identifier (URI)</a>/urn:oid:1.2.250.1.213.1.4.8.99999.2</p><p><b>status</b>: Current</p><p><b>type</b>: <span title=\"Codes :{http://loinc.org 11488-4}\">Consult note</span></p><p><b>category</b>: <span title=\"Codes :{https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument 11}\">Synthèse</span></p><p><b>subject</b>: <code>Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345</code></p><p><b>date</b>: 2026-06-12 10:00:00+0200</p><p><b>author</b>: <a href=\"#hcdocref-td2/practitioner-author\">Practitioner : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896</a></p><p><b>authenticator</b>: <a href=\"#hcdocref-td2/practitioner-author\">Practitioner : identifier = urn:oid:1.2.250.1.71.4.2.1#899700218896</a></p><p><b>securityLabel</b>: <span title=\"Codes :{http://terminology.hl7.org/CodeSystem/v3-Confidentiality N}\">normal</span></p><blockquote><p><b>content</b></p><h3>Attachments</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>ContentType</b></td><td><b>Language</b></td><td><b>Url</b></td><td><b>Size</b></td><td><b>Hash</b></td><td><b>Title</b></td><td><b>Creation</b></td></tr><tr><td style=\"display: none\">*</td><td>application/xml</td><td>Français (France)</td><td><a href=\"Bundle-example-td2-iti65-lot-soumission.html#urn-uuid-aaaaaaaa-0000-0000-0000-000000000003\">Binary: application/xml (108 bytes base64)</a></td><td>80</td><td><code>A/hMRrv6Y15BjSM8kMLidrz+mHc=</code></td><td>Compte rendu de consultation</td><td>2026-06-12 10:00:00+0200</td></tr></table><p><b>format</b>: <a href=\"https://profiles.ihe.net/fhir/ihe.formatcode.fhir/1.1.0/CodeSystem-formatcode.html#formatcode-urn.58ihe.58iti.58xds.582017.58mimeTypeSufficient\">IHE Format Code set for use with Document Sharing: urn:ihe:iti:xds:2017:mimeTypeSufficient</a> (mimeType Sufficient)</p></blockquote><h3>Contexts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Period</b></td><td><b>FacilityType</b></td><td><b>PracticeSetting</b></td><td><b>SourcePatientInfo</b></td></tr><tr><td style=\"display: none\">*</td><td>2026-06-12 10:00:00+0200 --&gt; (en cours)</td><td><span title=\"Codes :{http://snomed.info/sct 22232009}\">Hospital</span></td><td><span title=\"Codes :{http://snomed.info/sct 394802001}\">General medicine</span></td><td><a href=\"#hcdocref-td2/patient-source\">Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)</a></td></tr></table><hr/><blockquote><p class=\"res-header-id\"><b>Narratif généré : Patient #patient-source</b></p><a name=\"docref-td2/patient-source\"> </a><a name=\"hcdocref-td2/patient-source\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Patient Anonyme (sexe non précisé), Date de Naissance inconnue ( urn:oid:1.2.250.1.213.1.4.8#123456789012345)</p><hr/></blockquote><hr/><blockquote><p class=\"res-header-id\"><b>Narratif généré : Praticien #practitioner-author</b></p><a name=\"docref-td2/practitioner-author\"> </a><a name=\"hcdocref-td2/practitioner-author\"> </a><p><b>identifier</b>: <code>urn:oid:1.2.250.1.71.4.2.1</code>/899700218896</p></blockquote></div></div>"
      },
      "contained" : [{
        "resourceType" : "Patient",
        "id" : "patient-source",
        "identifier" : [{
          "system" : "urn:oid:1.2.250.1.213.1.4.8",
          "value" : "123456789012345"
        }]
      },
      {
        "resourceType" : "Practitioner",
        "id" : "practitioner-author",
        "identifier" : [{
          "system" : "urn:oid:1.2.250.1.71.4.2.1",
          "value" : "899700218896"
        }]
      }],
      "masterIdentifier" : {
        "system" : "urn:ietf:rfc:3986",
        "value" : "urn:oid:1.2.250.1.213.1.4.8.99999.2"
      },
      "status" : "current",
      "type" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "11488-4",
          "display" : "Consult note"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "https://mos.esante.gouv.fr/NOS/TRE_A03-ClasseDocument/FHIR/TRE-A03-ClasseDocument",
          "code" : "11",
          "display" : "Synthèse"
        }]
      }],
      "subject" : {
        "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
      },
      "date" : "2026-06-12T10:00:00+02:00",
      "author" : [{
        "reference" : "#practitioner-author"
      }],
      "authenticator" : {
        "reference" : "#practitioner-author"
      },
      "securityLabel" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
          "code" : "N",
          "display" : "normal"
        }]
      }],
      "content" : [{
        "attachment" : {
          "contentType" : "application/xml",
          "language" : "fr-FR",
          "url" : "urn:uuid:aaaaaaaa-0000-0000-0000-000000000003",
          "size" : 80,
          "hash" : "A/hMRrv6Y15BjSM8kMLidrz+mHc=",
          "title" : "Compte rendu de consultation",
          "creation" : "2026-06-12T10:00:00+02:00"
        },
        "format" : {
          "system" : "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode",
          "code" : "urn:ihe:iti:xds:2017:mimeTypeSufficient",
          "display" : "mimeType Sufficient"
        }
      }],
      "context" : {
        "period" : {
          "start" : "2026-06-12T10:00:00+02:00"
        },
        "facilityType" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "22232009",
            "display" : "Hospital"
          }]
        },
        "practiceSetting" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "394802001",
            "display" : "General medicine"
          }]
        },
        "sourcePatientInfo" : {
          "reference" : "#patient-source"
        }
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "DocumentReference"
    }
  },
  {
    "fullUrl" : "urn:uuid:aaaaaaaa-0000-0000-0000-000000000003",
    "resource" : {
      "resourceType" : "Binary",
      "id" : "binary-cda-td2",
      "contentType" : "application/xml",
      "data" : "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48Q2xpbmljYWxEb2N1bWVudCB4bWxucz0idXJuOmhsNy1vcmc6djMiLz4="
    },
    "request" : {
      "method" : "POST",
      "url" : "Binary"
    }
  }]
}

```
