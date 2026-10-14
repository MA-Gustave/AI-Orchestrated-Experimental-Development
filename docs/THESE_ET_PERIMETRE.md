# Thèse, contributions et périmètre

## La thèse

**Proposition principale :** lorsqu'un ensemble de tâches techniques est suffisamment automatisé et contrôlable, l'opérateur peut déplacer son activité vers un niveau d'abstraction supérieur : définir des objectifs, concevoir des expériences, sélectionner des critères et coordonner des sous-systèmes. Les systèmes génératifs peuvent aujourd'hui participer à cette automatisation pour certaines tâches de programmation.

**La nuance :** automatiser n'est pas supprimer. La complexité réapparaît dans la définition du problème, la fiabilité des outils, la validation et le traitement des exceptions.

## Ce que cet article apporte

1. **Un cadre d'analyse** de la « frontière d'abstraction » entre l'opérateur, l'IA, le code, les systèmes de compilation, les tests et les machines.
2. **Une description publique de méthode** : structurer les patterns d'optimisation, créer des variantes, mesurer, conserver la mémoire expérimentale, itérer.
3. **Une étude de cas située** : VLA-MethodLab, avec résultats natifs et échecs documentés, notamment la détection de stratégies utiles et nuisibles selon les familles JSON.
4. **Une hypothèse technique prospective** : l'usage facultatif de métadonnées décrivant les charges JSON pour aider un parseur à choisir son plan.

## Ce que l'article ne prétend pas

- Ni que l'IA est toujours meilleure qu'un développeur.
- Ni que savoir coder ne présente plus d'utilité.
- Ni que les algorithmes d'autotuning, la synthèse de programmes ou la sélection de stratégies sont des inventions originales du projet.
- Ni qu'une bibliothèque de 15 plans constitue, en elle-même, une recherche autonome de politiques optimale.
- Ni que le laboratoire a prouvé l'avantage des métadonnées JSON.
- Ni qu'un ensemble de mesures sur une carte et des corpus choisis peut être généralisé à tout JSON ou tout matériel RISC-V.

## Typologie des affirmations

**Démonstration instrumentée :** les mesures comparatives E14/E01/sparse8/VLS256 sur des corpus et un système explicités.  
**Étude de faisabilité :** un opérateur a pu développer/organiser cet environnement avec le concours de l'IA.  
**Interprétation philosophique :** rapprochement entre forme, matière, hiérarchies et abstraction.  
**Hypothèses ouvertes :** supériorité méthodologique de l'orchestration, profilage JSON externe, généralisation à d'autres domaines.

## Positionnement vis-à-vis des travaux antérieurs

- **Aristote** : comparaison sur la composition et la forme ; pas antériorité technique.
- **Simon (1962)** : systèmes complexes hiérarchiques.
- **Licklider (1960)** et **Engelbart (1962)** : collaboration et augmentation des capacités humaines.
- **Parasuraman et al. (2000)**, **Bainbridge (1983)** : degré d'automatisation et nécessité de supervision.
- **Gulwani et al. (2017)**, **OpenTuner (2014)**, **FunSearch (2024)**, **AlphaEvolve (2025)** : la littérature technique existante.

L'originalité exacte reste à préciser après une revue de littérature exhaustive ; le dépôt ne revendique aucune priorité générale sur ces notions.
