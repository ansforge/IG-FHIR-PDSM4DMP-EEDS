# Exemples d'usages DMP - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Exemples d'usages DMP

 
There is no translation page available for the current page, so it has been rendered in the default language 

**Version :**V0.3  | 
**Date :**26/05/2026

### Objet

Dans le cadre de l'optimisation des transactions de consultation DMP, l'objectif de ce document est de décrire un guide pour les implémenteurs.

### Définitions

#### DMP

##### Transactions utilisées

Les transactions utilisées dans ce flux sont des requêtes **IHE ITI-18 Stored Query** (TD3.1) et **IHE ITI-43 Retrieve Document Set** (TD3.2).

| | | |
| :--- | :--- | :--- |
| `FindDocuments` | TD3.1 — Stored Query | Recherche de documents par critères (statut, date d'acte, type). Retourne les métadonnées XDS. |
| `FindSubmissionSets` | TD3.1 — Stored Query | Recherche des lots de soumission depuis une date donnée (`$XDSSubmissionSetSubmissionTimeFrom`). |
| `GetAssociations` | TD3.1 — Stored Query | Retourne toutes les associations liées aux objets XDS passés en paramètre (par`entryUUID`). |
| `GetDocumentsAndAssociations` | TD3.1 — Stored Query | Retourne les documents et leurs associations (RPLC, HasMember) à partir d'une liste d'`entryUUID`. Appelé par batch de 20. |
| `RetrieveDocumentSet` | TD3.2 — Retrieve | Télécharge le contenu binaire des documents à partir d'une liste d'`uniqueId`. |

**Paramètres utilisés**

| | | |
| :--- | :--- | :--- |
| `availabilityStatus:urn:oasis:names:tc:ebxml-regrep:StatusType:Approved` | `FindDocuments` | Filtre sur les documents courants uniquement |
| `XDSDocumentEntryServiceStartTimeFrom` | `FindDocuments` | Date de début de l'acte médical (filtrage sur 2 ans) (UTC) |
| `$XDSDocumentEntryTypeCode (optionnel, multiple) ` | `FindDocuments` | Liste des typeCode à filtrer (optionnel) |
| `$XDSSubmissionSetSubmissionTimeFrom` | `FindSubmissionSets` | Filtre sur la date (UTC) d'ajout dans le DMP à partir de laquelle on souhaite récupérer les nouveaux documents : renseigné avec la date de la dernière connexion du professionnel au DMP |
| `entryUUID` | `GetAssociations`,`GetDocumentsAndAssociations` | Identifiant technique affecté par le SI DMP |

##### Identifiants des documents utilisés

| | |
| :--- | :--- |
| `uniqueId` | Identifiant logique globalement unique, généré par le logiciel. Présent dans le CDA et les métadonnées XDS. |
| `entryUUID` | Identifiant technique affecté par le SI DMP à une version de métadonnées d'un document. Change à chaque nouvelle version du document (remplacement) et à chaque modification de métadonnées (masquage/démasquage aux PS, remise en visibilité patient ou RL). |
| `logicalId`(lid) | Identifiant technique affecté par le SI DMP à un document (identique pour toutes ses versions de métadonnées). Change à chaque nouvelle version du document (remplacement) mais reste identique à chaque modification de métadonnées. |

#### Variables logiciel

| | | |
| :--- | :--- | :--- |
| `dateAppelDMP` | DateTime (UTC) | Date et heure de la dernière connexion au DMP pour ce patient. Initialisée à la première venue, mise à jour à chaque venue suivante. |
| `typeDMP` | Liste de codes | Liste des`typeCode`de documents DMP. Préférence de l'utilisateur. |
| `localDocumentsDMP` | Map | Index local des documents déjà stockés dans le LPS. Contient pour chaque document son dernier`entryUUID`, son`logicalId`et son`uniqueId`. |

-------

### Description du processus

Le processus se divise en deux branches selon qu'il s'agit de la première ouverture du dossier patient dans le logiciel ou des accès suivants.

#### Première ouverture

L'objectif est de détecter les documents présents dans le DMP qui ne sont pas encore connus du système.

##### Phase 1 — Recherche des documents

Le LPS enregistre la date et heure courante dans `dateAppelDMP`. Cette date servira de référence lors des accès suivants.

Une requête **FindDocuments** est envoyée au DMP pour récupérer les documents courants de moins de 2 ans.

**Notes :**
1. La première recherche documentaire automatique dans un DMP doit obligatoirement se faire sur une période maximale de 2 ans.
1. Uniquement sur un statut "courant" (`urn:oasis:names:tc:ebxml-regrep:StatusType:Approved`) .
1. Dans le cas où le PS a des préférences de type de document renseigné (typeDMP) : sur une liste de type de documents particuliers. Le LPS doit indiquer que la recherche est filtrée sur ces types de document uniquement. Le PS doit pouvoir étendre sa recherche à d'autres types de document ou désactiver ce filtre s'il ne trouve pas les document recherchés.
1. Point d'attention sur le document particulier « Historique de vaccination » qui peut dans la majorité des cas avoir une date de début d'acte (plus ancienne vaccination) inférieure à 2 ans (vaccination COVID notament). Un LPS doit pouvoir proposer au PS une recherche spécifique et manuelle sur ce typeCode sans limitation de date (si le document pas présent dans la première recherche automatique).

##### Phase 2 — Traitement (interne logiciel)

**Note :**Le même document CDA peut être transmis via MSS et déposé sur le DMP. Le
`uniqueId`étant identique dans les deux cas, le LPS doit systématiquement vérifier qu'un document n'est pas déjà présent en local avant tout import.

Pour chaque document retourné, le système vérifie que son `uniqueId` n'est pas déjà présent dans les documents en local.

Les documents dont le `uniqueId` correspond à des documents déjà presents en local (documents reçus par MSS, ...) sont ajoutés à `localDocumentsDMP` (`entryUUID`, `logicalId`, `uniqueId`).

##### Phase 3 — Notification et récupération optionnelle

Le PS est notifié du nombre de documents tiers détectés.

Le PS peut visualiser un ou plusieurs documents via RetrieveDocumentSet.

Si le PS souhaite importer des documents DMP en local, le LPS appelle `RetrieveDocumentSet` et stocke les documents en local avec leurs identifiants (`entryUUID`, `uniqueId`, `logicalId`) dans `localDocumentsDMP`.

##### Logigramme — Première ouverture

%%{init: { 'theme': 'base', 'themeVariables': { 'fontSize': '11px', 'actorBkg': '#d0e8f8', 'actorTextColor': '#0d2b45', 'actorBorderColor': '#2271b1', 'noteBkgColor': '#fff8dc', 'noteTextColor': '#333', 'labelBoxBkgColor': '#e8f4fd', 'sequenceNumberColor': '#2271b1', 'labelBoxBorderColor': '#999999', 'altSectionBkgColor': '#f5f5f5', 'loopTextColor': '#333' } } }%% sequenceDiagram title Première ouverture actor PS participant LPS participant DMP PS->>LPS: Accès au dossier patient rect rgb(180, 215, 245) note over LPS,DMP: Phase 1 — Recherche des documents LPS->>LPS: Stockage variable[dateAppelDMP] = date/heure courante (UTC) LPS->>DMP: FindDocuments (document courant, date Acte - 2 ans,[typeCode]) DMP-->>LPS: note over LPS,DMP: Phase 2 — Traitement (interne logiciel) loop Pour chaque document retourné LPS->>LPS: Si Document déja présent (test sur le uniqueId) alors ajout à localDocumentsDMP end note over LPS,DMP: Phase 3 — Notification et récupération optionnelle LPS->>PS: Notification des documents tiers détectés opt Import local des documents note over LPS : Demande de visualisation de un plusieurs PS->>LPS: Selection des documents à visualiser LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId]) DMP-->>LPS: LPS->>PS: Affichage des documents note over LPS : Selection des documents à importer PS->>LPS: Selection des documents à importer LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId]) DMP-->>LPS: LPS->>LPS: Import des documents et stockage de localDocumentsDMP[entryUUID,logicalID,uniqueId] end end

##### Traduction FHIR native et optimisation du nombre de transactions

Les phases précédentes décrivent le cas d'usage « Première ouverture » avec le vocabulaire XDS (transactions IHE ITI-18/ITI-43) utilisé historiquement par le DMP. Cette section propose la traduction complète du même cas d'usage avec les transactions FHIR du profil PDSm ([TD3.1a](transaction_td3.1a.md) — ITI-67, [TD3.2](transaction_td3.2.md) — ITI-68), et évalue si elle permet de réduire le nombre d'échanges réseau nécessaires.

###### Rappel — flux XDS (référence)

Quel que soit le nombre de documents détectés, le flux XDS décrit ci-dessus ne nécessite que **2 transactions réseau** au maximum :

1. `FindDocuments`— une seule requête, retourne les métadonnées de tous les documents correspondant aux critères ;
1. `RetrieveDocumentSet`— une seule requête, capable de retourner plusieurs documents en une fois (liste d'`uniqueId`en paramètre).

###### Traduction directe en FHIR

La Phase 1 (recherche) se traduit directement par une requête **ITI-67 Find Document References** :

```
GET [base]/DocumentReference?patient.identifier=[système-INS]|[valeur-INS]&status=current&period=ge[dateActe-2ans]&type=[typeCode1],[typeCode2] HTTP/1.1
Accept: application/fhir+json

```

La réponse est un `Bundle` de type `searchset` contenant l'ensemble des `DocumentReference` correspondants — **en une seule transaction**, comme `FindDocuments`.

La Phase 3 (récupération) se traduit par une requête **ITI-68 Retrieve Document** pour chaque document sélectionné (`GET [DocumentReference.content.attachment.url]`). Le profil PDSm, tel que documenté aujourd'hui, ne définit qu'une récupération unitaire — **une requête par document**.

**Constat :**une traduction terme à terme aboutit à
`1 + N`transactions (1 recherche + N récupérations), contre 2 en XDS. Pour N documents sélectionnés, le flux FHIR naïf devient moins optimal que le flux XDS dès que N > 1.

###### Exemple FHIR complet du cas d'usage

Reprenons le patient et les deux documents des exemples [TD3.1a](transaction_td3.1a.md) / [TD3.2](transaction_td3.2.md) — INS `1.2.250.1.213.1.4.8|123456789012345`, aucun des deux documents n'étant encore connu du LPS. Le PS a configuré une préférence `typeDMP` = [Compte rendu de consultation (LOINC `11488-4`), Prescription médicale (LOINC `57833-6`)]. Le LPS ouvre le dossier le `2026-07-02` ; la borne des 2 ans est donc `2024-07-02`.

**Phase 1 — recherche (ITI-67) :**

```
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345&status=current&period=ge2024-07-02&type=http://loinc.org|11488-4,http://loinc.org|57833-6 HTTP/1.1
Accept: application/fhir+json

```

Réponse — `200 OK`, `Bundle` de type `searchset`, 2 entrées :

```
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 2,
  "entry": [
    {
      "fullUrl": "[base]/DocumentReference/cr-consultation-td31a",
      "resource": {
        "resourceType": "DocumentReference",
        "id": "cr-consultation-td31a",
        "masterIdentifier": { "system": "urn:ietf:rfc:3986", "value": "urn:oid:1.2.250.1.213.1.4.8.99999.101" },
        "status": "current",
        "type": { "coding": [{ "system": "http://loinc.org", "code": "11488-4", "display": "Consult note" }] },
        "date": "2024-11-20T10:30:00+01:00",
        "content": [{ "attachment": { "contentType": "application/pdf", "url": "https://dmp.esante.gouv.fr/fhir/Binary/cr-consultation-td31a" } }]
      }
    },
    {
      "fullUrl": "[base]/DocumentReference/ordonnance-td31a",
      "resource": {
        "resourceType": "DocumentReference",
        "id": "ordonnance-td31a",
        "masterIdentifier": { "system": "urn:ietf:rfc:3986", "value": "urn:oid:1.2.250.1.213.1.4.8.99999.102" },
        "status": "current",
        "type": { "coding": [{ "system": "http://loinc.org", "code": "57833-6", "display": "Prescription for medication" }] },
        "date": "2024-11-20T10:35:00+01:00",
        "content": [{ "attachment": { "contentType": "application/pdf", "url": "Binary/ordonnance-td31a" } }]
      }
    }
  ]
}

```

Fiches complètes : [compte rendu de consultation](DocumentReference-example-td3-1a-cr-consultation.md), [ordonnance médicale](DocumentReference-example-td3-1a-ordonnance.md).

**Phase 2 — traitement interne (pas d'appel réseau) :** le LPS compare les `masterIdentifier` reçus (`...99999.101` et `...99999.102`) à `localDocumentsDMP`. Aucun des deux n'y figure : ce sont deux documents tiers détectés.

**Phase 3 — notification puis récupération groupée (ITI-68 via Bundle `batch`, cf. Optimisation 1 ci-dessous) :** le PS visualise puis importe les deux documents en un seul appel :

```
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json

```

```
{
  "resourceType": "Bundle",
  "type": "batch",
  "entry": [
    { "request": { "method": "GET", "url": "https://dmp.esante.gouv.fr/fhir/Binary/cr-consultation-td31a" } },
    { "request": { "method": "GET", "url": "Binary/ordonnance-td31a" } }
  ]
}

```

Le LPS stocke ensuite les deux documents en local avec leurs identifiants (`id` DMP, `masterIdentifier`) dans `localDocumentsDMP`.

**Bilan :**pour ce cas concret à 2 documents, le flux FHIR optimisé (recherche + batch) totalise
**2 transactions réseau**— identique au flux XDS (
`FindDocuments`+
`RetrieveDocumentSet`).

###### Optimisation 1 — Bundle batch pour grouper les récupérations

La spécification FHIR définit nativement l'interaction **batch** (cf. [FHIR RESTful API — Batch/Transaction](https://www.hl7.org/fhir/http.html#transaction)) : plusieurs requêtes indépendantes peuvent être regroupées dans un unique `Bundle` envoyé en une seule requête HTTP `POST [base]`. Le LPS peut ainsi remplacer les N appels `GET Binary/{id}` par un unique appel batch.

**Requête :**

```
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json

```

```
{
  "resourceType": "Bundle",
  "type": "batch",
  "entry": [
    { "request": { "method": "GET", "url": "https://dmp.esante.gouv.fr/fhir/Binary/cr-consultation-td31a" } },
    { "request": { "method": "GET", "url": "Binary/ordonnance-td31a" } }
  ]
}

```

**Réponse** — un `Bundle` de type `batch-response`, une entrée par requête, dans le même ordre :

```
{
  "resourceType": "Bundle",
  "type": "batch-response",
  "entry": [
    {
      "response": { "status": "200 OK" },
      "resource": { "resourceType": "Binary", "contentType": "application/pdf", "data": "JVBERi0xLjQK..." }
    },
    {
      "response": { "status": "200 OK" },
      "resource": { "resourceType": "Binary", "contentType": "application/pdf", "data": "JVBERi0xLjQK..." }
    }
  ]
}

```

Avec cette approche, le flux « Première ouverture » revient à **2 transactions** (1 recherche ITI-67 + 1 batch de récupération), quel que soit le nombre de documents importés — **équivalent au flux XDS**.

**Prérequis :**le serveur DMP doit déclarer le support de l'interaction
`batch`dans son
`CapabilityStatement`(
`rest.interaction.code = batch`). Ce point n'est pas actuellement documenté dans les transactions TD3.x de cet IG et doit être vérifié / imposé dans les exigences techniques du profil DMP.

###### Optimisation 2 — contenu embarqué dans DocumentReference (attachment.data)

Le type `Attachment` utilisé par `DocumentReference.content.attachment` permet de porter le contenu du document de deux façons alternatives : par référence (`attachment.url`, seule option utilisée aujourd'hui dans TD3.1a/TD3.2) ou **en valeur, encodé en base64** (`attachment.data`). Si le système DMP choisissait de peupler `attachment.data` pour les documents de taille raisonnable, la réponse à la recherche ITI-67 (Phase 1) contiendrait déjà le contenu binaire des documents, sans étape de récupération séparée.

Dans ce scénario, le cas d'usage « Première ouverture » — recherche **et** récupération des documents détectés — se résoudrait en **une seule transaction FHIR**, contre 2 au minimum en XDS.

**Question ouverte** — Cette optimisation suppose une évolution du profil PDSm et/ou une politique du système DMP (seuil de taille en-deçà duquel `attachment.data` est peuplé à la place ou en complément de `attachment.url`), qui n'est pas définie à ce jour. Elle présente aussi un compromis : elle alourdit systématiquement la réponse de recherche, même si le PS ne consulte finalement aucun document — ce qui peut être défavorable puisque la récupération reste par nature **optionnelle** (cf. Phase 3). Ce point est à trancher avec l'équipe DMP si l'optimisation du nombre de transactions est jugée prioritaire.

###### Synthèse comparative

| | | |
| :--- | :--- | :--- |
| XDS (référence actuelle) | 2 | `FindDocuments`(1) +`RetrieveDocumentSet`batché (1) |
| FHIR — traduction directe | 1 + N | ITI-67 (1) + N × ITI-68 (1 par document) |
| FHIR — avec Bundle`batch` | 2 | ITI-67 (1) + 1 Bundle`batch`regroupant les N récupérations |
| FHIR — avec`attachment.data`inline | 1 | ITI-67 seul (métadonnées + contenu) |

**Conclusion :** une traduction FHIR terme à terme des transactions XDS est moins efficace qu'XDS dès que plusieurs documents sont récupérés. Le recours à l'interaction FHIR standard `batch` permet de revenir au même nombre de transactions qu'en XDS sans évolution de profil. Une optimisation plus poussée (transmission du contenu dès la recherche) est possible mais suppose des choix de conception à valider avec le DMP.

-------

#### Accès suivants

L'objectif est de détecter uniquement les changements survenus depuis la dernière connexion :

* Nouveaux documents
* Remplacements de documents ou documents ayant changé de confidentialité

##### Phase 1 — Recherche des nouveaux lots

`dateAppelDMP` est mis à jour avec la date/heure courante (UTC).

Le système appelle `FindSubmissionSets` (`$XDSSubmissionSetSubmissionTimeFrom` = `dateAppelDMP`) pour récupérer tous les lots soumis depuis la dernière connexion.

Il appelle ensuite `GetAssociations` sur les `entryUUID` des lots retournés, puis filtre les associations de type **HasMember** pour extraire les `entryUUID` des documents concernés.

##### Phase 2 — Récupération des métadonnées

Les documents sont récupérés par lot de 20 via `GetDocumentsAndAssociations`, qui retourne les métadonnées et les associations (notamment `RPLC`). Les « résultats finaux » sont constitués de l'agrégat des résultats des différents lots éventuels. 

**Note :**Rendre paramétrable le nombre de documents pouvant être récupéré via la query
`GetDocumentsAndAssociations`(par défaut 20).

##### Phase 3 — Analyse des résultats finaux

Pour chaque document, ignorer ceux qui sont au statut **Deprecated** (il s'agit d'une version antérieure du document déjà remplacée par une plus récente également retournée dans les résultats, ou d'une ancienne version de métadonnée obsolète). Deux cas sont ensuite traités :

* **Cas A — Document remplacé** : une association **RPLC** existe et son `targetObject` correspond à un document déjà en local (`localDocumentsDMP[entryUUID]`). Le document local est marqué comme remplacé. Si aucun document "Non Deprecated" n'est trouvé directement dans la liste des nouveaux documents (cas où le nouveau document est également lui-même replacé), la chaine RPLC doit être remontée (via les associations RPLC et les sourceObject/targetObject) pour trouver la version la plus récente du document qui n'est pas Deprecated et qui se trouve dans la liste des nouveaux documents.
* **Cas B — Nouveau document ou mise à jour de métadonnées** : 
* Si le `logicalId` du document récupéré correspond à un document déjà en local (`localDocumentsDMP[logicalId]`), le document a subi une modification de métadonnées par un autre acteur (masquage/démasquage au PS, remise en visibilité patient ou représentant légal). Le système met à jour le code de confidentialité en local et en informe le PS. Il met à jour les références du document avec ses nouveaux identifiants (nouvel `entryUUID`, `uniqueId` inchangé, `logicalId` inchangé).
* Sinon, il s'agit d'un **nouveau document** : statut non `Deprecated ` (`Approved` ou `Archived`), sans association RPLC pointant vers un document local. Il est ajouté à `localDocumentsDMP`.
 

**Note :**Lors de l'analyse des résultats et avant tout import, le LPS doit vérifier que le document n'est pas déjà présent en local via son
`uniqueId`. Les documents dont le uniqueId correspond à des documents déjà presents en local (documents reçus par MSS, ...) sont ajoutés à localDocumentsDMP (entryUUID, logicalId, uniqueId).

##### Phase 4 — Mise à jour et notification

Le PS est notifié des documents nouveaux ou remplacés.

Il peut ensuite les consulter via `RetrieveDocumentSet`.

Si le PS souhaite importer des documents DMP en local, le LPS appelle `RetrieveDocumentSet` et stocke les documents en local avec leurs identifiants (`entryUUID`, `uniqueId`, `logicalId`) dans `localDocumentsDMP`.

##### Logigramme — Accès suivants

%%{init: { 'theme': 'base', 'themeVariables': { 'fontSize': '11px', 'actorBkg': '#d0e8f8', 'actorTextColor': '#0d2b45', 'actorBorderColor': '#2271b1', 'noteBkgColor': '#fff8dc', 'noteTextColor': '#333', 'labelBoxBkgColor': '#e8f4fd', 'sequenceNumberColor': '#2271b1', 'labelBoxBorderColor': '#999999', 'altSectionBkgColor': '#f5f5f5', 'loopTextColor': '#333' } } }%% sequenceDiagram title Accés suivants actor PS participant LPS participant DMP PS->>LPS: Accès au dossier patient rect rgb(185, 225, 195) note over LPS,DMP: Phase 1 — Recherche des nouveaux lots LPS->>LPS: Mise à jour variable[dateAppelDMP] = date/heure courante (UTC) LPS->>DMP: FindSubmissionSets ($XDSSubmissionSetSubmissionTimeFrom = variable[dateAppelDMP]) DMP-->>LPS: LPS->>DMP: GetAssociations (entryUUID des lots retournés) => Liste d'associations DMP-->>LPS: loop Filtre des associations LPS->>LPS: Filtre les associations de type HasMember pour extraire les entryUUID end note over LPS,DMP: Phase 2 — Récupération des métadonnées loop Par batch 20 LPS->>DMP: GetDocumentsAndAssociations (entryUUID des documents filtrés) DMP-->>LPS: LPS->>LPS : Agrégat des résultats finaux end note over LPS,DMP: Phase 3 — Analyse des résultats finaux loop Sur l'ensemble des résultats note right of LPS: Cas A — Gestion des documents remplacés note right of LPS: Cas B — Gestion des nouveaux documents ou mises à jour des métadonnées end note over LPS,DMP: Phase 4 — Mise à jour et notification LPS->>PS: Notification des documents nouveaux, remplacés ou avec changement de confidentialité opt Import local des documents note over LPS : Demande de visualisation de un plusieurs PS->>LPS: Selection des documents à visualiser LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId]) DMP-->>LPS: LPS->>PS: Affichage des documents note over LPS : Selection des documents à importer PS->>LPS: Selection des documents à importer LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId]) DMP-->>LPS: LPS->>LPS: Import des documents et stockage de localDocumentsDMP[entryUUID,logicalID,uniqueId] end end

