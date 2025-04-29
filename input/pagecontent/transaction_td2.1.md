
### Description 
Remplacer un document existant dans le DMP d’un patient


Cette fonctionnalité permet d’alimenter le DMP d’un patient avec une nouvelle version d’un document.
Soient X le document initial (uniqueId par exemple 1.2.3.X) et Y la nouvelle version du document (uniqueId par exemple 1.2.3.Y).
Pour remplacer un document initial X dans le DMP du patient par une nouvelle version Y, la cinématique est la suivante.
-  L’utilisateur modifie le document X dans le LPS (corps et/ou métadonnées) pour créer le document Y.
-  Le LPS a récupéré les identifiants du document X (entryUUID et uniqueId, cf. DMP_3.1).
- Le LPS construit le document Y au format CDA et alimente les métadonnées XDS.
  -  CDA : relatedDocument = uniqueId du document X.
  -  XDS : association RPLC sur l’entryUUID du document X.
- Le LPS constitue un lot de soumission XDS et réalise la signature XAdES du lot.
- Le LPS envoie la requête au système DMP

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
Les identifiants entryUUID et uniqueId du document à remplacer obtenus par la fonctionnalité DMP_3.1 (EF_DMP31_01 et EF_DMP31_02).
L’identifiant de la nouvelle version du document (uniqueId par exemple 1.2.3.Y) (EF_DMP31_01).
Lot de soumission

### Sortie
Le document X est remplacé par le document Y dans le DMP du patient.

### Equivalence FHIR

Idem transaction TD2 avec utilisation de la slice UpdateDocumentRefs pour indiquer quel DocumentReference est remplacé

### Exemple