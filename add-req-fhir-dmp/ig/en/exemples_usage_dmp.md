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

##### Transposition FHIR native et optimisation du nombre de transactions

Les phases précédentes décrivent le cas d'usage « Première ouverture » avec le vocabulaire XDS (transactions IHE ITI-18/ITI-43) utilisé historiquement par le DMP. Cette section propose la transposition complète du même cas d'usage avec les transactions FHIR du profil PDSm ([TD3.1a](transaction_td3.1a.md) — ITI-67, [TD3.2](transaction_td3.2.md) — ITI-68), et évalue si elle permet de réduire le nombre d'échanges réseau nécessaires.

###### Rappel — flux XDS (référence)

Quel que soit le nombre de documents détectés, le flux XDS décrit ci-dessus ne nécessite que **2 transactions réseau** au maximum :

1. `FindDocuments`— une seule requête, retourne les métadonnées de tous les documents correspondant aux critères ;
1. `RetrieveDocumentSet`— une seule requête, capable de retourner plusieurs documents en une fois (liste d'`uniqueId`en paramètre).

###### Transposition directe en FHIR

La Phase 1 (recherche) se transpose directement en une requête **ITI-67 Find Document References** :

```
GET [base]/DocumentReference?patient.identifier=[système-INS]|[valeur-INS]&status=current&period=ge[dateActe-2ans]&type=[typeCode1],[typeCode2] HTTP/1.1
Accept: application/fhir+json

```

La réponse est un `Bundle` de type `searchset` contenant l'ensemble des `DocumentReference` correspondants — **en une seule transaction**, comme `FindDocuments`.

La Phase 3 (récupération) se transpose en une requête **ITI-68 Retrieve Document** pour chaque document sélectionné (`GET [DocumentReference.content.attachment.url]`). Telle que définie par IHE MHD, cette transaction ne couvre qu'une récupération unitaire — contrairement à `RetrieveDocumentSet` (ITI-43), elle n'inclut pas de mécanisme natif de regroupement de plusieurs documents en un seul appel.

**Constat :**une transposition terme à terme aboutit à
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

**Phase 3 — notification puis récupération groupée (ITI-68 via Bundle `batch`, cf. Optimisation ci-dessous) :** le PS visualise puis importe les deux documents en un seul appel :

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

###### Optimisation — Bundle batch pour grouper les récupérations

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

###### Synthèse comparative

| | | |
| :--- | :--- | :--- |
| XDS (référence actuelle) | 2 | `FindDocuments`(1) +`RetrieveDocumentSet`batché (1) |
| FHIR — transposition directe | 1 + N | ITI-67 (1) + N × ITI-68 (1 par document) |
| FHIR — avec Bundle`batch` | 2 | ITI-67 (1) + 1 Bundle`batch`regroupant les N récupérations |

**Conclusion :** une transposition FHIR terme à terme des transactions XDS est moins efficace qu'XDS dès que plusieurs documents sont récupérés. Le recours à l'interaction FHIR standard `batch` permet de revenir au même nombre de transactions qu'en XDS sans évolution de profil — c'est l'optimisation retenue pour ce cas d'usage.

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

##### Transposition FHIR et détection incrémentale des changements

Contrairement à la « Première ouverture », les transactions XDS utilisées ici (`FindSubmissionSets`, `GetAssociations`, `GetDocumentsAndAssociations`) n'ont pas d'équivalent FHIR terme à terme documenté dans cet IG : elles reposent sur le modèle XDS des lots de soumission et des associations `RPLC`/`HasMember`, propre à ITI-18. La transposition proposée ci-dessous ne traduit donc pas ces transactions une à une ; elle reformule l'objectif métier (« détecter ce qui a changé depuis `dateAppelDMP` ») avec les moyens natifs de FHIR, en s'appuyant sur deux éléments déjà définis ailleurs dans cet IG : le paramètre de recherche technique `_lastUpdated` (norme FHIR de base) et l'élément `DocumentReference.relatesTo` utilisé pour le remplacement (cf. [TD2.1](transaction_td2.1.md)).

###### Rappel — flux XDS (référence)

Pour M documents concernés depuis la dernière connexion, le flux XDS décrit ci-dessus nécessite au minimum :

1. `FindSubmissionSets`— 1 requête ;
1. `GetAssociations`— 1 requête (sur la liste des lots retournés) ;
1. `GetDocumentsAndAssociations`— autant de requêtes que de lots de 20 documents nécessaires, arrondi au lot supérieur ;
1. `RetrieveDocumentSet`— 0 à 2 requêtes supplémentaires si le PS visualise et/ou importe des documents.

Soit **2 transactions, plus une par lot de 20 documents (arrondi au lot supérieur), au minimum** (hors récupération), un nombre qui croît avec le volume de documents modifiés.

###### Proposition FHIR — recherche incrémentale par _lastUpdated

La ressource `DocumentReference` comporte nativement `meta.lastUpdated`, mise à jour par le serveur FHIR à chaque création ou modification (cf. [annexe dates XDS/FHIR](annexe_dates_xds_fhir.md)). Ce champ est mis à jour aussi bien pour un nouveau document, qu'un document remplacé (l'ancien passe à `superseded`, le nouveau est créé), ou qu'une simple modification de métadonnées (masquage, visibilité — cf. [TD3.3a](transaction_td3.3a.md)/[TD3.3b](transaction_td3.3b.md)). Une unique recherche suffit donc à couvrir ce que `FindSubmissionSets` + `GetAssociations` + `GetDocumentsAndAssociations` faisaient ensemble :

```
GET [base]/DocumentReference?patient.identifier=[système-INS]|[valeur-INS]&_lastUpdated=gt[dateAppelDMP] HTTP/1.1
Accept: application/fhir+json

```

La réponse est un `Bundle` `searchset` contenant toutes les `DocumentReference` créées ou modifiées depuis `dateAppelDMP` — **en une seule transaction**, quel que soit M.

**Question ouverte 1** — Le paramètre `_lastUpdated` est un paramètre de recherche standard FHIR (applicable à toute ressource), mais son support n'est pas documenté à ce jour dans le tableau des paramètres de [TD3.1a](transaction_td3.1a.md) ni garanti par le serveur DMP. Ce point doit être vérifié / ajouté aux exigences techniques (`CapabilityStatement.rest.resource.searchParam`) si cette approche est retenue.

###### Phase « Analyse » revisitée avec relatesTo

Pour chaque `DocumentReference` retournée :

* Si `status = superseded` : ignorer (ancienne version déjà remplacée — l'information utile est portée par le nouveau document via `relatesTo`, pas besoin de la traiter séparément). Équivalent du filtre XDS sur le statut **Deprecated**.
* **Cas A — Document remplacé** : `status = current` et `relatesTo.code = "replaces"` avec `relatesTo.target` référençant un `DocumentReference.id` déjà connu dans `localDocumentsDMP`. Le document local est marqué comme remplacé et sa référence mise à jour avec le nouvel `id`. Le pointeur étant porté directement par le document retourné, **aucun appel supplémentaire n'est nécessaire** pour retrouver le document remplacé (contrairement à la remontée de chaîne `RPLC` via `GetAssociations` en XDS) — sauf cas rare où plusieurs remplacements successifs se sont produits et que des versions intermédiaires sortent de la fenêtre `_lastUpdated`, auquel cas `relatesTo.target` peut être suivi de proche en proche par une lecture directe (`GET DocumentReference/{id}`).
* **Cas B — Nouveau document ou mise à jour de métadonnées** : si `DocumentReference.id` correspond à un document déjà connu localement, il s'agit d'une mise à jour de métadonnées (masquage/démasquage, visibilité patient) — le LPS met à jour le `securityLabel` local. Sinon, il s'agit d'un nouveau document, ajouté à `localDocumentsDMP`.

**Question ouverte 2** — Cette approche suppose que le serveur DMP retourne systématiquement `relatesTo` dans les résultats de recherche (élément à confirmer en `MustSupport` sur le profil `PDSm_ComprehensiveDocumentReference`). Elle suppose aussi que l'`id` de la ressource `DocumentReference` reste stable lors d'une simple modification de métadonnées, conformément à la mécanique de `PATCH` décrite en [TD3.3a](transaction_td3.3a.md)/[TD3.3b](transaction_td3.3b.md) (le `PATCH` modifie la ressource en place, sans changer son `id`). Ce point est en tension avec l'[annexe identifiants XDS/FHIR](annexe_identifiants_xds_fhir.md), qui indique que l'`entryUUID` XDS — mappé sur `DocumentReference.id` — change **aussi** à chaque modification de métadonnées. Si le comportement réel du DMP suit celui du `PATCH` (`id` stable), la transposition FHIR n'a alors plus besoin d'un équivalent au `logicalId` XDS pour détecter les mises à jour de métadonnées : un seul identifiant (`DocumentReference.id`) suffit. Ce point doit être clarifié avec l'équipe DMP, et l'annexe corrigée si nécessaire.

###### Phase de récupération

Comme pour la « Première ouverture », la récupération des documents nouveaux ou remplacés se fait via ITI-68, avec le même levier d'optimisation : un `Bundle` `batch` regroupant les appels `GET Binary/{id}` en une seule requête HTTP (cf. section précédente).

###### Synthèse comparative

| | | |
| :--- | :--- | :--- |
| XDS (référence actuelle) | 2 + 1 par lot de 20 documents (+ 0 à 2 pour la récupération) | `FindSubmissionSets`(1) +`GetAssociations`(1) +`GetDocumentsAndAssociations`(1 par lot de 20 documents, arrondi au lot supérieur) [+`RetrieveDocumentSet`] |
| FHIR — recherche incrémentale`_lastUpdated` | 1 (+ 0 à 1 pour la récupération) | `DocumentReference?_lastUpdated=gt[dateAppelDMP]`(1) [+ Bundle`batch`] |

**Conclusion :** à la différence de la « Première ouverture », où la traduction directe des transactions XDS reste possible terme à terme, le cas « Accès suivants » ne peut pas être transposé transaction par transaction : le modèle de lots/associations XDS n'a pas d'équivalent FHIR direct. En revanche, en revenant à l'objectif métier plutôt qu'aux transactions XDS, une unique recherche FHIR par `_lastUpdated` combinée à l'usage de `relatesTo` permet de couvrir le même besoin en **1 transaction, au lieu de 2 plus une par lot de 20 documents** — un gain net qui s'accroît avec le volume de documents, sous réserve de lever les deux questions ouvertes ci-dessus avec l'équipe DMP.

###### Exemple FHIR complet du cas d'usage

Reprenons le patient et les deux documents importés lors de la « Première ouverture » (`cr-consultation-td31a`, `ordonnance-td31a`), avec `dateAppelDMP = 2026-06-01T09:00:00+02:00` (dernière connexion). Entre-temps :

* l'ordonnance a été remplacée le `2026-07-02T10:00:00+02:00` par une nouvelle version (`ordonnance-td31a-v2`) ;
* le compte rendu de consultation a été masqué au patient le `2026-07-01T14:00:00+02:00` (PATCH `securityLabel`, cf. TD3.3b).

**Recherche incrémentale :**

```
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345&_lastUpdated=gt2026-06-01T09:00:00+02:00 HTTP/1.1
Accept: application/fhir+json

```

Réponse — `200 OK`, `Bundle` `searchset`, 3 entrées :

```
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 3,
  "entry": [
    {
      "resource": {
        "resourceType": "DocumentReference",
        "id": "ordonnance-td31a",
        "status": "superseded",
        "meta": { "lastUpdated": "2026-07-02T10:00:00+02:00" }
      }
    },
    {
      "resource": {
        "resourceType": "DocumentReference",
        "id": "ordonnance-td31a-v2",
        "masterIdentifier": { "system": "urn:ietf:rfc:3986", "value": "urn:oid:1.2.250.1.213.1.4.8.99999.103" },
        "status": "current",
        "relatesTo": [{ "code": "replaces", "target": { "reference": "DocumentReference/ordonnance-td31a" } }],
        "meta": { "lastUpdated": "2026-07-02T10:00:00+02:00" }
      }
    },
    {
      "resource": {
        "resourceType": "DocumentReference",
        "id": "cr-consultation-td31a",
        "status": "current",
        "securityLabel": [{ "coding": [{ "system": "https://mos.esante.gouv.fr/NOS/TRE_A07-StatutVisibiliteDocument/FHIR/TRE-A07-StatutVisibiliteDocument", "code": "INVISIBLE_PATIENT" }] }],
        "meta": { "lastUpdated": "2026-07-01T14:00:00+02:00" }
      }
    }
  ]
}

```

**Analyse par le LPS (aucun appel réseau supplémentaire) :**

* `ordonnance-td31a` — `status = superseded` → ignoré.
* `ordonnance-td31a-v2` — `relatesTo.target = DocumentReference/ordonnance-td31a`, connu dans `localDocumentsDMP` → **Cas A** : l'ordonnance locale est marquée remplacée, la référence mise à jour vers `ordonnance-td31a-v2`.
* `cr-consultation-td31a` — `id` déjà connu localement, `securityLabel` modifié → **Cas B** : mise à jour de la confidentialité en local, le PS est informé du masquage au patient.

Le PS est notifié d'un document remplacé et d'un changement de confidentialité. S'il souhaite consulter la nouvelle ordonnance, le LPS effectue une unique requête ITI-68 (ou un `Bundle` `batch` s'il y a plusieurs documents à récupérer).

**Bilan :**pour ce cas concret, le flux FHIR totalise
**1 transaction**pour la détection des changements (contre au moins 2 en XDS, indépendamment du nombre de lots), et éventuellement 1 transaction supplémentaire pour la récupération du document consulté.

