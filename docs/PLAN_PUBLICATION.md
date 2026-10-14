# Plan de publication et archivage

## Statut documentaire

Ce dépôt contient un manuscrit **non révisé par des pairs** et une bibliographie de démarrage. Les documents préparatoires sont publiables comme notes de recherche sous réserve de revue d'auteur, mais ne constituent ni un article accepté, ni la preuve d'une hypothèse inédite.

## Séquence recommandée

1. **Décider du nom d'auteur** et de l'identité scientifique publique. ORCID est facultatif ; l'affiliation universitaire n'est pas une condition de base pour faire une archive sur Zenodo.
2. **Choisir un titre** et une cible : article de méthode de développement, article de systèmes expérimentaux ou article d'optimisation. Adapter longueur, anonymisation et divulgation IA aux règles de la revue/conférence.
3. **Stabiliser les affirmations** au moyen du registre des preuves et de pièces de source originales (dont le checkout « dirty » historique).
4. **Revoir le texte** : vérifier la bibliographie, la priorité des travaux antérieurs, les figures, les permissions et les déclarations IA.
5. **Taguer une version documentaire** du dépôt ; conserver les identifiants de commits et la date réelle.
6. **Archiver sur Zenodo** lorsque le texte et les métadonnées sont prêts, pour obtenir un DOI ; cela n'équivaut pas à une évaluation scientifique.
7. **Déposer un préprint**, si approprié et permis par les règles de la cible, puis **soumettre à évaluation**. Ne pas présumer d'une acceptation ou d'un calendrier non vérifié.
8. **Reproduire et corriger** : accepter des issues documentées, versions de résultats négatifs, corrections de statistiques, répliques sur une seconde machine.

## Deux stratégies éditoriales possibles

### A. Article conceptuel et méthodologique (priorité)

- Sujet central : changement de rôle humain dans le développement technique.
- VLA-MethodLab = étude de cas avec preuves et limites.
- Métadonnées JSON = orientation de recherche future.
- Critère de qualité : originalité du cadre argumentatif, articulation aux travaux antérieurs et rigueur des limites.

### B. Article de systèmes expérimentaux (phase ultérieure)

- Sujet central : performances d'un moteur adaptatif ou d'un système de sélection par profils JSON.
- Nécessite code testé et corpus complets, nouvelles comparaisons, correction exhaustive et reproduction indépendante.
- Le gain documenté d'E14 sur une machine ne suffit pas pour revendiquer ce nouvel algorithme de dispatch.

## Fichiers à personnaliser

Voir [liste de publication](AVANT_PUBLICATION.md). Éviter d'inscrire un DOI fictif ou une fausse affiliation dans le manuscrit ou dans `CITATION.cff`.
