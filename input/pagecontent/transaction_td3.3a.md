
### Description 

masquer / démasquer un document aux professionnels

Cette fonctionnalité permet à l’utilisateur de modifier les attributs d’un document dans le DMP d’un patient.

- Masquage / démasquage d’un document aux professionnels,
Elle fait suite à la fonctionnalité DMP_3.1 qui a permis de rechercher l’identifiant technique d’un document.

La cinématique générale est la suivante.

- Le LPS affiche les attributs du document sélectionné. Cf. RG_3310.
- L’utilisateur indique l’action qu’il souhaite effectuer. Cf. RG_3320.
- L’utilisateur confirme l’action demandée. Cf. RG_3330.
- Le LPS envoie une requête de mise à jour des attri

### Entrée et prérequis

L’INS du patient (EF_DMP11_01).
Le statut « actif » du DMP du patient (EF_DMP12_01).
L’autorisation d’accès au DMP du patient (EF_DMP04_01) au statut « valide » (sauf si le
LPS implémente le profil Alimentation).
L’identifiant du document dans le système DMP issu de DMP_3.1 : entry

### Sortie

Les attributs du document sont modifiées dans le DMP du patient.

### Equivalence FHIR

Mise à jour de la ressource indiquant le consentement

### Exemple