
### Description 
vérifier l’existence d’un DMP actif (via TD0.2) et les conditions d'accès à ce DMP

Cette fonctionnalité permet, via la transaction TD0.2, de déterminer si le DMP du patient existe et de récupérer les données suivantes (cf. RG_0310) :
- statut du DMP du patient (EF_DMP12_01),
- si le DMP du patient est fermé, date, motif et raison de la fermeture (cf. EF_DMP12),
- statut de l’autorisation d’accès de consultation de l’acteur de santé (EF_DMP04_01),
- statut « médecin traitant DMP » (EF_DMP01_07).

Ces données permettent au LPS de vérifier :
- si le DMP du patient existe et si celui-ci est actif,
- si l’acteur de santé dispose d’une autorisation d’accès valide pour la consultation de ce DMP.

Le LPS gère en local (= hors SI DMP) les conditions d'accès à ce DMP par l’acteur de santé :
- non-opposition du patient à l’alimentation de son DMP,
- consentement du patient à la consultation de son DMP.

En mode d’accès « centre de régulation », le statut de l’autorisation d’accès de l’acteur de santé sur le DMP du patient n’est pas contrôlé par le LPS.
NB1 : un professionnel que le patient a bloqué ne peut pas accéder au DMP de ce patient, que ce soit avec ou sans l’autorisation du patient.
NB2 : les autorisations d’accès ne sont utilisées que pour la consultation des DMP.

Ensuite, le LPS :

- affiche ne doit pas afficher les traits d’identité provenant du DMP (cf. RG_0320),
- détermine les actions possibles sur le DMP du patient (cf. RG_0330)

### Entrée

L’INS du patient

### Sortie

Le LPS a vérifié les conditions d’accès de l’acteur de santé au DMP du patient :

- INS
- Nom d'usage
- Nom de naissance
- Prénom
- Sexe
- Date de naissance
- Civilité
- Statut du DMP
- Statut du ratachachment
  - "true" : Le DMP est rataché à "Mon espace Santé"
  - "false" : le DMP n'est pas ratcahé à "Mon espace Santé"
- Date de fermeture
- Motif de fermeture
- Raison de fermeture
- Statut "médecin traitant DMP"

### Equivalent FHIR

Pas d'équivalent trouvé côté MHD. L'équivalent consisterait en une requête sur le endpoint Patient avec le SearchParameter identifier.
Mapping des infos DMP (statut, rattachement, infos de fermetures) à rajouter : extension patient ? Ressource Coverage ?

### Exemple

