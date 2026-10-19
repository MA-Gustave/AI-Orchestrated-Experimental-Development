# Registre des preuves, des hypothèses et des lacunes

**Base consultée :** fichiers joints au dialogue (notamment archive du Lab, `docs/METHODOLOGY.md`, `docs/results/2026-10-11-stage-profile-8h.md`, `docs/evidence/analysis.md`, `docs/TEST89_CORRECTED_PREQUAL_60M.md`, `docs/TEST90_HOLDOUT_2H.md`, bibliothèque E00–E14), complétés par les dépôts publics. Les pièces désignent un état daté ; une branche GitHub vivante peut évoluer après l'écriture de ce registre.

| ID | Affirmation | Statut | Source principale | Limites |
|---|---|---|---|---|
| F01 | 15 plans E00–E14 préétablis | **Documenté** | `VLA-MethodLab/experiments/PATTERN_LIBRARY.md` et `patterns.json` | Plans fixes ; pas d'évolution autonome prouvée |
| F02 | 3 h : 2 469 observations, E14 DOM 1,473× | **Rapport de campagne** | `docs/evidence/analysis.md` | Corpus limités, ordre fixe, corrections smoke |
| F03 | 8 h : 6 887 observations, E14 DOM 1,502×, Stage 1 1,601×, Stage 2 1,298× | **Rapport de campagne** | `docs/results/2026-10-11-stage-profile-8h.md` | Même machine, phases mesurées indépendamment |
| F04 | E14 Stage 1 0,417× sur échappements | **Rapport de campagne** | Même rapport, section « families » | Fait interne distinct du résultat DOM |
| F05 | Smoke 169 valides / 24 invalides par candidat dans la campagne 8 h | **Rapport de campagne** | Même rapport, section validation | Ne prouve pas la conformité générale |
| F06 | Code mesuré issu d'une copie de travail modifiée | **Lacune reconnue** | Même rapport, méthodologie | SHA amont insuffisant pour reconstruction exacte |
| F07 | Test 88 : zéro observation de performance après erreur d'itérations | **Échec documenté** | `docs/TEST89_CORRECTED_PREQUAL_60M.md` | Ne pas convertir en succès ou en gain |
| F08 | Tests 89/90 : protocoles initiaux de confirmation | **Statut historique de la version initiale du dossier** | `docs/TEST89...`, `docs/TEST90...` | Ne pas le substituer aux mesures finales du Test 106 |
| F09 | Extension « dual machine » historique | **Outillage décrit** | Documentation historique de l'extension | L'outillage seul ne prouvait pas l'exécution ; le Test 106 atteste ensuite deux hôtes natifs différents |
| H01 | L'orchestration IA rend l'exploration plus accessible | **Hypothèse / étude qualitative** | Déclaration de méthode de l'auteur | Pas de groupe témoin ni d'attribution causale |
| H02 | Le profil du document permet un meilleur moteur | **Motivation empirique** | Différences par famille F03-F04 et Rice (1976) | Gain total non calculé ; coût de sélection inconnu |
| H03 | Une métadonnée externe réduit le coût de classement | **Proposition non testée** | `HYPOTHESE_METADATA_JSON.md` | Production/transport/validation pourraient annuler le gain |
| I01 | Aristote annonce les abstractions informatiques | **À ne pas affirmer** | Métaphysique IX ; SEP | Analogie, non prévision historique |
| I02 | L'IA rend l'expertise de codage caduque | **À ne pas affirmer** | Aucun résultat ne le démontre | Nécessité de validation et de maintenance |

## Résultats natifs finaux — nouvelle strate de preuve (18 octobre 2026)

| ID | Affirmation | Statut | Pièce | Limite majeure |
|---|---|---|---|---|
| F10 | Test 106 stable vs fallback officiel v5.0.4 sur 18 JSON publics : **1,6007× Cloud-V / 1,8946× EPCC** DOM | **Mesures natives terminées, résumé CSV recalculé localement** | [Table de 18 fichiers](../evidence/TEST106_Public_18JSON_PerDocument_Results_EN.csv) ; [rapport](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/TEST106_PUBLICATION_REPORT_EN.md) | Référence fallback v5.0.4 ; différente du VLS256 v5.0.3 historique. ZIP bruts d'origine non joints |
| F11 | **167 835 mesures**, 92 435 et 75 400, toutes strates/variantes | **Rapport natif** | [Test 106](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/releases/test106/TEST106_VectorPath_RVV_Final_Native_Performance_Report_EN.md) | Les lignes répétées ne sont pas des charges indépendantes |
| F12 | Stable/A2 **1,00001× / 0,99959×**, seuils de non-régression atteints ; ELF identiques par hôte | **Qualification native rapportée ; cinq SHA-256 C++ vérifiés** | [Manifeste gelé](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/FROZEN_SOURCE_MANIFEST.json) | Aucune preuve d'un tag Git et pas de reconstruction rétroactive du checkout historique |
| F13 | **340/340 JSONTestSuite par machine sans divergence signalée** et régression sur **95 très petits JSON : 0,6665× / 0,8497×** | **Résultat conformance/performance** | [Rapport Test 106](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/TEST106_PUBLICATION_REPORT_EN.md) | Couverture finie, pas de certification mémoire RVV |
| F14 | Variante NL4 rejetée par seuil Cloud-V (~0,9797× sur twitterescaped) | **Échec expérimental documenté** | [CSV dérivé](../evidence/TEST106_Public_18JSON_PerDocument_Results_EN.csv) | Bénéfices synthétiques non généralisables |
| F15 | Audit historique Test 107 : **ENGINE PASS**, mais **`HOLD_CI_AND_RELEASE_SIGNOFF`** | **Audit archivé** | [Test 107](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/releases/test107/TEST107_FORMAL_RELEASE_AUDIT_EN.md) | La CI #78 ultérieure ne change pas son statut d'origine |
| F16 | CI #78 réussie sur dépôt lié x86/default | **Preuve de CI distincte** | [CI #78](https://github.com/MA-Gustave/Simdjson-rvv-vla/actions/runs/39155386567) | Pas d'identité garantie avec les sources gelées, ni Valgrind RVV natif |

**Contrôles locaux de cette mise à jour :** SHA-256 du CSV dérivé et moyenne géométrique des 18 fichiers ; cinq empreintes de code C++ comparées au manifeste. Les deux archives originales natives Cloud-V/EPCC, le contenu complet des artefacts CI et tout tag Git final **n'ont pas été vérifiés ici**. Voir le [dossier final](RESULTATS_NATIFS_FINAUX_2026-10-18.md).

## Références source (relatives aux dépôts réels)

- [Rapport 8 h](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/results/2026-10-11-stage-profile-8h.md)
- [Rapport d'analyse 3 h](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/evidence/analysis.md)
- [Patterns](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/experiments/PATTERN_LIBRARY.md)
- [Méthodologie](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/METHODOLOGY.md)
- [Test 89 / correction de Test 88](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/TEST89_CORRECTED_PREQUAL_60M.md)
- [Test 90 / holdout](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/TEST90_HOLDOUT_2H.md)

## Vérifications à effectuer avant la publication d'un article évalué

- Joindre SHA256 et source exacte de la campagne ; identifier les éventuelles versions concurrentes.
- Exécuter scripts de recomputation et consigner leurs sorties datées.
- Vérifier licences, attribution des portions amont et journal du protocole.
- Ajouter validation de conformité/fuzzing et contrôle d'un second matériel si revendication générale.
- Publier les résultats bruts positifs **et** négatifs, y compris mesures manquantes et causes d'échec.
- Préciser comment l'auteur a utilisé l'IA, sans divulguer de secrets non essentiels, et respecter les règles de la revue.

## Politique IA, droits et confidentialité

La [politique simdjson](https://github.com/simdjson/simdjson/blob/master/AI_USAGE_POLICY.md) autorise des contributions assistées par IA sous responsabilité humaine ; elle n’est pas une interdiction absolue. Les réserves de droits sur les ajouts originaux demeurent conditionnelles à leur provenance et aux permissions antérieures. Le développement envisagé dans un écosystème sémantique élargi est une **orientation confidentielle annoncée par l’auteur**, non un résultat expérimental. Détails : [gouvernance](GOUVERNANCE_INDEPENDANTE_ET_PERSPECTIVES.md).
