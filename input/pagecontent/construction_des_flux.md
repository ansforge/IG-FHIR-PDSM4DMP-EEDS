### Vue d'ensemble des transactions DMP Patient

Cette page présente une vue synthétique de l'ensemble des transactions permettant à un Logiciel de Professionnel de Santé (LPS) d'interagir avec le Système DMP dans le cadre du volet PDSM4DMP.

Les transactions sont organisées en quatre groupes fonctionnels :

| Groupe | Transactions |
|--------|-------------|
| Vérification d'accès | [TD02](transaction_td02.html) |
| Alimentation | [TD2](transaction_td2.html), [TD2.1](transaction_td2.1.html) |
| Consultation | [TD3.1a](transaction_td3.1a.html), [TD3.1b](transaction_td3.1b.html), [TD3.2](transaction_td3.2.html) |
| Gestion des attributs | [TD3.3a](transaction_td3.3a.html), [TD3.3b](transaction_td3.3b.html), [TD3.3c](transaction_td3.3c.html), [TD3.3d](transaction_td3.3d.html) |

### Diagramme de flux

```mermaid
flowchart TD
    INS(["INS du patient"])

    TD02["<b>TD02</b><br/>Vérifier l'existence du DMP<br/>et les conditions d'accès<br/><i>Patient?identifier</i>"]

    DMP_ACTIF{{"DMP actif\net accès autorisé ?"}}
    FIN(["Fin — accès non autorisé"])

    subgraph ALIM["Alimentation"]
        TD2["<b>TD2</b><br/>Soumettre de nouveaux documents<br/><i>ITI-65</i>"]
        TD21["<b>TD2.1</b><br/>Remplacer un document existant<br/><i>ITI-65 + UpdateDocumentRefs</i>"]
    end

    subgraph RECH["Recherche"]
        TD31a["<b>TD3.1a</b><br/>Lister les documents du DMP<br/><i>ITI-67</i>"]
        TD31b["<b>TD3.1b</b><br/>Rechercher l'identifiant technique<br/><i>ITI-67 (id)</i>"]
    end

    subgraph GEST["Consultation et gestion"]
        TD32["<b>TD3.2</b><br/>Consulter un document<br/><i>DocumentReference + Binary</i>"]
        TD33a["<b>TD3.3a</b><br/>Masquer / démasquer (professionnels)<br/><i>Consentement</i>"]
        TD33b["<b>TD3.3b</b><br/>Visibilité patient<br/><i>Consentement</i>"]
        TD33c["<b>TD3.3c</b><br/>Supprimer un document<br/><i>HTTP DELETE</i>"]
        TD33d["<b>TD3.3d</b><br/>Archiver / désarchiver<br/><i>PATCH DocumentReference</i>"]
    end

    INS --> TD02
    TD02 --> DMP_ACTIF
    DMP_ACTIF -- "Non" --> FIN
    DMP_ACTIF -- "Oui" --> ALIM
    DMP_ACTIF -- "Oui" --> RECH
    TD31a --> GEST
    TD31b --> TD33a
    TD31b --> TD33b
    TD31b --> TD33c
    TD31b --> TD33d
    TD31a --> TD21
    TD31b --> TD21
```

### Tableau récapitulatif

| Transaction | Fonctionnalité | Équivalent FHIR/PDSm |
|-------------|---------------|----------------------|
| [TD02](transaction_td02.html) | Vérifier l'existence d'un DMP actif et les conditions d'accès | Requête `Patient?identifier` |
| [TD2](transaction_td2.html) | Alimenter le DMP avec de nouveaux documents | ITI-65 (push `DocumentReference`) |
| [TD2.1](transaction_td2.1.html) | Remplacer un document existant | ITI-65 avec `UpdateDocumentRefs` |
| [TD3.1a](transaction_td3.1a.html) | Lister les documents du DMP | ITI-67 (`DocumentReference?patient.identifier`) |
| [TD3.1b](transaction_td3.1b.html) | Rechercher l'identifiant technique d'un document | ITI-67 avec paramètre `id` |
| [TD3.2](transaction_td3.2.html) | Consulter un document | `DocumentReference` + `Binary` |
| [TD3.3a](transaction_td3.3a.html) | Masquer / démasquer un document aux professionnels | Mise à jour du consentement |
| [TD3.3b](transaction_td3.3b.html) | Rendre un document visible au patient | Mise à jour du consentement |
| [TD3.3c](transaction_td3.3c.html) | Supprimer un document | HTTP DELETE / mise à jour statut |
| [TD3.3d](transaction_td3.3d.html) | Archiver / désarchiver un document | PATCH `DocumentReference` (statut) |
