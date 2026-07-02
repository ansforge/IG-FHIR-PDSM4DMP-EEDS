### Objectif

Cette annexe illustre la capacité d'un même point d'accès `DocumentReference` (par exemple la transaction **[ITI-67 Find Document References](transaction_td3.1a.html)**) à exposer indifféremment :

- un document au format **CDA** (contenu non-FHIR, référencé via une ressource `Binary`) ;
- un document au format **FHIR natif** (`Bundle` de type `document`).

Le format du document n'est pas porté par la transaction utilisée pour y accéder (cf. [TD3.1a](transaction_td3.1a.html), [TD3.2](transaction_td3.2.html)), mais uniquement par les métadonnées du `DocumentReference` correspondant :

- `content.attachment.contentType` : type MIME du contenu (`application/xml` pour un CDA, `application/fhir+json` pour un document FHIR) ;
- `content.attachment.url` : référence vers la ressource porteuse du contenu (`Binary` ou `Bundle`) ;
- `content.format` : ici `urn:ihe:iti:xds:2017:mimeTypeSufficient` dans les deux cas, le `contentType` suffisant à déterminer le format du document.

### Exemple 1 — DocumentReference pointant vers un document CDA (Binary)

Le `DocumentReference` [example-annexe-docref-cda](DocumentReference-example-annexe-docref-cda.html) référence, via `content.attachment.url`, la ressource [Binary/example-annexe-binary-cda](Binary-example-annexe-binary-cda.html) qui contient le document CDA encodé en base64 (`Binary.data`).

| Élément | Valeur |
|---------|--------|
| `content.attachment.contentType` | `application/xml` |
| `content.attachment.url` | `Binary/example-annexe-binary-cda` |
| `content.format` | `urn:ihe:iti:xds:2017:mimeTypeSufficient` |

### Exemple 2 — DocumentReference pointant vers un document FHIR (Bundle document)

Le `DocumentReference` [example-annexe-docref-fhir](DocumentReference-example-annexe-docref-fhir.html) référence, via `content.attachment.url`, la ressource [Bundle/example-annexe-fhir-document](Bundle-example-annexe-fhir-document.html), un `Bundle` de type `document` contenant une `Composition` et les ressources associées (`Patient`, `Practitioner`).

| Élément | Valeur |
|---------|--------|
| `content.attachment.contentType` | `application/fhir+json` |
| `content.attachment.url` | `Bundle/example-annexe-fhir-document` |
| `content.format` | `urn:ihe:iti:xds:2017:mimeTypeSufficient` |

### Exemple 3 — Bundle searchset exposant les deux formats

Le `Bundle` [example-annexe-searchset-documentreferences](Bundle-example-annexe-searchset-documentreferences.html), de type `searchset`, illustre la réponse que retournerait le système DMP à une recherche `DocumentReference` (TD3.1a) : les deux `DocumentReference` des exemples précédents y figurent côte à côte, chacun avec son propre format de contenu.

| `DocumentReference` | Format du document | `content.attachment.url` |
|---------------------|---------------------|---------------------------|
| [example-annexe-docref-cda](DocumentReference-example-annexe-docref-cda.html) | CDA (`application/xml`) | `Binary/example-annexe-binary-cda` |
| [example-annexe-docref-fhir](DocumentReference-example-annexe-docref-fhir.html) | FHIR (`application/fhir+json`) | `Bundle/example-annexe-fhir-document` |

Ce `Bundle` démontre qu'un même appel de recherche peut retourner, au sein d'un même jeu de résultats, des documents de formats hétérogènes — le LPS devant se baser sur `content.attachment.contentType` pour déterminer comment traiter chaque document.
