# Programme de recherche : questions et hypothèses falsifiables

Ce dossier sépare **concepts**, **observation de terrain** et **hypothèses testables**. Le fait qu'un outil aide un utilisateur donné ne suffit pas à établir qu'il est généralement supérieur.

## Axe A — Frontière d'abstraction

**RQ-A1.** Dans quelles activités un opérateur peut-il piloter un projet technique sans écrire directement le code bas niveau ?  
**H-A1.** À tâche, temps humain et ressources comparables, une orchestration structurée par IA produit davantage de variantes **valides et mesurables** qu'une assistance conversationnelle non structurée.  
**Mesures :** variantes validées, temps opérateur, taux d'échec, coût de calcul, corrections humaines, compréhension des décisions.

**RQ-A2.** Quelle complexité disparaît de la tâche humaine, et laquelle réapparaît dans l'évaluation ?  
**H-A2.** L'effort diminue sur l'implémentation de détail mais peut augmenter en revue, supervision et débogage ; l'effet net dépend de la fiabilité des outils et du domaine.

## Axe B — Mémoire expérimentale

**RQ-B1.** Les rapports structurés de résultats (y compris négatifs) permettent-ils d'éviter la répétition d'essais improductifs ?  
**H-B1.** Comparée à une boucle sans registre, une boucle avec historique versionné réduit la répétition de variantes identiques et améliore la traçabilité des décisions.  
**Mesures :** répétitions, réutilisation des hypothèses, taux de vérification des références, temps d'analyse.

## Axe C — Bibliothèque de patterns

**RQ-C1.** Quels gains découlent de l'extension de la bibliothèque versus la modification de la politique de composition ?  
**H-C1.** Ajouter des patterns de correction/traitement des échappements améliore les familles où E14 régresse, sans nécessairement améliorer la moyenne globale.  
**Mesures :** validité, régressions par famille, ratios Stage 1/Stage 2/DOM, coût du dispatch.

## Axe D — Métadonnées JSON

**RQ-D1.** Une classification externe amortit-elle les coûts de génération et de lecture des profils ?  
**H-D1.** Pour des documents réutilisés et structurés de manière stable, le profil externe peut réduire le coût par parse ; pour les petits documents à usage unique, il peut être défavorable.  
**Protocole :** voir [hypothèse des métadonnées](HYPOTHESE_METADATA_JSON.md).

## Étude comparative recommandée

| Condition | Principe | Exemple de procédure |
|---|---|---|
| Contrôle A | Développement manuel/expert | Même tâche, mêmes outils natifs, sans génération de code IA |
| Contrôle B | IA conversationnelle ad hoc | Pas de bibliothèque formelle ni de registre expérimental |
| Expérimental C | Orchestration structurée | Patterns fixés, tests reproductibles, mémoire versionnée |

Préenregistrer tâches et mesures ; comparer plusieurs opérateurs, tâches et corpus ; contrôler la familiarité avec l'outil ; éviter de comparer uniquement un débutant et un spécialiste comme si la condition IA expliquait toute la différence. Respecter les ressources et les règles de divulgation éventuelles du lieu de publication.
