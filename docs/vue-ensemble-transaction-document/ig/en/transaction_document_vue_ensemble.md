# Vue d'ensemble des transactions Document - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Vue d'ensemble des transactions Document

 
There is no translation page available for the current page, so it has been rendered in the default language 

### Vue d'ensemble des transactions Document

**🔶 Vue d'ensemble**

Cette page synthétise, pour chaque transaction du groupe « Document », l'action réalisée et un exemple de requête FHIR correspondante. Pour le détail complet (paramètres, mapping XDS/FHIR, réponses, exemples complets), se reporter à la page de chaque transaction.

| | | |
| :--- | :--- | :--- |
| [TD2](transaction_td2.md) | Soumettre nouveaux documents | `POST [base]/DocumentReference` |
| [TD2.1](transaction_td2.1.md) | Remplacer un document | `POST [base]`**(Bundle transaction)** |
| [TD3.1a](transaction_td3.1a.md) | Lister les documents | `GET [base]/DocumentReference?patient.identifier=[ins]&status=current` |
| [TD3.1b](transaction_td3.1b.md) | Rechercher identifiant technique | `GET [base]/DocumentReference?patient.identifier=[ins]&identifier=[uniqueId]` |
| [TD3.2](transaction_td3.2.md) | Consulter un document | `GET [DocumentReference.content.attachment.url]` |
| [TD3.3a](transaction_td3.3a.md)🐉 | Masquer aux professionnels | `PATCH [base]/DocumentReference?identifier=[uniqueId]`**(securityLabel → MASQUE_PS)** |
| [TD3.3b](transaction_td3.3b.md)🐉 | Gérer visibilité patient | `PATCH [base]/DocumentReference?identifier=[uniqueId]`**(securityLabel → INVISIBLE_PATIENT)** |
| [TD3.3c](transaction_td3.3c.md)🐉 | Supprimer un document | `PATCH [base]/DocumentReference?identifier=[uniqueId]`**(status → entered-in-error)** |
| [TD3.3d](transaction_td3.3d.md) | Archiver un document | `PATCH [base]/DocumentReference?identifier=[uniqueId]`**(extension isArchived → true)** |

🐉 **Point encore ouvert sur cette transaction — voir la note dragon en bas de sa page dédiée pour le détail.**

