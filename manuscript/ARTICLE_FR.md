# Au-delà de l'écriture du code : automatisation des niveaux de complexité et développement expérimental orchestré par IA

**Manuscrit de travail — 13 octobre 2026.** Auteur, affiliation et DOI à compléter. **Non soumis, non évalué par des pairs.**

## Résumé

Voir [le résumé français](ABSTRACT_FR.md). Ce manuscrit privilégie une contribution méthodologique et conceptuelle plutôt que la revendication d'un record de performance.

## 1. Introduction : déplacer le travail plutôt qu'éliminer la complexité

Le développement de systèmes techniques implique plusieurs tâches distinctes : comprendre le problème, spécifier les contraintes, produire une implémentation, vérifier son comportement, mesurer ses performances et décider des modifications nécessaires. Il n'est pas nécessaire que ces tâches soient accomplies par la même personne ni au même niveau de représentation.

L'histoire de l'informatique fournit de nombreux exemples de séparation entre la formulation d'une opération et son exécution. Le calcul mécanique, les calculateurs électromécaniques, l'électronique numérique, les langages de programmation, les compilateurs et les environnements de développement ont déplacé le point où intervient le travail humain. Cette histoire n'est ni linéaire ni une preuve d'un « progrès inévitable » ; les abstractions ont souvent coexisté, et les niveaux inférieurs demeurent essentiels pour comprendre et diagnostiquer les défaillances.

L'intelligence artificielle générative rend possible un autre déplacement. Un opérateur peut formuler une tâche en langage naturel, demander la production de programmes, leur soumettre des résultats d'exécution et faire élaborer des variantes successives. Ce mouvement ne rend pas le code « désuet » au sens universel : il rend certaines opérations de codage **délégables**, tout en accentuant la nécessité de critères indépendants de vérification. Une formulation utile de cette évolution est le **déplacement de la frontière d'abstraction par l'automatisation**.

L'article propose d'étudier cette transformation à partir d'une méthode de travail publiquement décrivable et d'un projet technique concret : VLA-MethodLab, un laboratoire d'expérimentation pour des moteurs JSON vectorisés sur RISC-V.

## 2. Fondements : organisation, abstraction et collaboration humain-machine

### 2.1. Aristote : une analogie d'organisation, non un ancêtre de l'IA

L'hylémorphisme d'Aristote distingue **matière** (*hylè*) et **forme** (*eidos*, *morphè*) comme principes d'explication des choses concrètes. La forme ne désigne pas simplement une silhouette : elle contribue à définir ce qu'est une chose organisée. La matière est relative à ce qui la reçoit : des briques, déjà faites d'argile organisée, peuvent constituer la matière d'une maison. Le livre IX de la *Métaphysique* examine aussi la priorité explicative de l'acte sur la puissance.

La comparaison avec les couches informatiques doit rester limitée. Il serait anachronique d'attribuer à Aristote une théorie de l'abstraction logicielle ou de l'automatisation. L'analogie pertinente est celle d'**éléments organisés qui deviennent des composants pour une organisation ultérieure**, et non l'idée que « la matière serait automatiquement un niveau supérieur à la forme ».

Sources : [Stanford Encyclopedia of Philosophy — Form vs. Matter](https://plato.stanford.edu/archives/fall2024/entries/form-matter/) ; [Aristote, *Métaphysique*, IX, 8](https://classics.mit.edu/Aristotle/metaphysics.9.ix.html).

### 2.2. Systèmes hiérarchiques et augmentation

Herbert A. Simon (1962) analyse l'architecture hiérarchique des systèmes complexes. J. C. R. Licklider (1960) propose une symbiose où l'humain fixe les objectifs, les hypothèses et les critères tandis que les machines prennent en charge des tâches routinisables. Douglas Engelbart (1962) envisage l'amélioration conjointe des outils, méthodes et systèmes intellectuels pour traiter des problèmes plus difficiles.

Ces auteurs ne démontrent pas l'efficacité des LLM actuels. Ils fournissent un vocabulaire pour analyser comment une activité auparavant effectuée directement peut devenir une fonction de support intégrée à un système plus vaste.

### 2.3. Automatisation de la décision et risques résiduels

Parasuraman, Sheridan et Wickens (2000) distinguent les formes et niveaux d'interaction humain–automatisation. Bainbridge (1983) rappelle les paradoxes de l'automatisation : lorsque le système assume les tâches ordinaires, l'opérateur peut se retrouver chargé des exceptions les plus délicates. Brooks (1987) distingue les complexités essentielles et accidentelles du logiciel. Ces réserves motivent un principe de l'étude : **déléguer l'implémentation ne dispense jamais de valider les résultats**.

## 3. État de l'art : synthèse, autotuning et agents

La synthèse de programmes exprime le passage de spécifications ou exemples à des implémentations automatiques (Gulwani, Polozov et Singh, 2017). L'autotuning explore des espaces de configurations par évaluation empirique : OpenTuner (Ansel et al., 2014) constitue un exemple. Rice (1976) pose le problème de la sélection d'algorithmes selon les caractéristiques d'une instance. Plus récemment, ChatDev (Qian et al., 2024), FunSearch (Romera-Paredes et al., 2024) et AlphaEvolve (Novikov et al., prépublication 2025) illustrent différents degrés de collaboration agentique, de génération de programmes et de recherche guidée par des évaluateurs.

L'apport proposé ici ne consiste pas à réinventer ces méthodes. Il consiste à documenter un **mode de direction de recherche** dans lequel un opérateur peut piloter des investigations de bas niveau sans prétendre posséder toute l'expertise de codage nécessaire à chaque sous-tâche. Cette possibilité doit toutefois être mesurée : l'étude d'un seul laboratoire ne prouve pas que cette organisation est plus rapide ou plus sûre qu'une équipe de spécialistes.

## 4. Méthode publique : construire un laboratoire de recherche itératif

La méthode déclarée se présente comme une boucle de développement, mais toutes ses étapes ne sont pas actuellement automatisées de manière autonome.

**(1) Stabiliser l'environnement.** Organiser les versions du moteur, les scripts de compilation, les accès aux machines, les vérifications de correction, l'identification de matériel et la conservation des résultats. Une mesure non traçable est moins utile qu'une expérience plus modeste dont on connaît précisément les conditions.

**(2) Construire une bibliothèque de patterns.** L'IA est sollicitée pour identifier et formaliser des motifs d'optimisation potentiellement utiles. L'opérateur n'affirme pas connaître ou maîtriser chaque motif de bas niveau. La bibliothèque représente donc un répertoire d'hypothèses techniques révisable, et non une collection de vérités prévalidées.

**(3) Composer des candidats.** Des combinaisons de patterns deviennent des configurations de test. Dans le cas documenté, **E00–E14 constituent quinze plans fixes** décrits dans le code et les manifestes de VLA-MethodLab. Leur orchestration expérimentale ne doit pas être confondue avec une recherche évolutionnaire autonome ou une commutation arbitraire entre binaires à l'exécution.

**(4) Mesurer et contrôler.** Les campagnes natives confrontent les plans à des familles variées de documents JSON. L'objectif initial est exploratoire : repérer des tendances, régressions et résultats inattendus. Des expériences confirmatoires distinctes doivent ensuite vérifier les hypothèses sans réutiliser le même corpus pour choisir et proclamer simultanément les « gagnants ».

**(5) Documenter et itérer.** Les rapports conservent les variantes testées, les réussites, les erreurs, les paramètres et les questions non résolues. Cette mémoire expérimentale sert aux lecteurs humains et peut alimenter les itérations futures de l'IA. Le rapport n'est pas une validation indépendante de sa propre exactitude ; les fichiers bruts et les scripts de contrôle restent la référence.

L'auteur conserve une partie de ses instructions et procédés d'orchestration confidentielle. Le protocole public précise en revanche les **éléments observables** que d'autres peuvent inspecter : configurations, environnement, corpus, mesures et limites. Il faut éviter de faire reposer toute affirmation vérifiable sur une procédure secrète impossible à auditer.

## 5. Étude de cas : VLA-MethodLab

Le dépôt [VLA-MethodLab](https://github.com/MA-Gustave/VLA-MethodLab) regroupe une bibliothèque de moteurs spécialisés, un orchestrateur d'expériences, des scripts de vérification et des mesures sur matériel natif RISC-V Vector. Le dépôt [VectorPath-RVV](https://github.com/MA-Gustave/VectorPath-RVV) documente un backend expérimental indépendant de la longueur des vecteurs.

La campagne du **11 octobre 2026** a comparé quatre configurations sur une **BPI-F3**, sous Linux `riscv64`, RVV `VLEN=256`, avec **GCC 14.2** et des compilations adaptées aux backends. Elle a enregistré **6 887 observations**. Sur les corpus étudiés, le plan E14 a atteint des **rapports géométriques de débit** de **1,502× en DOM**, **1,601× en Stage 1** et **1,298× en Stage 2** par rapport au backend officiel VLS256 de simdjson v5.0.3. Ces mesures représentent des appels distincts, et les durées Stage 1 et Stage 2 ne doivent pas être additionnées pour reconstituer le temps DOM.

La diversité des résultats est scientifiquement plus instructive que le classement seul. Pour les chaînes fortement échappées, E14 a donné **0,417× en Stage 1** malgré **1,317× en DOM** ; sur les documents à structures denses, des gains nettement supérieurs ont été observés. L'ensemble suggère qu'aucune configuration unique ne domine uniformément toutes les dimensions de mesure et tous les types de document.

Cette lecture exige plusieurs réserves : la suite de correction n'est pas exhaustive ; les essais proviennent d'un matériel principal et de corpus en partie synthétiques ; des observations répétées ne constituent pas des échantillons indépendants ; surtout, la version historiquement mesurée provenait d'un **checkout modifié**, que le seul SHA amont ne permet pas de reconstruire à l'identique. Les détails chiffrés et le statut de chaque campagne sont consignés dans le [registre des preuves](../docs/REGISTRE_PREUVES.md).

Le **Test 88**, conçu pour élargir l'exploration, a échoué avant de produire des observations de performance à cause d'un décalage entre le nombre d'itérations demandé et la limite acceptée par le banc natif. Cet échec documenté est méthodologiquement important : la production automatisée d'expériences amplifie aussi les erreurs d'orchestration. Les Test 89/90 apparaissent dans les documents consultés comme protocoles, et non comme preuves de gains natifs déjà établis.

### Gouvernance indépendante et limites des autorisations

La [politique d'utilisation de l'IA de simdjson](https://github.com/simdjson/simdjson/blob/master/AI_USAGE_POLICY.md) admet les contributions assistées par IA sous réserve d'une révision humaine réelle, d'une compréhension suffisante et de la responsabilité du contributeur ; elle n'interdit pas catégoriquement l'IA. Le présent programme de recherche repose sur une orchestration expérimentale distincte : **VLA-MethodLab** et **VectorPath-RVV** sont donc maintenus indépendamment du projet original. Le présent article n'accorde aucune autorisation nouvelle d'incorporer au simdjson d'origine des ajouts originaux valablement réservés, sans remettre en cause les licences déjà accordées. Une intégration éventuelle dans un écosystème logiciel sémantique élargi reste une orientation confidentielle, non une architecture publiée ou un résultat prouvé. Voir [gouvernance et droits](../docs/GOUVERNANCE_INDEPENDANTE_ET_PERSPECTIVES.md).

## 6. Vers des métadonnées descriptives de charge JSON

Les différences mesurées selon les familles JSON conduisent à une hypothèse : si une application connaît certaines caractéristiques du document avant le parsing, elle pourrait transmettre des **indices de charge** à un moteur capable de sélectionner un plan spécialisé. Un profil facultatif pourrait décrire la proportion de chaînes, la densité de séparateurs, les échappements, les octets UTF-8 multioctets, la taille ou les distributions de structures.

Un tel profil ne devrait **jamais influencer la décision de validité JSON**. Il devrait être traité comme un indice non fiable pour une optimisation, avec repli vers le comportement standard. Il serait préférable de tester d'abord une **métadonnée externe (*sidecar*)** plutôt que d'ajouter silencieusement un champ `_meta` dans tous les documents, ce qui changerait leur contenu métier. Le format JSON défini par la [RFC 8259](https://www.rfc-editor.org/info/rfc8259/) ne définit pas de profil de performance universel.

La proposition doit répondre à des questions empiriques : coût de création des métadonnées, fiabilité du profil, surcharge de lecture/dispatch, compatibilité, résistance aux profils erronés et bénéfice réel en débit total. Les campagnes E00–E14 **ne valident pas** cette proposition : elles motivent son expérimentation.

## 7. Comment évaluer l'hypothèse méthodologique

L'étude actuelle montre une expérience réelle d'orchestration assistée par IA ; elle n'isole pas causalement la contribution de l'IA à la performance ni au temps humain économisé. Une étude ultérieure pourrait comparer, sur plusieurs tâches et équipes, un développement manuel, un développement assisté et une orchestration expérimentale structurée. Les variables seraient : temps humain, temps machine, coût énergétique, taux de compilation, conformité, nombre de variantes, coût de correction, qualité des solutions et facilité de reproduction. Les hypothèses devraient être fixées avant les tests confirmatoires et les échecs conservés.

Cette évaluation doit également reconnaître les compétences tacites de l'opérateur : formuler une question utile, reconnaître une mesure suspecte, arbitrer entre objectifs et assurer une validation externe sont des activités intellectuelles décisives. **L'absence de codage manuel n'équivaut pas à l'absence d'expertise.**

## 8. Discussion et conclusion provisoire

Le développement orchestré par IA peut être compris comme une évolution de la manière dont l'humain gère la complexité : au lieu d'intervenir exclusivement sur les instructions, il peut concevoir des espaces de solutions, des dispositifs expérimentaux et des procédures d'évaluation. La mise en place d'un laboratoire mesurable transforme les suggestions de l'IA en propositions testables, tandis que les résultats, y compris négatifs, alimentent de nouvelles décisions.

L'analogie aristotélicienne aide à penser les compositions successives ; la théorie des systèmes complexes et les recherches sur l'automatisation donnent les instruments modernes d'analyse. VLA-MethodLab constitue une étude de cas de cette dynamique. La conclusion défendable aujourd'hui est **la faisabilité documentée d'une telle organisation et l'existence de questions de recherche précises** — non la disparition du besoin de programmation, ni la supériorité universelle de l'IA, ni un nouveau standard JSON établi.

## Bibliographie

Voir [bibliographie commentée](../references/REFERENCES.md) et [références BibTeX](../references/references.bib). Les notices bibliographiques sont une base de rédaction ; elles doivent être revérifiées à l'étape de la soumission.
