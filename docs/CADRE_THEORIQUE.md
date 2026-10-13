# Cadre théorique : forme, complexité et abstraction

## 1. Hypothèse d'interprétation

La notion de **frontière d'abstraction** désigne ici le niveau le plus bas auquel l'opérateur doit intervenir directement pour produire, contrôler ou modifier un système. Lorsque la réalisation et la vérification d'une sous-tâche deviennent suffisamment automatisées, l'opérateur peut se concentrer sur une relation entre sous-systèmes plutôt que sur toutes les opérations internes.

Il s'agit d'une **définition opératoire proposée** pour cet article, pas d'une notion dont l'originalité terminologique a été établie.

## 2. Aristote : analogie ontologique

L'hylémorphisme analyse les choses concrètes sous les aspects de **forme** et de **matière**. Un matériau est souvent déjà un composé organisé à un autre niveau : l'argile façonnée est matière d'une brique, la brique peut devenir matière d'un bâtiment. Ce caractère relatif du matériau permet de penser la composition hiérarchique.

La forme aristotélicienne n'est pas un simple motif géométrique ou un algorithme logiciel : elle participe à l'essence ou à la définition d'une chose. L'acte possède chez Aristote une priorité explicative sur la puissance, mais cette priorité ne signifie pas que des « formes numériques » existeraient avant des composants matériels ou que l'histoire technique suivrait une séquence nécessaire.

**Formulation sûre pour le manuscrit :** « La distinction aristotélicienne entre matière et forme fournit une analogie de composition : une unité déjà organisée peut fonctionner comme composant d'une organisation d'ordre supérieur. Cette analogie ne constitue pas une explication historique de l'informatique. »

Lectures : [Aristote, Métaphysique, IX, 8](https://classics.mit.edu/Aristotle/metaphysics.9.ix.html) ; [SEP, Form vs. Matter (révision 2024)](https://plato.stanford.edu/archives/fall2024/entries/form-matter/).

## 3. Simon : hiérarchie et quasi-décomposabilité

Dans *The Architecture of Complexity* (1962), Herbert A. Simon analyse la structure hiérarchique des systèmes complexes. La composition de sous-systèmes relativement décomposables est une référence théorique plus directe que l'hylémorphisme pour parler d'ingénierie contemporaine.

Source : [JSTOR](https://www.jstor.org/stable/985254).

## 4. Licklider et Engelbart : l'opérateur à l'étage supérieur

Licklider (1960) décrit une collaboration où l'humain fixe buts, hypothèses et critères, et où la machine prend en charge une partie du travail routinisable. Engelbart (1962) conçoit une augmentation de l'efficacité intellectuelle par l'intégration des outils, méthodes et langages. Ces textes soutiennent directement le **déplacement des tâches cognitives**, sans démontrer les performances des outils contemporains.

Sources : [Licklider, IEEE](https://doi.org/10.1109/THFE2.1960.4503259) ; [Engelbart, rapport SRI](https://dougengelbart.org/pubs/augment-3906-Framework.html).

## 5. Surveiller les échecs de l'automatisation

Parasuraman et al. (2000) distinguent plusieurs fonctions et niveaux d'automatisation. Bainbridge (1983) observe les « ironies » d'une automatisation qui laisse parfois à l'humain les rares cas les plus difficiles ; Brooks (1987) distingue des formes de complexité qui ne disparaissent pas par simple amélioration de l'outillage. Ces réserves rendent possible une discussion **critique**, et non une prophétie de disparition du code.

Sources : [Parasuraman et al.](https://doi.org/10.1109/3468.844354) ; [Bainbridge](https://doi.org/10.1016/0005-1098(83)90046-8) ; [Brooks](https://doi.org/10.1109/MC.1987.1663532).

## 6. Schéma conceptuel à tester

```text
Couche 4 : humain — objectif, contraintes, évaluation, arbitrages
             ↓ délégation contrôlée
Couche 3 : orchestration IA — propositions, variantes, analyses
             ↓ code et protocoles mesurables
Couche 2 : moteurs, tests, compilateurs, outils d'observation
             ↓ exécution
Couche 1 : instructions et matériel RISC-V
             ↑ résultats, anomalies, journaux et mesures
```

**Ne pas confondre** : « le niveau supérieur est plus abstrait » ne signifie ni « il est plus simple en tout », ni « il contient plus d'information », ni « le niveau inférieur est devenu sans importance ».

## 7. Objection à traiter

Une implémentation générée par IA peut rendre l'opérateur **moins** capable de détecter des erreurs qu'il n'aurait pas commises manuellement. La question scientifique n'est donc pas « l'IA fait-elle disparaître le code ? », mais : **dans quelles conditions le déplacement du travail vers l'orchestration augmente-t-il la capacité d'exploration sans dégrader la vérification ?**
