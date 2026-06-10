# Flux TD02 - Utilisation de PDSm pour le DMP dans le contexte d'EEDS v0.1.0

## Flux TD02

### Description

vérifier l'existence d'un DMP actif (via TD0.2) et les conditions d'accès à ce DMP

Cette fonctionnalité permet, via la transaction TD0.2, de déterminer si le DMP du patient existe et de récupérer les données suivantes (cf. RG_0310) :

* statut du DMP du patient (EF_DMP12_01),
* si le DMP du patient est fermé, date, motif et raison de la fermeture (cf. EF_DMP12),
* statut de l'autorisation d'accès de consultation de l'acteur de santé (EF_DMP04_01),
* statut « médecin traitant DMP » (EF_DMP01_07).

Ces données permettent au LPS de vérifier :

* si le DMP du patient existe et si celui-ci est actif,
* si l'acteur de santé dispose d'une autorisation d'accès valide pour la consultation de ce DMP.

Le LPS gère en local (= hors SI DMP) les conditions d'accès à ce DMP par l'acteur de santé :

* non-opposition du patient à l'alimentation de son DMP,
* consentement du patient à la consultation de son DMP.

En mode d'accès « centre de régulation », le statut de l'autorisation d'accès de l'acteur de santé sur le DMP du patient n'est pas contrôlé par le LPS. NB1 : un professionnel que le patient a bloqué ne peut pas accéder au DMP de ce patient, que ce soit avec ou sans l'autorisation du patient. NB2 : les autorisations d'accès ne sont utilisées que pour la consultation des DMP.

Ensuite, le LPS :

* affiche ne doit pas afficher les traits d'identité provenant du DMP (cf. RG_0320),
* détermine les actions possibles sur le DMP du patient (cf. RG_0330)

### Entrée

L'INS du patient

### Sortie

Le LPS a vérifié les conditions d'accès de l'acteur de santé au DMP du patient :

* INS
* Nom d'usage
* Nom de naissance
* Prénom
* Sexe
* Date de naissance
* Civilité
* Statut du DMP
* Statut du ratachachment 
* "true" : Le DMP est rataché à "Mon espace Santé"
* "false" : le DMP n'est pas ratcahé à "Mon espace Santé"
 
* Date de fermeture
* Motif de fermeture
* Raison de fermeture
* Statut "médecin traitant DMP"

### Equivalent FHIR

Cette transaction n'a pas d'équivalent direct dans le profil MHD / PDSm, qui ne couvre pas la gestion du statut du DMP. Elle s'appuie sur l'API FHIR REST standard, en recherchant le patient par son INS sur l'endpoint `Patient`.

#### Flux TD02-a — Requête

Le LPS effectue une recherche sur la ressource `Patient` en utilisant le paramètre `identifier` valorisé avec l'INS du patient.

```
GET [base]/Patient?identifier=[systeme-INS]|[valeur-INS] HTTP/1.1
Accept: application/fhir+json

```

Le système (OID) à utiliser selon le type d'INS :

| | |
| :--- | :--- |
| INS-NIR | `urn:oid:1.2.250.1.213.1.4.8` |
| INS-NIA | `urn:oid:1.2.250.1.213.1.4.9` |

**Paramètres de la requête :**

| | | | |
| :--- | :--- | :--- | :--- |
| `identifier` | token | 1..1 | INS du patient, sous la forme`[système]\|[valeur]` |

**Exemple :**

```
GET [base]/Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345 HTTP/1.1

```

#### Flux TD02 — Réponse

En cas de succès, le système DMP retourne un code HTTP `200 OK` avec un `Bundle` de type `searchset`.

* Si le `Bundle` contient **0 entrée** : aucun DMP actif n'existe pour ce patient.
* Si le `Bundle` contient **1 entrée** : la ressource `Patient` retournée porte les informations du DMP.

En cas d'erreur, le système retourne un code HTTP d'erreur accompagné d'une ressource `OperationOutcome`.

#### Mapping des données de sortie

Les données retournées par TD02 se mappent sur la ressource `Patient` (profil [fr-core-patient](https://hl7.fr/ig/fhir/core/StructureDefinition-fr-core-patient.html)) comme suit :

| | |
| :--- | :--- |
| INS | `Patient.identifier`(slice`INS-NIR`ou`INS-NIA`) |
| Nom d'usage | `Patient.name`(slice`usualName`) |
| Nom de naissance | `Patient.name`(slice`officialName`) |
| Prénom | `Patient.name.given` |
| Sexe | `Patient.gender` |
| Date de naissance | `Patient.birthDate` |
| Civilité | `Patient.name.prefix` |
| Statut du DMP | Extension à définir sur`Patient`(actif, fermé, inconnu) |
| Statut du rattachement à Mon espace Santé | Extension à définir sur`Patient`(booléen) |
| Date de fermeture du DMP | Extension à définir sur`Patient` |
| Motif de fermeture | Extension à définir sur`Patient` |
| Raison de fermeture | Extension à définir sur`Patient` |
| Statut « médecin traitant DMP » | Extension à définir sur`Patient` |
| Statut de l'autorisation d'accès (EF_DMP04_01) | Hors scope`Patient`— à mapper sur une ressource`Consent`ou`Coverage`(à préciser) |

> **Note :** Les données spécifiques au DMP (statut, rattachement Mon espace Santé, informations de fermeture, médecin traitant DMP) n'ont pas d'élément standard en FHIR R4. Des extensions dédiées devront être définies dans ce guide d'implémentation (voir [Autres ressources](autres_ressources.md)). Le statut de l'autorisation d'accès du professionnel de santé au DMP du patient relève d'une logique de contrôle d'accès qui pourrait être portée par une ressource `Consent` ou `Coverage`, mais ce point reste à préciser.

### Exemple FHIR

**Requête HTTP GET :**

```
GET [base]/Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345 HTTP/1.1
Accept: application/fhir+json

```

**Requête HTTP POST équivalente :**

```
POST [base]/Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345

```

**Réponse :**

```
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 1,
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "meta": {
          "profile": [
            "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
          ]
        },
        "identifier": [
          {
            "use": "official",
            "system": "urn:oid:1.2.250.1.213.1.4.8",
            "value": "123456789012345"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "usual",
            "family": "DUPONT",
            "given": ["Marie"]
          },
          {
            "use": "official",
            "family": "MARTIN",
            "given": ["Marie"]
          }
        ],
        "gender": "female",
        "birthDate": "1985-04-12"
      }
    }
  ]
}

```

