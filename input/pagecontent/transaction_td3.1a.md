
### Description 
Cette fonctionnalité permet de lister les documents du DMP d’un patient (cf. RG_3010) en
indiquant des critères de recherche.
La cinématique générale est la suivante.
- L’utilisateur saisit un ou plusieurs critères de recherche dans le LPS. Cf. RG_3020.
- Le LPS appelle la transaction TD3.1. Cf. RG_3030.
- Le système DMP retourne les résultats au LPS.
- Le LPS affiche les résultats. Cf. RG_3040.
- L’utilisateur sélectionne un ou plusieurs document(s) et le LPS acquiert l’identifiant
unique des document(s) sélectionnés. Cf. RG_3050.
- Le LPS détermine les actions possibles sur les documents sélectionnés. Cf. RG_3060.
  - consulter un document (DMP_3.2),
  -  modifier les attributs d’un document (DMP_3.3),
  - ou remplacer un document (DMP_2.1b/2.2b).



### Entrée et prérequis
L’INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide ».
### Sortie
La liste des documents consultables par l’utilisateur.
### Exemple