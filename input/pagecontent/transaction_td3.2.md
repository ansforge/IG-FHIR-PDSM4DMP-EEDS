
### Description 
consulter des documents dans le DMP d’un patient

Cette fonctionnalité permet à l’utilisateur de télécharger et visualiser le contenu d’un document du DMP d’un patient.

Elle fait suite à la fonctionnalité « lister les documents d’un DMP » (DMP_3.1a) qui a permis à l’utilisateur de rechercher des documents dans le DMP d’un patient.

La cinématique générale est la suivante.

- L’utilisateur a sélectionné un ou plusieurs document(s) à consulter parmi les résultats retournés dans la fonctionnalité DMP_3.1a.
- Le LPS envoie une requête de demande de document au système DMP (TD3.2) à partir du ou des identifiants de document sélectionné(s). Cf. RG_3210.
- Le système DMP retourne le(s) document(s) au LPS.
- Le LPS affiche le(s) document(s). Cf. RG_3220.

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide ».
La liste des identifiants (uniqueId) des documents à consulter (issue de DMP_3.1a)
(EF_DMP31_01).

### Sortie

Les documents affichés par le LPS.

### Equivalence FHIR

Le DocumentReference contient un Binary permettant d'accéder au document pdf, CDA, ou FHIR

### Exemple