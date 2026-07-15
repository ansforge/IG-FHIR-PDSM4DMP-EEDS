
### Vue d'ensemble des transactions Document

<div style="background-color: #fff9e6; border-left: 4px solid #ff9800; padding: 10px; margin: 10px 0;">
<b>🔶 Vue d'ensemble</b><br/>
Cette page synthétise, pour chaque transaction du groupe « Document », l'action réalisée et un exemple de requête FHIR correspondante. Pour le détail complet (paramètres, mapping XDS/FHIR, réponses, exemples complets), se reporter à la page de chaque transaction.
</div>

| TD | Action | Exemple de requête FHIR |
|----|--------|--------------------------|
| [TD2](transaction_td2.html) | Soumettre nouveaux documents | `POST [base]/DocumentReference` |
| [TD2.1](transaction_td2.1.html) | Remplacer un document | `POST [base]` *(Bundle transaction)* |
| [TD3.1a](transaction_td3.1a.html) | Lister les documents | `GET [base]/DocumentReference?patient.identifier=[ins]&status=current` |
| [TD3.1b](transaction_td3.1b.html) | Rechercher identifiant technique | `GET [base]/DocumentReference?patient.identifier=[ins]&identifier=[uniqueId]` |
| [TD3.2](transaction_td3.2.html) | Consulter un document | `GET [DocumentReference.content.attachment.url]` |
| [TD3.3a](transaction_td3.3a.html) 🐉 | Masquer aux professionnels | `PATCH [base]/DocumentReference?identifier=[uniqueId]` *(securityLabel → MASQUE_PS)* |
| [TD3.3b](transaction_td3.3b.html) 🐉 | Gérer visibilité patient | `PATCH [base]/DocumentReference?identifier=[uniqueId]` *(securityLabel → INVISIBLE_PATIENT)* |
| [TD3.3c](transaction_td3.3c.html) 🐉 | Supprimer un document | `PATCH [base]/DocumentReference?identifier=[uniqueId]` *(status → entered-in-error)* |
| [TD3.3d](transaction_td3.3d.html) | Archiver un document | `PATCH [base]/DocumentReference?identifier=[uniqueId]` *(extension isArchived → true)* |

🐉 *Point encore ouvert sur cette transaction — voir la note dragon en bas de sa page dédiée pour le détail.*
