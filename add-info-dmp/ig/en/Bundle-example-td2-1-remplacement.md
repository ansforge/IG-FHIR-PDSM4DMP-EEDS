# example-td2-1-remplacement - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Example Bundle: example-td2-1-remplacement



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "example-td2-1-remplacement",
  "meta" : {
    "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-provide-document-bundle"]
  },
  "type" : "transaction",
  "entry" : [{
    "fullUrl" : "urn:uuid:bbbbbbbb-0000-0000-0000-000000000001",
    "resource" : {
      "resourceType" : "List",
      "id" : "submissionset-td2-1",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-submissionset-comprehensive"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"fr\" lang=\"fr\"><hr/><p><b>French</b></p><hr/><a name=\"List_submissionset-td2-1\"> </a><p class=\"res-header-id\"><b>Narratif généré : Liste submissionset-td2-1</b></p><a name=\"submissionset-td2-1\"> </a><a name=\"hcsubmissionset-td2-1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-submissionset-comprehensive.html\">PDSm SubmissionSet Comprehensive</a></p></div><table class=\"clstu\"><tr><td>Date : 2026-06-12 11:00:00+0200 </td><td>Mode : Working List </td><td>Statut : Current </td><td>Code : SubmissionSet as a FHIR List </td></tr><tr><td>Sujet : <code>Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345</code></td></tr></table><table class=\"grid\"><tr style=\"backgound-color: #eeeeee\"><td><b>Éléments</b></td></tr><tr><td><a href=\"Bundle-example-td2-1-remplacement.html#urn-uuid-bbbbbbbb-0000-0000-0000-000000000002\">DocumentReference : status = current; type = Compte rendu de consultation; date = 2026-06-12 11:00:00+0200</a></td></tr></table></div></div>"
      },
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
      "date" : "2026-06-12T11:00:00+02:00",
      "entry" : [{
        "item" : {
          "reference" : "urn:uuid:bbbbbbbb-0000-0000-0000-000000000002"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "List"
    }
  },
  {
    "fullUrl" : "urn:uuid:bbbbbbbb-0000-0000-0000-000000000002",
    "resource" : {
      "resourceType" : "DocumentReference",
      "id" : "docref-y-nouvelle-version",
      "meta" : {
        "profile" : ["https://interop.esante.gouv.fr/ig/fhir/pdsm/StructureDefinition/pdsm-comprehensive-document-reference"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"fr\" lang=\"fr\"><hr/><p><b>French</b></p><hr/><a name=\"DocumentReference_docref-y-nouvelle-version\"> </a><p class=\"res-header-id\"><b>Narratif généré : RéférenceDocument docref-y-nouvelle-version</b></p><a name=\"docref-y-nouvelle-version\"> </a><a name=\"hcdocref-y-nouvelle-version\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profil: <a href=\"https://interop.esante.gouv.fr/ig/fhir/pdsm/3.1.0/StructureDefinition-pdsm-comprehensive-document-reference.html\">PDSm Comprehensive DocumentReference</a></p></div><p><b>status</b>: Current</p><p><b>type</b>: <span title=\"Codes :{http://loinc.org 11488-4}\">Compte rendu de consultation</span></p><p><b>subject</b>: <code>Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345</code></p><p><b>date</b>: 2026-06-12 11:00:00+0200</p><h3>RelatesTos</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Code</b></td><td><b>Target</b></td></tr><tr><td style=\"display: none\">*</td><td>Replaces</td><td><a href=\"DocumentReference/doc-x-id\">DocumentReference/doc-x-id</a></td></tr></table><blockquote><p><b>content</b></p><h3>Attachments</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>ContentType</b></td><td><b>Url</b></td><td><b>Title</b></td></tr><tr><td style=\"display: none\">*</td><td>application/xml</td><td><a href=\"Bundle-example-td2-1-remplacement.html#urn-uuid-bbbbbbbb-0000-0000-0000-000000000003\">Binary: application/xml (168 bytes base64)</a></td><td>Compte rendu de consultation (v2)</td></tr></table></blockquote></div></div>"
      },
      "status" : "current",
      "type" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "11488-4",
          "display" : "Compte rendu de consultation"
        }]
      },
      "subject" : {
        "reference" : "Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345"
      },
      "date" : "2026-06-12T11:00:00+02:00",
      "relatesTo" : [{
        "code" : "replaces",
        "target" : {
          "reference" : "DocumentReference/doc-x-id"
        }
      }],
      "content" : [{
        "attachment" : {
          "contentType" : "application/xml",
          "url" : "urn:uuid:bbbbbbbb-0000-0000-0000-000000000003",
          "title" : "Compte rendu de consultation (v2)"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "DocumentReference"
    }
  },
  {
    "fullUrl" : "urn:uuid:bbbbbbbb-0000-0000-0000-000000000004",
    "resource" : {
      "resourceType" : "Parameters",
      "id" : "patch-doc-x-superseded",
      "parameter" : [{
        "name" : "operation",
        "part" : [{
          "name" : "type",
          "valueCode" : "replace"
        },
        {
          "name" : "path",
          "valueString" : "DocumentReference.status"
        },
        {
          "name" : "value",
          "valueCode" : "superseded"
        }]
      }]
    },
    "request" : {
      "method" : "PATCH",
      "url" : "DocumentReference/doc-x-id"
    }
  },
  {
    "fullUrl" : "urn:uuid:bbbbbbbb-0000-0000-0000-000000000003",
    "resource" : {
      "resourceType" : "Binary",
      "id" : "binary-cda-v2",
      "contentType" : "application/xml",
      "data" : "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPENsaW5pY2FsRG9jdW1lbnQgeG1sbnM9InVybjpobDctb3JnOmhpcHAiPgogIDwhLS0gZXhlbXBsZSBDREEgLS0+CjwvQ2xpbmljYWxEb2N1bWVudD4="
    },
    "request" : {
      "method" : "POST",
      "url" : "Binary"
    }
  }]
}

```
