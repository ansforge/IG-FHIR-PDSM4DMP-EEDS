<div class="meta"><strong>Version :</strong> V0.3 &nbsp;|&nbsp; <strong>Date :</strong> 26/05/2026</div>

### Objet

<p>Dans le cadre de l'optimisation des transactions de consultation DMP, l'objectif de ce document est de décrire un guide pour les implémenteurs.</p>

### Définitions

#### DMP

##### Transactions utilisées

<p>Les transactions utilisées dans ce flux sont des requêtes <strong>IHE ITI-18 Stored Query</strong> (TD3.1) et <strong>IHE ITI-43 Retrieve Document Set</strong> (TD3.2).</p>

<table>
  <thead><tr><th>Transaction</th><th>Type</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>FindDocuments</code></td><td>TD3.1 — Stored Query</td><td>Recherche de documents par critères (statut, date d'acte, type). Retourne les métadonnées XDS.</td></tr>
    <tr><td><code>FindSubmissionSets</code></td><td>TD3.1 — Stored Query</td><td>Recherche des lots de soumission depuis une date donnée (<code>$XDSSubmissionSetSubmissionTimeFrom</code>).</td></tr>
    <tr><td><code>GetAssociations</code></td><td>TD3.1 — Stored Query</td><td>Retourne toutes les associations liées aux objets XDS passés en paramètre (par <code>entryUUID</code>).</td></tr>
    <tr><td><code>GetDocumentsAndAssociations</code></td><td>TD3.1 — Stored Query</td><td>Retourne les documents et leurs associations (RPLC, HasMember) à partir d'une liste d'<code>entryUUID</code>. Appelé par batch de 20.</td></tr>
    <tr><td><code>RetrieveDocumentSet</code></td><td>TD3.2 — Retrieve</td><td>Télécharge le contenu binaire des documents à partir d'une liste d'<code>uniqueId</code>.</td></tr>
  </tbody>
</table>

<p><strong>Paramètres utilisés</strong></p>
<table>
  <thead><tr><th>Paramètre</th><th>Transaction</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>availabilityStatus:urn:oasis:names:tc:ebxml-regrep:StatusType:Approved</code></td><td><code>FindDocuments</code></td><td>Filtre sur les documents courants uniquement</td></tr>
    <tr><td><code>XDSDocumentEntryServiceStartTimeFrom</code></td><td><code>FindDocuments</code></td><td>Date de début de l'acte médical (filtrage sur 2 ans) (UTC)</td></tr>
    <tr><td><code>$XDSDocumentEntryTypeCode (optionnel, multiple) </code></td><td><code>FindDocuments</code></td><td>Liste des typeCode à filtrer (optionnel) </td></tr>
    <tr><td><code>$XDSSubmissionSetSubmissionTimeFrom</code></td><td><code>FindSubmissionSets</code></td><td>Filtre sur la date (UTC) d'ajout dans le DMP à partir de laquelle on souhaite récupérer les nouveaux documents  : renseigné avec la date de la dernière connexion  du professionnel au DMP  </td></tr>
    <tr><td><code>entryUUID</code></td><td><code>GetAssociations</code>, <code>GetDocumentsAndAssociations</code></td><td>Identifiant technique affecté par le SI DMP </td></tr>
  </tbody>
</table>

##### Identifiants des documents utilisés

<table>
  <thead><tr><th>Identifiant</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>uniqueId</code></td><td>Identifiant logique globalement unique, généré par le logiciel. Présent dans le CDA et les métadonnées XDS.</td></tr>
    <tr><td><code>entryUUID</code></td><td>Identifiant technique affecté par le SI DMP à une version de métadonnées d'un document. Change à chaque nouvelle version du document (remplacement) et à chaque modification de métadonnées (masquage/démasquage aux PS, remise en visibilité patient ou RL).</td></tr>
    <tr><td><code>logicalId</code> (lid)</td><td>Identifiant technique affecté par le SI DMP à un document (identique pour toutes ses versions de métadonnées). Change à chaque nouvelle version du document (remplacement) mais reste identique à chaque modification de métadonnées.</td></tr>
  </tbody>
</table>

#### Variables logiciel

<table>
  <thead><tr><th>Variable</th><th>Type</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>dateAppelDMP</code></td><td>DateTime (UTC)</td><td>Date et heure de la dernière connexion au DMP pour ce patient. Initialisée à la première venue, mise à jour à chaque venue suivante.</td></tr>
    <tr><td><code>typeDMP</code></td><td>Liste de codes</td><td>Liste des <code>typeCode</code> de documents DMP. Préférence de l'utilisateur.</td></tr>
    <tr><td><code>localDocumentsDMP</code></td><td>Map</td><td>Index local des documents déjà stockés dans le LPS. Contient pour chaque document son dernier <code>entryUUID</code>, son <code>logicalId</code> et son <code>uniqueId</code>.</td></tr>
  </tbody>
</table>

---

### Description du processus

<p>Le processus se divise en deux branches selon qu'il s'agit de la première ouverture du dossier patient dans le logiciel ou des accès suivants.</p>

#### Première ouverture

<p>L'objectif est de détecter les documents présents dans le DMP qui ne sont pas encore connus du système.</p>

##### Phase 1 — Recherche des documents

<p>Le LPS enregistre la date et heure courante dans <code>dateAppelDMP</code>. Cette date servira de référence lors des accès suivants.</p>
<p>Une requête <strong>FindDocuments</strong> est envoyée au DMP pour récupérer les documents courants de moins de 2 ans.</p>
<div class="note">
  <strong>Notes :</strong>
  <ol>
    <li>La première recherche documentaire automatique dans un DMP doit obligatoirement se faire sur une période maximale de 2 ans.</li>
    <li>Uniquement sur un statut "courant" (<code>urn:oasis:names:tc:ebxml-regrep:StatusType:Approved</code>) .</li>
    <li>Dans le cas où le PS a des préférences de type de document renseigné (typeDMP) : sur une liste de type de documents particuliers. Le LPS doit indiquer que la recherche est filtrée sur ces types de document uniquement. Le PS doit pouvoir étendre sa recherche à d'autres types de document ou désactiver ce filtre s'il ne trouve pas les document recherchés.</li>
    <li>Point d'attention sur le document particulier « Historique de vaccination » qui peut dans la majorité des cas avoir une date de début d'acte (plus ancienne vaccination) inférieure à 2 ans (vaccination COVID notament). Un LPS doit pouvoir proposer au PS une recherche spécifique et manuelle sur ce typeCode sans limitation de date (si le document pas présent dans la première recherche automatique).</li>
  </ol>
</div>

##### Phase 2 — Traitement (interne logiciel)

<div class="note">
  <strong>Note :</strong> Le même document CDA peut être transmis via MSS et déposé sur le DMP. Le <code>uniqueId</code> étant identique dans les deux cas, le LPS doit systématiquement vérifier qu'un document n'est pas déjà présent en local avant tout import.
</div>

<p>Pour chaque document retourné, le système vérifie que son <code>uniqueId</code> n'est pas déjà présent dans les documents en local.</p>
<p>Les documents dont le <code>uniqueId</code> correspond à des documents déjà presents en local (documents reçus par MSS, ...) sont ajoutés à <code>localDocumentsDMP</code> (<code>entryUUID</code>, <code>logicalId</code>, <code>uniqueId</code>).</p>

##### Phase 3 — Notification et récupération optionnelle

<p>Le PS est notifié du nombre de documents tiers détectés.</p>
<p>Le PS peut visualiser un ou plusieurs documents via RetrieveDocumentSet.</p>
<p>Si le PS souhaite importer  des documents DMP en local, le LPS appelle <code>RetrieveDocumentSet</code> et stocke les documents en local avec leurs identifiants (<code>entryUUID</code>, <code>uniqueId</code>, <code>logicalId</code>) dans <code>localDocumentsDMP</code>.</p>

##### Logigramme — Première ouverture

<div class="mermaid">
%%{init: { 'theme': 'base', 'themeVariables': { 'fontSize': '11px', 'actorBkg': '#d0e8f8', 'actorTextColor': '#0d2b45', 'actorBorderColor': '#2271b1', 'noteBkgColor': '#fff8dc', 'noteTextColor': '#333', 'labelBoxBkgColor': '#e8f4fd', 'sequenceNumberColor': '#2271b1', 'labelBoxBorderColor': '#999999', 'altSectionBkgColor': '#f5f5f5', 'loopTextColor': '#333' } } }%%
sequenceDiagram
   title Première ouverture
   actor  PS
   participant LPS
   participant DMP

   PS->>LPS: Accès au dossier patient


       rect rgb(180, 215, 245)

           note over LPS,DMP: Phase 1 — Recherche des documents

           LPS->>LPS: Stockage variable[dateAppelDMP] = date/heure courante (UTC)
           LPS->>DMP: FindDocuments (document courant, date Acte - 2 ans,[typeCode])
           DMP-->>LPS:

           note over LPS,DMP:  Phase 2 — Traitement (interne logiciel)

           loop Pour chaque document retourné
               LPS->>LPS: Si Document déja présent (test sur le uniqueId) alors ajout à localDocumentsDMP
           end

           note over LPS,DMP:  Phase 3 — Notification et récupération optionnelle

           LPS->>PS: Notification des   documents tiers détectés
           opt Import  local des documents
               note over LPS : Demande de visualisation de un plusieurs 
               PS->>LPS: Selection des documents à visualiser
               LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId])
               DMP-->>LPS:
               LPS->>PS: Affichage des documents 
               note over LPS : Selection des documents à importer
               PS->>LPS: Selection des documents à importer
     
               LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId])
                         DMP-->>LPS:
               LPS->>LPS: Import des documents et stockage de  localDocumentsDMP[entryUUID,logicalID,uniqueId]
           end
       end


</div>

##### Transposition FHIR native et optimisation du nombre de transactions

<p>Les phases précédentes décrivent le cas d'usage « Première ouverture » avec le vocabulaire XDS (transactions IHE ITI-18/ITI-43) utilisé historiquement par le DMP. Cette section propose la transposition complète du même cas d'usage avec les transactions FHIR du profil PDSm (<a href="transaction_td3.1a.html">TD3.1a</a> — ITI-67, <a href="transaction_td3.2.html">TD3.2</a> — ITI-68), et évalue si elle permet de réduire le nombre d'échanges réseau nécessaires.</p>

###### Rappel — flux XDS (référence)

<p>Quel que soit le nombre de documents détectés, le flux XDS décrit ci-dessus ne nécessite que <strong>2 transactions réseau</strong> au maximum :</p>
<ol>
  <li><code>FindDocuments</code> — une seule requête, retourne les métadonnées de tous les documents correspondant aux critères ;</li>
  <li><code>RetrieveDocumentSet</code> — une seule requête, capable de retourner plusieurs documents en une fois (liste d'<code>uniqueId</code> en paramètre).</li>
</ol>

###### Transposition directe en FHIR

<p>La Phase 1 (recherche) se transpose directement en une requête <strong>ITI-67 Find Document References</strong> :</p>

```http
GET [base]/DocumentReference?patient.identifier=[système-INS]|[valeur-INS]&status=current&period=ge[dateActe-2ans]&type=[typeCode1],[typeCode2] HTTP/1.1
Accept: application/fhir+json
```

<p>La réponse est un <code>Bundle</code> de type <code>searchset</code> contenant l'ensemble des <code>DocumentReference</code> correspondants — <strong>en une seule transaction</strong>, comme <code>FindDocuments</code>.</p>

<p>La Phase 3 (récupération) se transpose en une requête <strong>ITI-68 Retrieve Document</strong> pour chaque document sélectionné (<code>GET [DocumentReference.content.attachment.url]</code>). Telle que définie par IHE MHD, cette transaction ne couvre qu'une récupération unitaire — contrairement à <code>RetrieveDocumentSet</code> (ITI-43), elle n'inclut pas de mécanisme natif de regroupement de plusieurs documents en un seul appel.</p>

<div class="note">
  <strong>Constat :</strong> une transposition terme à terme aboutit à <code>1 + N</code> transactions (1 recherche + N récupérations), contre 2 en XDS. Pour N documents sélectionnés, le flux FHIR naïf devient moins optimal que le flux XDS dès que N &gt; 1.
</div>

###### Exemple FHIR complet du cas d'usage

<p>Reprenons le patient et les deux documents des exemples <a href="transaction_td3.1a.html">TD3.1a</a> / <a href="transaction_td3.2.html">TD3.2</a> — INS <code>1.2.250.1.213.1.4.8|123456789012345</code>, aucun des deux documents n'étant encore connu du LPS. Le PS a configuré une préférence <code>typeDMP</code> = [Compte rendu de consultation (LOINC <code>11488-4</code>), Prescription médicale (LOINC <code>57833-6</code>)]. Le LPS ouvre le dossier le <code>2026-07-02</code> ; la borne des 2 ans est donc <code>2024-07-02</code>.</p>

<p><strong>Phase 1 — recherche (ITI-67) :</strong></p>

```http
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345&status=current&period=ge2024-07-02&type=http://loinc.org|11488-4,http://loinc.org|57833-6 HTTP/1.1
Accept: application/fhir+json
```

<p>Réponse — <code>200 OK</code>, <code>Bundle</code> de type <code>searchset</code>, 2 entrées :</p>

```json
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

<p>Fiches complètes : <a href="DocumentReference-example-td3-1a-cr-consultation.html">compte rendu de consultation</a>, <a href="DocumentReference-example-td3-1a-ordonnance.html">ordonnance médicale</a>.</p>

<p><strong>Phase 2 — traitement interne (pas d'appel réseau) :</strong> le LPS compare les <code>masterIdentifier</code> reçus (<code>...99999.101</code> et <code>...99999.102</code>) à <code>localDocumentsDMP</code>. Aucun des deux n'y figure : ce sont deux documents tiers détectés.</p>

<p><strong>Phase 3 — notification puis récupération groupée (ITI-68 via Bundle <code>batch</code>, cf. Optimisation ci-dessous) :</strong> le PS visualise puis importe les deux documents en un seul appel :</p>

```http
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json
```

```json
{
  "resourceType": "Bundle",
  "type": "batch",
  "entry": [
    { "request": { "method": "GET", "url": "https://dmp.esante.gouv.fr/fhir/Binary/cr-consultation-td31a" } },
    { "request": { "method": "GET", "url": "Binary/ordonnance-td31a" } }
  ]
}
```

<p>Le LPS stocke ensuite les deux documents en local avec leurs identifiants (<code>id</code> DMP, <code>masterIdentifier</code>) dans <code>localDocumentsDMP</code>.</p>

<div class="note">
  <strong>Bilan :</strong> pour ce cas concret à 2 documents, le flux FHIR optimisé (recherche + batch) totalise <strong>2 transactions réseau</strong> — identique au flux XDS (<code>FindDocuments</code> + <code>RetrieveDocumentSet</code>).
</div>

###### Optimisation — Bundle `batch` pour grouper les récupérations

<p>La spécification FHIR définit nativement l'interaction <strong>batch</strong> (cf. <a href="https://www.hl7.org/fhir/http.html#transaction">FHIR RESTful API — Batch/Transaction</a>) : plusieurs requêtes indépendantes peuvent être regroupées dans un unique <code>Bundle</code> envoyé en une seule requête HTTP <code>POST [base]</code>. Le LPS peut ainsi remplacer les N appels <code>GET Binary/{id}</code> par un unique appel batch.</p>

<p><strong>Requête :</strong></p>

```http
POST [base] HTTP/1.1
Content-Type: application/fhir+json
Accept: application/fhir+json
```

```json
{
  "resourceType": "Bundle",
  "type": "batch",
  "entry": [
    { "request": { "method": "GET", "url": "https://dmp.esante.gouv.fr/fhir/Binary/cr-consultation-td31a" } },
    { "request": { "method": "GET", "url": "Binary/ordonnance-td31a" } }
  ]
}
```

<p><strong>Réponse</strong> — un <code>Bundle</code> de type <code>batch-response</code>, une entrée par requête, dans le même ordre :</p>

```json
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

<p>Avec cette approche, le flux « Première ouverture » revient à <strong>2 transactions</strong> (1 recherche ITI-67 + 1 batch de récupération), quel que soit le nombre de documents importés — <strong>équivalent au flux XDS</strong>.</p>

<div class="note">
  <strong>Prérequis :</strong> le serveur DMP doit déclarer le support de l'interaction <code>batch</code> dans son <code>CapabilityStatement</code> (<code>rest.interaction.code = batch</code>). Ce point n'est pas actuellement documenté dans les transactions TD3.x de cet IG et doit être vérifié / imposé dans les exigences techniques du profil DMP.
</div>

###### Synthèse comparative

<table>
  <thead><tr><th>Flux</th><th>Nb. transactions réseau</th><th>Détail</th></tr></thead>
  <tbody>
    <tr><td>XDS (référence actuelle)</td><td>2</td><td><code>FindDocuments</code> (1) + <code>RetrieveDocumentSet</code> batché (1)</td></tr>
    <tr><td>FHIR — transposition directe</td><td>1 + N</td><td>ITI-67 (1) + N × ITI-68 (1 par document)</td></tr>
    <tr><td>FHIR — avec Bundle <code>batch</code></td><td>2</td><td>ITI-67 (1) + 1 Bundle <code>batch</code> regroupant les N récupérations</td></tr>
  </tbody>
</table>

<p><strong>Conclusion :</strong> une transposition FHIR terme à terme des transactions XDS est moins efficace qu'XDS dès que plusieurs documents sont récupérés. Le recours à l'interaction FHIR standard <code>batch</code> permet de revenir au même nombre de transactions qu'en XDS sans évolution de profil — c'est l'optimisation retenue pour ce cas d'usage.</p>

---

#### Accès suivants

<p>L'objectif est de détecter uniquement les changements survenus depuis la dernière connexion :</p>
<ul>
  <li>Nouveaux documents</li>
  <li>Remplacements de documents ou documents ayant changé de confidentialité</li>
</ul>

##### Phase 1 — Recherche des nouveaux lots

<p><code>dateAppelDMP</code> est mis à jour avec la date/heure courante (UTC).</p>
<p>Le système appelle <code>FindSubmissionSets</code> (<code>$XDSSubmissionSetSubmissionTimeFrom</code> = <code>dateAppelDMP</code>) pour récupérer tous les lots soumis depuis la dernière connexion.</p>
<p>Il appelle ensuite <code>GetAssociations</code> sur les <code>entryUUID</code> des lots retournés, puis filtre les associations de type <strong>HasMember</strong> pour extraire les <code>entryUUID</code> des documents concernés.</p>

##### Phase 2 — Récupération des métadonnées

<p>Les documents sont récupérés par lot de 20 via <code>GetDocumentsAndAssociations</code>, qui retourne les métadonnées et les associations (notamment <code>RPLC</code>).
Les « résultats finaux » sont constitués de l'agrégat des résultats des différents lots éventuels.
</p>
<div class="note"><strong>Note :</strong> Rendre paramétrable le nombre de documents pouvant être récupéré via la query <code>GetDocumentsAndAssociations</code> (par défaut 20).</div>

##### Phase 3 — Analyse des résultats finaux

<p>Pour chaque document, ignorer ceux qui sont au statut <strong>Deprecated</strong> (il s'agit d'une version antérieure du document déjà remplacée par une plus récente également retournée dans les résultats, ou d'une ancienne version de métadonnée obsolète).
  
Deux  cas sont ensuite traités :</p>
<ul>
  <li><strong>Cas A — Document remplacé</strong> : une association <strong>RPLC</strong> existe et son <code>targetObject</code> correspond à un document déjà en local (<code>localDocumentsDMP[entryUUID]</code>). 
    Le document local est marqué comme remplacé. Si aucun document "Non Deprecated" n'est trouvé directement dans la liste des nouveaux documents (cas où le nouveau document est également lui-même replacé), la chaine RPLC doit être remontée (via les associations RPLC et les sourceObject/targetObject) pour trouver la version la plus récente du document qui n'est pas Deprecated et qui se trouve dans la liste des nouveaux documents.</li>
  <li><strong>Cas B — Nouveau document ou mise à jour de métadonnées</strong> :
    <ul>
      <li>Si le <code>logicalId</code> du document récupéré correspond à un document déjà en local (<code>localDocumentsDMP[logicalId]</code>), le document a subi une modification de métadonnées par un autre acteur (masquage/démasquage au PS, remise en visibilité patient ou représentant légal). Le système met à jour le code de confidentialité en local et en informe le PS. Il met à jour les références du document avec ses nouveaux identifiants (nouvel <code>entryUUID</code>, <code>uniqueId</code> inchangé, <code>logicalId</code> inchangé).</li>
      <li>Sinon, il s'agit d'un <strong>nouveau document</strong> : statut  non <code>Deprecated
      </code> (<code>Approved</code> ou <code>Archived</code>), sans association RPLC pointant vers un document local. Il est ajouté à <code>localDocumentsDMP</code>.</li>
    </ul>
  </li>
</ul>
<div class="note">
  <strong>Note :</strong> Lors de l'analyse des résultats et avant tout import, le LPS doit vérifier que le document n'est pas déjà présent en local via son <code>uniqueId</code>. Les documents dont le uniqueId correspond à des documents déjà presents en local (documents reçus par MSS, ...) sont ajoutés à localDocumentsDMP (entryUUID, logicalId, uniqueId).
</div>

##### Phase 4 — Mise à jour et notification

<p>Le PS est notifié des documents nouveaux ou remplacés.</p>
<p>Il peut ensuite les consulter via <code>RetrieveDocumentSet</code>.</p>
<p>Si le PS souhaite importer des documents DMP en local, le LPS appelle <code>RetrieveDocumentSet</code> et stocke les documents en local avec leurs identifiants (<code>entryUUID</code>, <code>uniqueId</code>, <code>logicalId</code>) dans <code>localDocumentsDMP</code>.</p>

##### Logigramme — Accès suivants

<div class="mermaid">
%%{init: { 'theme': 'base', 'themeVariables': { 'fontSize': '11px', 'actorBkg': '#d0e8f8', 'actorTextColor': '#0d2b45', 'actorBorderColor': '#2271b1', 'noteBkgColor': '#fff8dc', 'noteTextColor': '#333', 'labelBoxBkgColor': '#e8f4fd', 'sequenceNumberColor': '#2271b1', 'labelBoxBorderColor': '#999999', 'altSectionBkgColor': '#f5f5f5', 'loopTextColor': '#333' } } }%%
sequenceDiagram
   title Accés suivants
   actor  PS
   participant LPS
   participant DMP

   PS->>LPS: Accès au dossier patient


       rect rgb(185, 225, 195)

           note over LPS,DMP: Phase 1 — Recherche des nouveaux lots
           LPS->>LPS: Mise à jour variable[dateAppelDMP] = date/heure courante (UTC)
           LPS->>DMP: FindSubmissionSets ($XDSSubmissionSetSubmissionTimeFrom = variable[dateAppelDMP]) 
           DMP-->>LPS:
           LPS->>DMP: GetAssociations (entryUUID des lots retournés) => Liste d'associations
           DMP-->>LPS:
           loop Filtre des associations
               LPS->>LPS: Filtre les associations de type HasMember pour extraire les entryUUID
           end


           note over LPS,DMP: Phase 2 — Récupération des métadonnées           
           loop Par batch 20
               LPS->>DMP: GetDocumentsAndAssociations (entryUUID des documents filtrés)
               DMP-->>LPS:
               LPS->>LPS : Agrégat des résultats finaux 
           end

           note over LPS,DMP: Phase 3 — Analyse des résultats finaux  

           loop Sur l'ensemble des résultats
               note right of LPS: Cas A — Gestion des documents  remplacés
              
               note right of LPS: Cas B — Gestion des nouveaux documents ou mises à jour des métadonnées



           end

           note over LPS,DMP: Phase 4 — Mise à jour et notification

      
           LPS->>PS: Notification des documents nouveaux, remplacés ou avec changement de confidentialité
           opt Import  local des documents
                 note over LPS : Demande de visualisation de un plusieurs 
               PS->>LPS: Selection des documents à visualiser
               LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId])
               DMP-->>LPS:
               LPS->>PS: Affichage des documents 
               note over LPS : Selection des documents à importer
               PS->>LPS: Selection des documents à importer
     
               LPS->>DMP: RetrieveDocumentSet (variable[listeUniqueId])
                         DMP-->>LPS:
               LPS->>LPS: Import des documents et stockage de  localDocumentsDMP[entryUUID,logicalID,uniqueId]
           end
       end


</div>

##### Transposition FHIR et détection incrémentale des changements

<p>Contrairement à la « Première ouverture », les transactions XDS utilisées ici (<code>FindSubmissionSets</code>, <code>GetAssociations</code>, <code>GetDocumentsAndAssociations</code>) n'ont pas d'équivalent FHIR terme à terme documenté dans cet IG : elles reposent sur le modèle XDS des lots de soumission et des associations <code>RPLC</code>/<code>HasMember</code>, propre à ITI-18. La transposition proposée ci-dessous ne traduit donc pas ces transactions une à une ; elle reformule l'objectif métier (« détecter ce qui a changé depuis <code>dateAppelDMP</code> ») avec les moyens natifs de FHIR, en s'appuyant sur deux éléments déjà définis ailleurs dans cet IG : le paramètre de recherche technique <code>_lastUpdated</code> (norme FHIR de base) et l'élément <code>DocumentReference.relatesTo</code> utilisé pour le remplacement (cf. <a href="transaction_td2.1.html">TD2.1</a>).</p>

###### Rappel — flux XDS (référence)

<p>Pour M documents concernés depuis la dernière connexion, le flux XDS décrit ci-dessus nécessite au minimum :</p>
<ol>
  <li><code>FindSubmissionSets</code> — 1 requête ;</li>
  <li><code>GetAssociations</code> — 1 requête (sur la liste des lots retournés) ;</li>
  <li><code>GetDocumentsAndAssociations</code> — autant de requêtes que de lots de 20 documents nécessaires, arrondi au lot supérieur ;</li>
  <li><code>RetrieveDocumentSet</code> — 0 à 2 requêtes supplémentaires si le PS visualise et/ou importe des documents.</li>
</ol>
<p>Soit <strong>2 transactions, plus une par lot de 20 documents (arrondi au lot supérieur), au minimum</strong> (hors récupération), un nombre qui croît avec le volume de documents modifiés.</p>

###### Proposition FHIR — recherche incrémentale par `_lastUpdated`

<p>La ressource <code>DocumentReference</code> comporte nativement <code>meta.lastUpdated</code>, mise à jour par le serveur FHIR à chaque création ou modification (cf. <a href="annexe_dates_xds_fhir.html">annexe dates XDS/FHIR</a>). Ce champ est mis à jour aussi bien pour un nouveau document, qu'un document remplacé (l'ancien passe à <code>superseded</code>, le nouveau est créé), ou qu'une simple modification de métadonnées (masquage, visibilité — cf. <a href="transaction_td3.3a.html">TD3.3a</a>/<a href="transaction_td3.3b.html">TD3.3b</a>). Une unique recherche suffit donc à couvrir ce que <code>FindSubmissionSets</code> + <code>GetAssociations</code> + <code>GetDocumentsAndAssociations</code> faisaient ensemble :</p>

```http
GET [base]/DocumentReference?patient.identifier=[système-INS]|[valeur-INS]&_lastUpdated=gt[dateAppelDMP] HTTP/1.1
Accept: application/fhir+json
```

<p>La réponse est un <code>Bundle</code> <code>searchset</code> contenant toutes les <code>DocumentReference</code> créées ou modifiées depuis <code>dateAppelDMP</code> — <strong>en une seule transaction</strong>, quel que soit M.</p>

<div class="dragon" markdown="1">

**Question ouverte 1** — Le paramètre <code>_lastUpdated</code> est un paramètre de recherche standard FHIR (applicable à toute ressource), mais son support n'est pas documenté à ce jour dans le tableau des paramètres de <a href="transaction_td3.1a.html">TD3.1a</a> ni garanti par le serveur DMP. Ce point doit être vérifié / ajouté aux exigences techniques (`CapabilityStatement.rest.resource.searchParam`) si cette approche est retenue.

</div>

###### Phase « Analyse » revisitée avec `relatesTo`

<p>Pour chaque <code>DocumentReference</code> retournée :</p>
<ul>
  <li>Si <code>status = superseded</code> : ignorer (ancienne version déjà remplacée — l'information utile est portée par le nouveau document via <code>relatesTo</code>, pas besoin de la traiter séparément). Équivalent du filtre XDS sur le statut <strong>Deprecated</strong>.</li>
  <li><strong>Cas A — Document remplacé</strong> : <code>status = current</code> et <code>relatesTo.code = "replaces"</code> avec <code>relatesTo.target</code> référençant un <code>DocumentReference.id</code> déjà connu dans <code>localDocumentsDMP</code>. Le document local est marqué comme remplacé et sa référence mise à jour avec le nouvel <code>id</code>. Le pointeur étant porté directement par le document retourné, <strong>aucun appel supplémentaire n'est nécessaire</strong> pour retrouver le document remplacé (contrairement à la remontée de chaîne <code>RPLC</code> via <code>GetAssociations</code> en XDS) — sauf cas rare où plusieurs remplacements successifs se sont produits et que des versions intermédiaires sortent de la fenêtre <code>_lastUpdated</code>, auquel cas <code>relatesTo.target</code> peut être suivi de proche en proche par une lecture directe (<code>GET DocumentReference/{id}</code>).</li>
  <li><strong>Cas B — Nouveau document ou mise à jour de métadonnées</strong> : si <code>DocumentReference.id</code> correspond à un document déjà connu localement, il s'agit d'une mise à jour de métadonnées (masquage/démasquage, visibilité patient) — le LPS met à jour le <code>securityLabel</code> local. Sinon, il s'agit d'un nouveau document, ajouté à <code>localDocumentsDMP</code>.</li>
</ul>

<div class="dragon" markdown="1">

**Question ouverte 2** — Cette approche suppose que le serveur DMP retourne systématiquement `relatesTo` dans les résultats de recherche (élément à confirmer en `MustSupport` sur le profil `PDSm_ComprehensiveDocumentReference`). Elle suppose aussi que l'`id` de la ressource `DocumentReference` reste stable lors d'une simple modification de métadonnées, conformément à la mécanique de `PATCH` décrite en <a href="transaction_td3.3a.html">TD3.3a</a>/<a href="transaction_td3.3b.html">TD3.3b</a> (le `PATCH` modifie la ressource en place, sans changer son `id`). Ce point est en tension avec l'<a href="annexe_identifiants_xds_fhir.html">annexe identifiants XDS/FHIR</a>, qui indique que l'`entryUUID` XDS — mappé sur `DocumentReference.id` — change *aussi* à chaque modification de métadonnées. Si le comportement réel du DMP suit celui du `PATCH` (`id` stable), la transposition FHIR n'a alors plus besoin d'un équivalent au `logicalId` XDS pour détecter les mises à jour de métadonnées : un seul identifiant (`DocumentReference.id`) suffit. Ce point doit être clarifié avec l'équipe DMP, et l'annexe corrigée si nécessaire.

</div>

###### Phase de récupération

<p>Comme pour la « Première ouverture », la récupération des documents nouveaux ou remplacés se fait via ITI-68, avec le même levier d'optimisation : un <code>Bundle</code> <code>batch</code> regroupant les appels <code>GET Binary/{id}</code> en une seule requête HTTP (cf. section précédente).</p>

###### Synthèse comparative

<table>
  <thead><tr><th>Flux</th><th>Nb. transactions réseau</th><th>Détail</th></tr></thead>
  <tbody>
    <tr><td>XDS (référence actuelle)</td><td>2 + 1 par lot de 20 documents (+ 0 à 2 pour la récupération)</td><td><code>FindSubmissionSets</code> (1) + <code>GetAssociations</code> (1) + <code>GetDocumentsAndAssociations</code> (1 par lot de 20 documents, arrondi au lot supérieur) [+ <code>RetrieveDocumentSet</code>]</td></tr>
    <tr><td>FHIR — recherche incrémentale <code>_lastUpdated</code></td><td>1 (+ 0 à 1 pour la récupération)</td><td><code>DocumentReference?_lastUpdated=gt[dateAppelDMP]</code> (1) [+ Bundle <code>batch</code>]</td></tr>
  </tbody>
</table>

<p><strong>Conclusion :</strong> à la différence de la « Première ouverture », où la traduction directe des transactions XDS reste possible terme à terme, le cas « Accès suivants » ne peut pas être transposé transaction par transaction : le modèle de lots/associations XDS n'a pas d'équivalent FHIR direct. En revanche, en revenant à l'objectif métier plutôt qu'aux transactions XDS, une unique recherche FHIR par <code>_lastUpdated</code> combinée à l'usage de <code>relatesTo</code> permet de couvrir le même besoin en <strong>1 transaction, au lieu de 2 plus une par lot de 20 documents</strong> — un gain net qui s'accroît avec le volume de documents, sous réserve de lever les deux questions ouvertes ci-dessus avec l'équipe DMP.</p>

###### Exemple FHIR complet du cas d'usage

<p>Reprenons le patient et les deux documents importés lors de la « Première ouverture » (<code>cr-consultation-td31a</code>, <code>ordonnance-td31a</code>), avec <code>dateAppelDMP = 2026-06-01T09:00:00+02:00</code> (dernière connexion). Entre-temps :</p>
<ul>
  <li>l'ordonnance a été remplacée le <code>2026-07-02T10:00:00+02:00</code> par une nouvelle version (<code>ordonnance-td31a-v2</code>) ;</li>
  <li>le compte rendu de consultation a été masqué au patient le <code>2026-07-01T14:00:00+02:00</code> (PATCH <code>securityLabel</code>, cf. TD3.3b).</li>
</ul>

<p><strong>Recherche incrémentale :</strong></p>

```http
GET [base]/DocumentReference?patient.identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345&_lastUpdated=gt2026-06-01T09:00:00+02:00 HTTP/1.1
Accept: application/fhir+json
```

<p>Réponse — <code>200 OK</code>, <code>Bundle</code> <code>searchset</code>, 3 entrées :</p>

```json
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

<p><strong>Analyse par le LPS (aucun appel réseau supplémentaire) :</strong></p>
<ul>
  <li><code>ordonnance-td31a</code> — <code>status = superseded</code> → ignoré.</li>
  <li><code>ordonnance-td31a-v2</code> — <code>relatesTo.target = DocumentReference/ordonnance-td31a</code>, connu dans <code>localDocumentsDMP</code> → <strong>Cas A</strong> : l'ordonnance locale est marquée remplacée, la référence mise à jour vers <code>ordonnance-td31a-v2</code>.</li>
  <li><code>cr-consultation-td31a</code> — <code>id</code> déjà connu localement, <code>securityLabel</code> modifié → <strong>Cas B</strong> : mise à jour de la confidentialité en local, le PS est informé du masquage au patient.</li>
</ul>

<p>Le PS est notifié d'un document remplacé et d'un changement de confidentialité. S'il souhaite consulter la nouvelle ordonnance, le LPS effectue une unique requête ITI-68 (ou un <code>Bundle</code> <code>batch</code> s'il y a plusieurs documents à récupérer).</p>

<div class="note">
  <strong>Bilan :</strong> pour ce cas concret, le flux FHIR totalise <strong>1 transaction</strong> pour la détection des changements (contre au moins 2 en XDS, indépendamment du nombre de lots), et éventuellement 1 transaction supplémentaire pour la récupération du document consulté.
</div>
