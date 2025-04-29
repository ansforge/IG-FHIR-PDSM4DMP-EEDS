
### Description 
Alimenter le DMP d’un patient avec de nouveaux documents


Cette fonctionnalité permet d’alimenter le DMP d’un patient avec un ou plusieurs
nouveaux documents :
- décrits sous la forme de documents CDA et de métadonnées XDS,
- et transmis au système DMP sous la forme d’un lot de soumission XDS signé (XAdES).
La cinématique générale est la suivante.
Le professionnel constitue le ou les document(s) dans le LPS . Cf. §3.4.1.1.1
Le LPS :
- construit le ou les document(s)
  - construit le document au format CDA Cf. §3.4.1.1.2
  - alimente les métadonnées XDS Cf. §3.4.1.1.3
- réalise la signature du ou des document(s) (non obligatoire) Cf. §3.4.1.1.4
- constitue un lot de soumission XDS et signe ce lot (XAdES) Cf. §3.4.1.1.5
- soumet le lot de documents au système DMP Cf. §3.4.1.1.6


### Entrée et prérequis
L’INS du patient 
Le statut « actif » du DMP du patient (EF_DMP12_01).
Lot de soumission
### Sortie
Un DMP alimenté avec un ou plusieurs nouveaux documents.
### Exemple