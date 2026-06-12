### Optimisation des transactions de consultation DMP

<div class="meta"><strong>Version :</strong> V0.3 &nbsp;|&nbsp; <strong>Date :</strong> 26/05/2026</div>

### 1. Objet

<p>Dans le cadre de l'optimisation des transactions de consultation DMP, l'objectif de ce document est de décrire un guide pour les implémenteurs.</p>

### 2. Définitions

#### 2.1 DMP

##### 2.1.1 Transactions utilisées

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

##### 2.1.2 Identifiants des documents utilisés

<table>
  <thead><tr><th>Identifiant</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>uniqueId</code></td><td>Identifiant logique globalement unique, généré par le logiciel. Présent dans le CDA et les métadonnées XDS.</td></tr>
    <tr><td><code>entryUUID</code></td><td>Identifiant technique affecté par le SI DMP à une version de métadonnées d'un document. Change à chaque nouvelle version du document (remplacement) et à chaque modification de métadonnées (masquage/démasquage aux PS, remise en visibilité patient ou RL).</td></tr>
    <tr><td><code>logicalId</code> (lid)</td><td>Identifiant technique affecté par le SI DMP à un document (identique pour toutes ses versions de métadonnées). Change à chaque nouvelle version du document (remplacement) mais reste identique à chaque modification de métadonnées.</td></tr>
  </tbody>
</table>

#### 2.2 Variables logiciel

<table>
  <thead><tr><th>Variable</th><th>Type</th><th>Description</th></tr></thead>
  <tbody>
    <tr><td><code>dateAppelDMP</code></td><td>DateTime (UTC)</td><td>Date et heure de la dernière connexion au DMP pour ce patient. Initialisée à la première venue, mise à jour à chaque venue suivante.</td></tr>
    <tr><td><code>typeDMP</code></td><td>Liste de codes</td><td>Liste des <code>typeCode</code> de documents DMP. Préférence de l'utilisateur.</td></tr>
    <tr><td><code>localDocumentsDMP</code></td><td>Map</td><td>Index local des documents déjà stockés dans le LPS. Contient pour chaque document son dernier <code>entryUUID</code>, son <code>logicalId</code> et son <code>uniqueId</code>.</td></tr>
  </tbody>
</table>

---

### 3. Description du processus

<p>Le processus se divise en deux branches selon qu'il s'agit de la première ouverture du dossier patient dans le logiciel ou des accès suivants.</p>

#### 3.1 Première ouverture

<p>L'objectif est de détecter les documents présents dans le DMP qui ne sont pas encore connus du système.</p>

##### 3.1.1 Phase 1 — Recherche des documents

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

##### 3.1.2 Phase 2 — Traitement (interne logiciel)

<div class="note">
  <strong>Note :</strong> Le même document CDA peut être transmis via MSS et déposé sur le DMP. Le <code>uniqueId</code> étant identique dans les deux cas, le LPS doit systématiquement vérifier qu'un document n'est pas déjà présent en local avant tout import.
</div>

<p>Pour chaque document retourné, le système vérifie que son <code>uniqueId</code> n'est pas déjà présent dans les documents en local.</p>
<p>Les documents dont le <code>uniqueId</code> correspond à des documents déjà presents en local (documents reçus par MSS, ...) sont ajoutés à <code>localDocumentsDMP</code> (<code>entryUUID</code>, <code>logicalId</code>, <code>uniqueId</code>).</p>

##### 3.1.3 Phase 3 — Notification et récupération optionnelle

<p>Le PS est notifié du nombre de documents tiers détectés.</p>
<p>Le PS peut visualiser un ou plusieurs documents via RetrieveDocumentSet.</p>
<p>Si le PS souhaite importer  des documents DMP en local, le LPS appelle <code>RetrieveDocumentSet</code> et stocke les documents en local avec leurs identifiants (<code>entryUUID</code>, <code>uniqueId</code>, <code>logicalId</code>) dans <code>localDocumentsDMP</code>.</p>

##### 3.1.4 Logigramme

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

---

#### 3.2 Accès suivants

<p>L'objectif est de détecter uniquement les changements survenus depuis la dernière connexion :</p>
<ul>
  <li>Nouveaux documents</li>
  <li>Remplacements de documents ou documents ayant changé de confidentialité</li>
</ul>

##### 3.2.1 Phase 1 — Recherche des nouveaux lots

<p><code>dateAppelDMP</code> est mis à jour avec la date/heure courante (UTC).</p>
<p>Le système appelle <code>FindSubmissionSets</code> (<code>$XDSSubmissionSetSubmissionTimeFrom</code> = <code>dateAppelDMP</code>) pour récupérer tous les lots soumis depuis la dernière connexion.</p>
<p>Il appelle ensuite <code>GetAssociations</code> sur les <code>entryUUID</code> des lots retournés, puis filtre les associations de type <strong>HasMember</strong> pour extraire les <code>entryUUID</code> des documents concernés.</p>

##### 3.2.2 Phase 2 — Récupération des métadonnées

<p>Les documents sont récupérés par lot de 20 via <code>GetDocumentsAndAssociations</code>, qui retourne les métadonnées et les associations (notamment <code>RPLC</code>).
Les « résultats finaux » sont constitués de l'agrégat des résultats des différents lots éventuels.
</p>
<div class="note"><strong>Note :</strong> Rendre paramétrable le nombre de documents pouvant être récupéré via la query <code>GetDocumentsAndAssociations</code> (par défaut 20).</div>

##### 3.2.3 Phase 3 — Analyse des résultats finaux

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

##### 3.2.4 Phase 4 — Mise à jour et notification

<p>Le PS est notifié des documents nouveaux ou remplacés.</p>
<p>Il peut ensuite les consulter via <code>RetrieveDocumentSet</code>.</p>
<p>Si le PS souhaite importer des documents DMP en local, le LPS appelle <code>RetrieveDocumentSet</code> et stocke les documents en local avec leurs identifiants (<code>entryUUID</code>, <code>uniqueId</code>, <code>logicalId</code>) dans <code>localDocumentsDMP</code>.</p>

##### 3.2.5 Logigramme

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
