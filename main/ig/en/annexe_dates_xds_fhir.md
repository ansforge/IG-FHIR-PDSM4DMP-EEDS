# Comparatif des dates XDS / FHIR - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Comparatif des dates XDS / FHIR

 
There is no translation page available for the current page, so it has been rendered in the default language 

Le modèle XDS distingue plusieurs dates portant des sémantiques précises. Leur transposition en FHIR/MHD nécessite de bien comprendre à quoi correspond chaque élément.

### DocumentEntry / DocumentReference

| | | | |
| :--- | :--- | :--- | :--- |
| `creationTime` | DTM | Date et heure de**création du document**par le producteur. | `DocumentReference.date` |
| `serviceStartTime` | DTM | Date de début de**l'acte de référence**documenté. | `DocumentReference.context.period.start` |
| `serviceEndTime` | DTM | Date de fin de l'acte de référence (optionnelle). | `DocumentReference.context.period.end` |
| `submissionTime` | DTM | Date de soumission du lot au registre. Portée par le SubmissionSet, pas la fiche. | `List.date`(sur le SubmissionSet) |
| — | — | Date de dernière mise à jour de la ressource sur le serveur FHIR. | `DocumentReference.meta.lastUpdated` |
| `content.attachment.creation` | — | Date de création du contenu du document (extension MHD). | `DocumentReference.content.attachment.creation` |

> **Attention :** `DocumentReference.date` correspond à `creationTime` (date de création du document par le producteur), **pas** à la date de soumission au registre. La date de soumission est portée par `List.date` sur le SubmissionSet.

> **Note :** `DocumentReference.meta.lastUpdated` n'a pas d'équivalent XDS — c'est une métadonnée propre au serveur FHIR, mise à jour à chaque modification de la ressource (ex. : changement de statut lors d'un remplacement de document).

### SubmissionSet / List (SubmissionSet PDSm)

| | | | |
| :--- | :--- | :--- | :--- |
| `submissionTime` | DTM | Date et heure de soumission du lot au registre DMP. | `List.date` |

### Récapitulatif visuel

```
Cycle de vie d'un document dans le DMP
───────────────────────────────────────────────────────────────────

  Acte médical                 Création du document       Soumission au DMP
       │                              │                          │
       ▼                              ▼                          ▼
 serviceStartTime              creationTime               submissionTime
 context.period.start          DocumentReference.date     List.date
 (serviceEndTime)
 context.period.end

                                                    Mise à jour ultérieure
                                                           │
                                                           ▼
                                                    meta.lastUpdated

```

### Points d'attention pour l'implémentation

* **`creationTime` ≠ `submissionTime`** : un document peut être créé (signé) plusieurs jours avant d'être soumis au DMP. Le LPS doit renseigner `DocumentReference.date` avec la date de création réelle du document, pas la date d'envoi.
* **`serviceStartTime` obligatoire** : `DocumentReference.context.period.start` est requis par le profil PDSm. Il correspond à la date de l'acte médical — date de consultation, date de l'examen, etc.
* **`meta.lastUpdated`** est géré par le serveur FHIR DMP ; le LPS ne le renseigne pas à la soumission.
* **`content.attachment.creation`** (extension MHD) permet de préciser la date de création du contenu binaire du document si elle diffère de `DocumentReference.date`.

