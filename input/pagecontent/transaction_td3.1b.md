
### Description 
Rechercher l’identifiant technique d’un document

Cette fonctionnalité permet, aux LPS qui n’implémentent pas DMP_3.1a, de rechercher l’identifiant technique d’un document (dans le système DMP) à partir de l’identifiant local au LPS de ce document.
Le LPS peut ensuite supprimer (DMP_3.3c), archiver (DMP_3.3d) ou remplacer un document dans le DMP du patient (DMP_2.1b/2.2b).

Cette fonctionnalité est mise en œuvre dans les LPS ne donnant pas accès à la consultation des documents (DMP_3.2). À ce jour, ce cas correspond aux situations suivantes :

- en authentification indirecte (hors mode AIR),
- en authentification directe par CPE,
- en authentification directe sans le profil « Consultation ».

La cinématique est décrite dans la règle RG_3110.

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le DMP du patient est au statut actif (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le LPS implémente le profil Alimentation).
(Les données sont acquises pendant le déroulement de la fonctionnalité.)

### Sortie

L’identifiant unique du document dans le système DMP (entryUUID) (

### Equivalence FHIR

Transaction ITI-67 avec les paramètres patient.identifier, id + statut du dmp et autorisation d'accès à mapper

### Exemple