# RVV-VLA-Lab : étude de cas documentée

## Projets de référence

- Laboratoire : https://github.com/MA-Gustave/RVV-VLA-Lab
- Backend expérimental : https://github.com/MA-Gustave/Simdjson-rvv-vla
- Bibliothèque de plans : https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/experiments/PATTERN_LIBRARY.md
- Rapport natif du 11 octobre : https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/results/2026-10-11-stage-profile-8h.md
- Méthodologie : https://github.com/MA-Gustave/RVV-VLA-Lab/blob/main/docs/METHODOLOGY.md

## Fonction du cas dans l'article

Le laboratoire est présenté comme **un exemple instrumenté de développement expérimental dirigé avec une forte assistance de l'IA**, et non comme la preuve qu'une personne sans compétences de codage peut toujours surpasser des spécialistes. Le récit de la méthode repose sur les explications de l'opérateur et sur les traces publiques ; il n'est pas encore comparé à des groupes témoins.

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
- **Test 89 :** protocole de préqualification corrigé (60 min) ; pas de résultat natif nouveau revendiqué ici à partir des pièces consultées.
- **Test 90 :** protocole de validation sur un jeu à l'écart (2 h) ; aucune nouvelle performance n'est inférée de la seule existence de ce protocole.
- **Extension v6.3 « dual machine » :** la présence d'outils d'accès à plusieurs machines ne constitue pas une reproduction réalisée sur une seconde architecture.

## Lacunes de provenance et de portée

1. Le code source historique exact du checkout « dirty » n'est pas identifié par le SHA de l'amont seul. La campagne 8 h mentionne une copie de 828 fichiers ; publier cette copie **ou** une provenance permettant d'en reconstruire tous les octets.
2. Certaines archives contiennent données normalisées mais pas les fichiers originaux du corpus et tous les journaux de compilation.
3. Les tests validant **169 JSON valides + 24 invalides** par candidat restent des smoke gates, pas une preuve exhaustive de conformité/sûreté.
4. Répéter les mêmes documents ne crée pas des échantillons d'applications indépendants ; éviter les intervalles de confiance ou conclusions populationnelles non justifiés.
5. La preuve concerne un environnement précis et non une comparaison systématique multi-VLEN/multi-compilateur/multi-matériel.

## Lecture méthodologique

La valeur du cas tient à la capacité à organiser de nombreux plans, à documenter les erreurs et à faire apparaître les régimes où différentes stratégies semblent appropriées. Pour démontrer que l'**IA** est la cause des progrès, il faudrait un protocole comparatif mesurant le rôle des différentes formes d'assistance et leur coût.
