# Flux TD02 - Valider l'existence et l'état du DMP - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Flux TD02 - Valider l'existence et l'état du DMP

 
There is no translation page available for the current page, so it has been rendered in the default language 

### Description - vérifier l'existence d'un DMP actif (via TD0.2) et les conditions d'accès à ce DMP

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
* Statut du rattachement 
* "true" : Le DMP est rattaché à "Mon espace Santé"
* "false" : le DMP n'est pas rattaché à "Mon espace Santé"
 
* Date de fermeture
* Motif de fermeture
* Raison de fermeture
* Statut "médecin traitant DMP"

### Equivalent FHIR

Cette transaction n'a pas d'équivalent direct dans le profil MHD / PDSm, qui ne couvre pas la gestion du statut du DMP. Elle s'appuie sur l'API FHIR REST standard, en recherchant le patient par son INS sur l'endpoint `Patient`.

#### Flux TD02 — Requête

Le LPS effectue une recherche sur la ressource `Patient` en utilisant le paramètre `identifier` valorisé avec l'INS du patient.

Le système (OID) à utiliser selon le type d'INS :

| | |
| :--- | :--- |
| INS-NIR | `urn:oid:1.2.250.1.213.1.4.8` |
| INS-NIA | `urn:oid:1.2.250.1.213.1.4.9` |

**Paramètres de la requête :**

| | | | |
| :--- | :--- | :--- | :--- |
| `identifier` | token | 1..1 | INS du patient, sous la forme`[système]\|[valeur]` |

#### Flux TD02 — Réponse

En cas de succès, le système DMP retourne un code HTTP `200 OK` avec un `Bundle` de type `searchset`.

* Si le `Bundle` contient **0 entrée** : aucun DMP n'existe pour ce patient.
* Si le `Bundle` contient **1 entrée** : la ressource `Patient` retournée porte les informations du DMP.

En cas d'erreur, le système retourne un code HTTP d'erreur accompagné d'une ressource `OperationOutcome`.

#### Mapping des données de sortie

Le statut du DMP est porté par l'élément natif `Patient.active` (`true` = DMP ouvert, `false` = DMP fermé ou inconnu). Les informations de fermeture sont regroupées dans une seule extension complexe sur `Patient`, ce qui évite de multiplier les extensions atomiques.

| | |
| :--- | :--- |
| INS | `Patient.identifier`(slice`INS-NIR`ou`INS-NIA`) |
| Nom d'usage | `Patient.name`(slice`usualName`) |
| Nom de naissance | `Patient.name`(slice`officialName`) |
| Prénom | `Patient.name.given` |
| Sexe | `Patient.gender` |
| Date de naissance | `Patient.birthDate` |
| Civilité | `Patient.name.prefix` |
| Statut du DMP | `Patient.active`(`true`= actif,`false`= fermé/inconnu) |
| Date de fermeture du DMP | Extension complexe`dmp-fermeture`>`dateFermeture` |
| Motif de fermeture | Extension complexe`dmp-fermeture`>`motifFermeture` |
| Raison de fermeture | Extension complexe`dmp-fermeture`>`raisonFermeture` |
| Statut du rattachement à Mon espace Santé | Extension`dmp-rattachement-mes`sur`Patient`(booléen) |
| Statut « médecin traitant DMP » | Extension`dmp-medecin-traitant`sur`Patient` |
| Statut de l'autorisation d'accès (EF_DMP04_01) | Hors scope — à mapper sur une ressource`Consent`(à préciser) |

**📝 Note — Alternative de modélisation**

Une alternative à l'utilisation de
`Patient.active`consisterait à matérialiser l'ouverture du DMP par une ressource dédiée —
`Consent`(consentement du patient à l'existence de son DMP) ou
`Flag`(signalement administratif avec statut et période natifs). Ces approches offrent un cycle de vie plus explicite mais introduisent une ressource supplémentaire à gérer.

### Exemple FHIR

**Requête HTTP GET :**

```
GET [base]/Patient?identifier=urn:oid:1.2.250.1.213.1.4.8|123456789012345 HTTP/1.1
Accept: application/fhir+json

```

**Réponse (DMP fermé) :**

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
          "profile": ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"]
        },
        "extension": [
          {
            "url": "https://interop.esante.gouv.fr/ig/fhir/dmp/StructureDefinition/dmp-fermeture",
            "extension": [
              {
                "url": "dateFermeture",
                "valueDate": "2024-03-20"
              },
              {
                "url": "motifFermeture",
                "valueCodeableConcept": {
                  "coding": [{ "system": "https://interop.esante.gouv.fr/ig/fhir/dmp/CodeSystem/dmp-motif-fermeture", "code": "patient-demande" }]
                }
              },
              {
                "url": "raisonFermeture",
                "valueString": "Demande explicite du patient"
              }
            ]
          },
          {
            "url": "https://interop.esante.gouv.fr/ig/fhir/dmp/StructureDefinition/dmp-rattachement-mes",
            "valueBoolean": true
          }
        ],
        "identifier": [
          {
            "use": "official",
            "system": "urn:oid:1.2.250.1.213.1.4.8",
            "value": "123456789012345"
          }
        ],
        "active": false,
        "name": [
          { "use": "usual", "family": "DUPONT", "given": ["Marie"] },
          { "use": "official", "family": "MARTIN", "given": ["Marie"] }
        ],
        "gender": "female",
        "birthDate": "1985-04-12"
      }
    }
  ]
}

```

