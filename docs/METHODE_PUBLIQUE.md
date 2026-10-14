# Méthode publique de développement expérimental orchestré par IA

## Objectif et frontière de publication

Ce document décrit les **principes observables et transférables** du workflow. Il ne divulgue ni prompts internes intégraux, ni arbitrages confidentiels, ni secrets opérationnels. Les éléments nécessaires à la **reproduction des mesures revendiquées** — source exacte, tests, outils, données et règles de calcul — restent indispensables.

## Cycle public

### P0 — Stabiliser l'outillage

Référencer chaque source, environnement, compilateur, machine, cible et script ; vérifier le fonctionnement de la chaîne de déploiement ; définir des tests de santé et des critères de démarrage/arrêt. Séparer laboratoire expérimental et version de produit ; ne pas publier de secrets SSH ni de fichiers `.env`.

**Livrables :** manifeste d'environnement, version de source, inventaire des campagnes, logs de préflight.

### P1 — Créer la bibliothèque de patterns

Demander à l'IA d'explorer des stratégies techniques candidates, puis formaliser chaque pattern avec son **hypothèse de performance**, ses conditions d'application, ses coûts attendus et ses risques de correction. La proposition initiale d'un modèle n'est pas une preuve : vérifier les références et rattacher chaque choix à un test qui peut échouer.

**Livrables :** catalogue numéroté, flags, descriptions, chemins d'implémentation et mécanismes de repli.

### P2 — Construire des configurations testables

Composer des patterns en plans expérimentaux. Un plan doit correspondre à des flags et du code déterministes, et se comparer à un **témoin officiel** compilé séparément. Conserver les contrôles historiques, même lorsqu'un candidat devient favori.

**Livrables :** matrice de plans, scripts/manifestes immuables, hypothèses fixées avant mesure.

### P3 — Exploration large

Utiliser des corpus hétérogènes, des tailles, des encodages et des formes JSON variés pour détecter les signaux : régions de gain, régimes de régression, seuils suspects, erreurs de compilation, écarts entre Stage 1, Stage 2 et DOM. Aucun « meilleur plan » général ne découle d'un extrême observé après coup.

**Livrables :** mesures brutes, rapports par famille, anomalies, échecs et questions de confirmation.

### P4 — Analyse assistée et mémoire expérimentale

Faire produire des rapports interprétatifs par l'IA **à partir des mesures enregistrées**. Séparer les calculs reproductibles des explications supposées. Vérifier les extraits, nombres et équivalences de corpus contre les fichiers sources. Conserver les résultats négatifs : ils réduisent les hypothèses naïves.

**Livrables :** synthèses humaines, tableaux complets, registre d'erreurs, journal des décisions.

### P5 — Confirmation indépendante et révision

Retester les hypothèses prometteuses sur des corpus tenus à l'écart, si possible un autre matériel/compilateur, et avec les mêmes garde-fous de conformité. Réviser les patterns puis recommencer une nouvelle boucle d'exploration avec des identifiants de campagne distincts.

**Livrables :** protocole préenregistré, résultats de confirmation, reproductibilité, comparaison au témoin.

## Qui fait quoi ?

| Acteur | Fonctions caractéristiques | Contrôle nécessaire |
|---|---|---|
| Opérateur humain | Objectifs, contraintes, priorités, approbations, interprétation | Comprendre ce que les mesures permettent de conclure |
| IA générative | Proposer du code, des patterns, des tests, des rapports | Contrôle de versions, compilation, critique des affirmations |
| Orchestrateur logiciel | Appliquer des plans prédéfinis, exécuter, conserver les sorties | Limites de ressources, journaux, arrêt en cas d'échec |
| Banc natif | Mesurer les effets matériels observables | Référence distincte, répétitions, mesures appariées |
| Lecteur indépendant | Recalculer, contester, répliquer | Artefacts suffisants et contradictions accessibles |

## Ce que VLA-MethodLab fait — et ne fait pas — dans l'état documenté

- Bibliothèque fixe **E00–E14** de plans d'optimisation effectivement définie.
- Campagnes natives GCC et rapports documentés.
- Sélection de plans et classification bornée **au sein d'un backend** selon l'intégration décrite dans les sources ; profils A1/A2 comme configurations de compilation distinctes.
- **Pas de recherche évolutionnaire autonome permanente** démontrée par les mesures citées.
- **Pas de commutation dynamique entre les binaires séparément compilés** lors des campagnes comparatives.
- **Pas d'optimisation des politiques fondée automatiquement sur les benchmarks** par le simple fait de générer des rapports.

## Diligence scientifique

L'usage de l'IA doit être déclaré selon les exigences de la revue ciblée. Ne pas attribuer à une IA des droits d'auteur scientifiques ni revendiquer une preuve expérimentale pour un mécanisme resté privé. Les données de référence et les limites comptent davantage que le récit d'une réussite.
