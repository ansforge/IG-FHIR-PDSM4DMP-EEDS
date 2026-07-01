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

###### Requête FHIR (TD3.1a — ITI-67)

| | | |
| :--- | :--- | :--- |
| `patientID` | `patient.identifier` | `urn:oid:1.2.250.1.213.1.4.8|{INS}` |
| `availabilityStatus = Approved` | `status=current` | — |
| `XDSDocumentEntryServiceStartTimeFrom` | `period=ge{AAAA-MM-JJ}` | `dateAppelDMP`− 2 ans (UTC) |
| `typeCode`(optionnel, multiple) | `type={system}|{code}`(multivalué) | — |

**Sans filtre typeCode :**

```
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|{INS}&status=current&period=ge{AAAA-MM-JJ} HTTP/1.1
Accept: application/fhir+json

```

**Avec filtre typeCode (si `typeDMP` renseigné) :**

```
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|{INS}&status=current&period=ge{AAAA-MM-JJ}&type={system}|{code1}&type={system}|{code2} HTTP/1.1
Accept: application/fhir+json

```

La réponse est un `Bundle` de type `searchset` contenant zéro à N ressources `DocumentReference`.

##### Phase 2 — Traitement (interne logiciel)

**Note :**Le même document CDA peut être transmis via MSS et déposé sur le DMP. Le
`uniqueId`étant identique dans les deux cas, le LPS doit systématiquement vérifier qu'un document n'est pas déjà présent en local avant tout import.

Pour chaque document retourné, le système vérifie que son `uniqueId` n'est pas déjà présent dans les documents en local.

Les documents dont le `uniqueId` correspond à des documents déjà presents en local (documents reçus par MSS, ...) sont ajoutés à `localDocumentsDMP` (`entryUUID`, `logicalId`, `uniqueId`).

###### Correspondance des identifiants FHIR

Pour chaque `DocumentReference` dans `Bundle.entry[]` retourné en Phase 1 :

| | |
| :--- | :--- |
| `uniqueId` | `DocumentReference.masterIdentifier.value` |
| `entryUUID` | `DocumentReference.id` |
| `logicalId` | `DocumentReference.identifier[lid].value` |

##### Phase 3 — Notification et récupération optionnelle

Le PS est notifié du nombre de documents tiers détectés.

Le PS peut visualiser un ou plusieurs documents via RetrieveDocumentSet.

Si le PS souhaite importer des documents DMP en local, le LPS appelle `RetrieveDocumentSet` et stocke les documents en local avec leurs identifiants (`entryUUID`, `uniqueId`, `logicalId`) dans `localDocumentsDMP`.

###### Requête FHIR (TD3.2 — ITI-68)

L'URL du document est issue de `DocumentReference.content.attachment.url` obtenue en Phase 1.

**Scénario A — URL absolue :**

```
GET {DocumentReference.content.attachment.url} HTTP/1.1
Accept: {DocumentReference.content.attachment.contentType}

```

**Scénario B — URL relative au serveur FHIR :**

```
GET [base]/Binary/{id} HTTP/1.1
Accept: {DocumentReference.content.attachment.contentType}

```

La réponse est le contenu binaire du document (PDF, CDA XML, etc.) avec HTTP 200.

##### Logigramme — Première ouverture

%%{init: { 'theme': 'base', 'themeVariables': { 'fontSize': '11px', 'actorBkg': '#d0e8f8', 'actorTextColor': '#0d2b45', 'actorBorderColor': '#2271b1', 'noteBkgColor': '#fff8dc', 'noteTextColor': '#333', 'labelBoxBkgColor': '#e8f4fd', 'sequenceNumberColor': '#2271b1', 'labelBoxBorderColor': '#999999', 'altSectionBkgColor': '#f5f5f5', 'loopTextColor': '#333' } } }%% sequenceDiagram title Première ouverture actor PS participant LPS participant DMP PS->>LPS: Accès au dossier patient rect rgb(180, 215, 245) note over LPS,DMP: Phase 1 — Recherche des documents LPS->>LPS: Stockage variable[dateAppelDMP] = date/heure courante (UTC) LPS->>DMP: FindDocuments (document courant, date Acte - 2 ans,[typeCode]) DMP-->>LPS: note over LPS,DMP: Phase 2 — Traitement (interne logiciel) loop Pour chaque document retourné LPS->>LPS: Si Document déja présent (test sur le uniqueId) alors ajout à localDocumentsDMP end note over LPS,DMP: Phase 3 — Notification et récupération optionnelle LPS->>PS: Notification des documents tiers détectés opt Import local des documents note over LPS : Demande de visualisation de un plusieurs PS->>LPS: Selection des documents à visualiser LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId]) DMP-->>LPS: LPS->>PS: Affichage des documents note over LPS : Selection des documents à importer PS->>LPS: Selection des documents à importer LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId]) DMP-->>LPS: LPS->>LPS: Import des documents et stockage de localDocumentsDMP[entryUUID,logicalID,uniqueId] end end

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

