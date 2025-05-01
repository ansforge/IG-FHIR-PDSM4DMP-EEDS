<style>
svg[id^="mermaid-"] { min-width: 200px; max-width: 500px; }
</style>

### Segur DMP/UX.15
#### Exigence 
Le système DOIT afficher à l'utilisateur dans l'interface du « dossier médical », sans action nécessaire de sa part (sans clic), l'information du nombre de documents qui ont été versés au DMP par des acteurs de santé tiers à la structure (cabinet, établissement, etc), en fonction de son profil et du type de prise en charge du patient.

Les documents invisibles (au patient) DOIVENT systématiquement être inclus dans le décompte des documents notifiés y compris s'ils sont issus de la structure.

Par défaut, ces notifications DOIVENT être réalisées pour les profils médecins en consultation et en urgence.
#### Cinematique DMP
##### Diagramme
<div class="mermaid" style="height:500px">
 sequenceDiagram
    participant PS   
    participant DPI
    participant DMP
    PS->>DPI:Accés au dossier patient
    DPI->>DMP: FindSubmissionSets 
    DMP->>DPI: 

    DPI->>DMP: GetAssociations (liste des entryUUID ) 
    DMP->>DPI: 

    loop  Filtre
        DPI->>DPI: Filtrer les retours sur les Associations de type HasMember, et récupérer la liste des targetObject 
    end

    DPI->>DMP: GetDocuments  (liste des entryUUID ) 
    DMP->>DPI: 

    loop  Pour chaque document
        DPI->>DPI: AuthorInstitution (OID de la structure auteur). 
        DPI->>DPI: Flag de visibilité (déduit de confidentialityCode ou du statut CDAr2).
    end

    DPI->>PS: Notification du nombre de document
</div>

##### Description
Utilisation de la requête FindSubmissionSets pour rechercher les lots de soumission en spécifiant un intervalle temporel de soumission (date de soumission dans le DMP, critère $XDSSubmissionSetSubmissionTimeFrom et $XDSSubmissionSetSubmissionTimeTo) : retourne les lots de soumission
  - Récupérer l’ensemble des entryUUID des lots retournés.
  - Passer cette liste d’entryUUID à la fonction GetAssociations
  - Filtrer les retours sur les Associations de type HasMember, et récupérer la liste des targetObject (documents du lot).
  - Appel de GetDocuments avec la liste des entryUUID des documents.
    - Pour chaque document, examiner :
      - authorInstitution (OID de la structure auteur).
      - Le flag de visibilité (déduit de confidentialityCode ou du statut CDAr2).
    - Si (a) authorInstitution ≠ OID_local ou (b) document masqué au patient, alors inclure cet entryUUID dans l’ensemble des notifications
  - Comptage des notifications
    - nbNotifications = taille de l’ensemble.