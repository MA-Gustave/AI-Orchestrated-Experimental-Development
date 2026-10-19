# VLA-MethodLab : étude de cas documentée

## Projets de référence

- Laboratoire : https://github.com/MA-Gustave/VLA-MethodLab
- Backend expérimental : https://github.com/MA-Gustave/VectorPath-RVV
- Bibliothèque de plans : https://github.com/MA-Gustave/VLA-MethodLab/blob/main/experiments/PATTERN_LIBRARY.md
- Rapport natif du 11 octobre : https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/results/2026-10-11-stage-profile-8h.md
- Méthodologie : https://github.com/MA-Gustave/VLA-MethodLab/blob/main/docs/METHODOLOGY.md
- [Résultats natifs finaux Test 106/107](RESULTATS_NATIFS_FINAUX_2026-10-18.md)

## Fonction du cas dans l'article

Le laboratoire est présenté comme **un exemple instrumenté de développement expérimental dirigé avec une forte assistance de l'IA**, et non comme la preuve qu'une personne sans compétences de codage peut toujours surpasser des spécialistes. Le récit de la méthode repose sur les explications de l'opérateur et sur les traces publiques ; il n'est pas encore comparé à des groupes témoins.

## Validation native finale distincte — 18 octobre 2026

Le **Test 106 achevé** évalue le candidat **VectorPath-RVV A2 stable**, avec **A2 / 16 Kio / packed désactivé / Stage 2 original**, sur deux hôtes RISC-V (Cloud-V et EPCC). La comparaison de confirmation sur **18 fichiers JSON publics** donne **1,6007× (+60,07 %) Cloud-V** et **1,8946× (+89,46 %) EPCC**, en débit DOM face au **fallback officiel simdjson 5.0.4** (moyenne géométrique appariée, poids égal par fichier). Le corpus compte **92 435 + 75 400 = 167 835 lignes** pour l'ensemble des variantes et strates ; le protocole comprend **340/340 JSONTestSuite par hôte sans désaccord signalé**. Stable est quasi identique à l'A2 original (ratios **1,00001× / 0,99959×**, binaires ELF identiques par SHA-256 sur un même hôte).

Le résultat négatif : sur **95 minuscules JSON valides**, stable/fallback vaut **0,6665× / 0,8497×**. La variante facultative `NL4` échoue au critère de non-régression Cloud-V et n'est pas activée en livraison. L'**audit Test 107** donne `ENGINE PASS`, mais conserve historiquement **`HOLD_CI_AND_RELEASE_SIGNOFF`**. La CI #78 plus récente concerne un dépôt distinct et un environnement x86/default ; elle ne certifie pas la sûreté RVV native ni l'identité des sources gelées. Les deux ZIP d'évidence brute natifs n'étaient pas dans ce lot ; seules la table dérivée des 18 fichiers et cinq empreintes C++ ont été vérifiées directement.

**Ces chiffres ne sont pas comparables aux résultats E14 / VLS256 v5.0.3 du 11 octobre :** moteurs, compilations, corpus, machines et témoin changent.

## Expériences attestées dans les pièces consultées

### Campagne 3 h du 10 octobre 2026

17 configurations (15 plans E00–E14, un témoin historique sparse8 et un témoin officiel VLS256), **2 469 observations DOM**, sur matériel natif BPI-F3, VLEN 256, GCC 14.2. E14 : **1,473×** sur l'agrégat choisi (moyenne géométrique appariée face à VLS256). Les labels CITM et Twitter du petit et du grand bucket correspondent à des fichiers identiques pour certaines comparaisons ; ne pas compter artificiellement ces labels comme des corpus indépendants.

### Campagne 8 h du 11 octobre 2026

Quatre configurations, **6 887 observations** : E14, E01, sparse8 et VLS256 officiel.

| Comparaison E14 / VLS256 | Ratio de débit géométrique apparié |
|---|---:|
| DOM | **1,502×** |
| Stage 1 (mesuré séparément) | **1,601×** |
| Stage 2 (mesuré séparément) | **1,298×** |

Le DOM des documents à structuraux denses atteint **2,392×** pour E14, tandis que Stage 1 sur les chaînes très échappées tombe à **0,417×**. Ces contrastes motivent l'analyse de profils de charge ; ils invalident toute affirmation d'amélioration universelle.

**Protocole :** GCC 14.2, VLEN=256, CPU 0, compilation native, paires par phase/corpus/itérations/essai, trois répétitions par débit, ordre alterné dans la campagne ciblée. Les durées Stage 1 et Stage 2 ne sont pas une décomposition additive du temps DOM.

## Résultats négatifs et protocole ultérieur

- **Test 88 :** document daté du 12 octobre décrivant 0 observation de performance ; l'ordonnanceur Python demandait des répétitions supérieures au maximum accepté par le banc C++ pour de petits fichiers. Les compilations et contrôles de base ne constituent pas des benchmarks réussis.
- **Test 89 :** protocole historique de préqualification corrigé (60 min) ; ne pas substituer ses résultats à ceux de Test 106.
- **Test 90 :** la seule existence du protocole de jeu à l'écart ne prouve pas une mesure ; les résultats finaux chiffrés discutés ici proviennent du Test 106.
- **Extension « dual machine » historique :** la présence d'outils ne prouvait pas à elle seule une exécution ; le **Test 106**, lui, documente des exécutions **sur deux hôtes RISC-V** (sans prétendre reproduire la campagne E14 du 11 octobre).

## Lacunes de provenance et de portée

1. Le code source historique exact du checkout « dirty » n'est pas identifié par le SHA de l'amont seul. La campagne 8 h mentionne une copie de 828 fichiers ; publier cette copie **ou** une provenance permettant d'en reconstruire tous les octets.
2. Certaines archives contiennent données normalisées mais pas les fichiers originaux du corpus et tous les journaux de compilation.
3. Les tests validant **169 JSON valides + 24 invalides** par candidat restent des smoke gates, pas une preuve exhaustive de conformité/sûreté.
4. Répéter les mêmes documents ne crée pas des échantillons d'applications indépendants ; éviter les intervalles de confiance ou conclusions populationnelles non justifiés.
5. Les données E14 historiques proviennent de BPI-F3 ; le Test 106 apporte deux hôtes et des compilateurs différents, **sans** constituer une étude factorielle multi-VLEN ni une réplication indépendante.

## Lecture méthodologique

La valeur du cas tient à la capacité à organiser de nombreux plans, à documenter les erreurs et à faire apparaître les régimes où différentes stratégies semblent appropriées. Pour démontrer que l'**IA** est la cause des progrès, il faudrait un protocole comparatif mesurant le rôle des différentes formes d'assistance et leur coût.

## Gouvernance et perspectives

Les projets techniques conservent une gouvernance autonome. La publication de cette étude ne constitue pas une autorisation d’intégration d’ajouts originaux valablement réservés dans le projet simdjson de base. Une perspective d’écosystème sémantique élargi existe, mais le plan technique demeure non public. Voir [Gouvernance indépendante et perspectives](GOUVERNANCE_INDEPENDANTE_ET_PERSPECTIVES.md).
