
### Description 
supprimer un document (

Cette fonctionnalité permet à l’utilisateur de supprimer un document dans le DMP d’unpatient.

La cinématique générale est la suivante :

- L’utilisateur indique qu’il souhaite supprimer le document sélectionné. Cf. RG_3410.
- L’utilisateur confirme l’action demandée. Cf. RG_3420.
- Le LPS envoie une requête de mise à jour des attributs d’un document au système DMP (TD3.3c). Cf. RG_3430.

NB1 : si le LPS implémente le profil Alimentation, il n’est pas nécessaire d’avoir une autorisation d’accès pour supprimer des documents dans le DMP d’un patient.
NB2 : pour information, seul l’auteur du document peut supprimer le document (contrôle effectué par le système DMP, cf. [DMP-MDRF]).

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le
LPS implémente le profil Alimentation).
L’identifiant du document dans le système DMP issu de DMP_3.1 (EF_DMP31_02).

### Sortie

Le document est supprimé.

### Equivalence FHIR

Requête HTTP DELETE ou mise à jour de la ressource avec changement de statut ?

### Exemple