<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; width: 65%">
<b>Brief description of this Implementation Guide</b><br>
This Implementation Guide describes how to use PDSm (FHIR-based Mobile access to Health Documents) for the French shared medical record (DMP - Dossier Médical Partagé) in the context of EEDS (European Health Data Space / Espace Européen des Données de Santé).
</p>

{% if site.data.info.releaselabel == 'ci-build' %}
<div style="width: 65%">
    <blockquote class="stu-note">
    <p>Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : https://interop.esante.gouv.fr/ig/fhir/pdsm4dmp</p>
    </blockquote>
</div>
{% endif %}

### Introduction

Ce guide d'implémentation décrit l'utilisation du profil [PDSm (Partage de Documents de Santé en mobilité)](https://interop.esante.gouv.fr/ig/fhir/pdsm/) pour les échanges avec le Dossier Médical Partagé (DMP) dans le contexte de l'Espace Européen des Données de Santé (EEDS).

Le DMP est le carnet de santé numérique de chaque Français. Il permet aux professionnels de santé d'accéder aux documents médicaux d'un patient (comptes rendus, ordonnances, imagerie, etc.) et d'y contribuer, sous réserve du consentement du patient.

PDSm est le profil FHIR français basé sur [IHE MHD (Mobile access to Health Documents)](https://profiles.ihe.net/ITI/MHD/index.html). Il définit les transactions FHIR permettant de soumettre, rechercher et consulter des documents de santé. Ce guide précise comment ces transactions s'appliquent au contexte DMP, et documente les extensions nécessaires pour les données spécifiques au DMP qui n'ont pas d'équivalent dans MHD.

Les principales sections de ce guide sont :

* **Transactions DMP Patient et Document** : détail de chaque transaction (TD02, TD2, TD2.1, TD3.1a, TD3.1b, TD3.2, TD3.3a–d) avec leur équivalent FHIR
* **[Exemples d'usages DMP](exemples_usage_dmp.html)** : cinématiques concrètes illustrant des cas d'usage réels (ex. notification de documents tiers)
* **[Ressources de conformité](artifacts.html)** : profils, modèles logiques, mappings et exemples FHIR

### Vue d'ensemble des transactions

Les transactions sont organisées en quatre groupes fonctionnels :

| Groupe | Transactions |
|--------|-------------|
| Vérification d'accès | [TD02](transaction_td02.html) |
| Alimentation | [TD2](transaction_td2.html), [TD2.1](transaction_td2.1.html) |
| Consultation | [TD3.1a](transaction_td3.1a.html), [TD3.1b](transaction_td3.1b.html), [TD3.2](transaction_td3.2.html) |
| Gestion des attributs | [TD3.3a](transaction_td3.3a.html), [TD3.3b](transaction_td3.3b.html), [TD3.3c](transaction_td3.3c.html), [TD3.3d](transaction_td3.3d.html) |

```mermaid
flowchart TD
    INS(["INS du patient"])
    TD02["TD02 - Vérifier existence DMP et conditions accès"]
    DMP_ACTIF{"DMP actif et accès autorisé ?"}
    FIN(["Fin - accès refusé"])

    subgraph ALIM["Alimentation"]
        TD2["TD2 - Soumettre de nouveaux documents - ITI-65"]
        TD21["TD2.1 - Remplacer un document - ITI-65 + UpdateDocumentRefs"]
    end

    subgraph RECH["Recherche"]
        TD31a["TD3.1a - Lister les documents du DMP - ITI-67"]
        TD31b["TD3.1b - Rechercher identifiant technique - ITI-67"]
    end

    subgraph GEST["Consultation et gestion"]
        TD32["TD3.2 - Consulter un document - DocumentReference + Binary"]
        TD33a["TD3.3a - Masquer / démasquer professionnels"]
        TD33b["TD3.3b - Visibilité patient"]
        TD33c["TD3.3c - Supprimer un document - HTTP DELETE"]
        TD33d["TD3.3d - Archiver / désarchiver - PATCH DocumentReference"]
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

### Périmètre

Ce guide couvre les transactions DMP réalisées par un Logiciel de Professionnel de Santé (LPS) dans le cadre du volet CI-SIS « Partage de Documents de Santé ». Il s'appuie sur le profil PDSm et le guide HL7 FHIR France (fr-core) pour le traitement de l'identité patient (INS).

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

### Dépendances

{% include dependency-table.xhtml %}

### Propriété intellectuelle

{% include ip-statements.xhtml %}
