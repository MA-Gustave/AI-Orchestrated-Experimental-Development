# Hypothèse : profils de charge JSON et sélection de moteurs spécialisés

**Statut : proposition de recherche ; ne pas présenter comme une innovation implémentée et validée.**

## Problème

Différentes familles de JSON présentent des distributions différentes de ponctuation, chaînes, nombres, échappements et octets UTF-8. Certaines configurations RVV-VLA montrent de forts écarts selon ces familles. Un moteur peut classer lui-même l'entrée en inspectant des octets, mais ce classement possède un coût et risque de mal caractériser un document non homogène.

## Question

**Des métadonnées descriptives fiables, disponibles avant le parsing, peuvent-elles améliorer le temps total de traitement en permettant un choix plus pertinent de plan, compte tenu de leur coût de production et d'accès ?**

L'idée générale de sélectionner un algorithme selon les caractéristiques d'un problème est antérieure au projet (Rice, 1976). L'étude proposée porte sur son **application documentée** à des charges JSON RVV-VLA et à des profils transmis explicitement.

## Choix d'architecture recommandé pour un prototype

Ne pas modifier le sens du document JSON métier. Préférer des métadonnées **externes** (*sidecar*) ou un champ propre à une enveloppe définie par l'application, non un champ `_meta` ajouté arbitrairement à tout objet JSON.

### Exemple purement illustratif de métadonnées externes

Voir [l'exemple JSON](../examples/json-workload-profile.example.json). Le schéma n'est pas une norme, les valeurs sont fictives et aucune optimisation n'est garantie.

Champs envisagés :

- `schema`: version du profil ;
- `target_sha256`: lier le profil aux octets exacts du JSON (s'il est raisonnable d'absorber ce coût et de gérer les changements) ;
- `features`: taille, densité de délimiteurs hors chaînes, fréquence d'échappements, proportion d'octets non ASCII, caractéristiques numériques ;
- `sampling`: source des estimations, sous-ensembles, éventuelle incertitude ;
- `hint`: classe/plan recommandé, **jamais une garantie** ;
- `provenance`: outil/algorithme producteur et version.

Les nombres de densité exigent des définitions stables de leurs dénominateurs. Par exemple, une densité de structuraux doit distinguer les caractères à l'intérieur des chaînes de ceux situés hors chaînes ; sinon le signal peut être trompeur.

## Principes de sécurité et de conformité

1. Ne jamais faire dépendre la **validité JSON** de profils externes.
2. En cas de profil absent, erroné, obsolète ou malveillant, revenir à la classification normale ou à un plan générique.
3. Vérifier les contraintes de taille, format, version et intégrité sans consommer plus de ressources que le bénéfice espéré.
4. Ne pas baser un parseur sur des données de profil fournies par un tiers sans stratégie de validation et de repli.
5. Ne pas promettre qu'un `preferred_engine` fonctionne partout : le matériel, le compilateur, le VLEN, la version du moteur et la nature du JSON peuvent modifier le choix.
6. La [RFC 8259](https://www.rfc-editor.org/info/rfc8259/) spécifie JSON, pas un mécanisme standard de dispatch de parsing par métadonnées.

## Comparaison expérimentale falsifiable

Tester, **sur les mêmes documents, matériels et versions de binaires** :

- **B0 — Fixe :** meilleure configuration fixe présélectionnée sur l'ensemble d'entraînement ;
- **B1 — Classifieur interne :** profilage borné du document puis sélection d'un plan ;
- **B2 — Métadonnées externes :** lecture, validation minimale puis sélection ;
- **B3 — Hybride :** métadonnées quand fiables, classifieur sinon ;
- **B4 — Oracle hors ligne :** meilleur résultat par document connu seulement après toutes les mesures, **borne théorique non réalisable directement**.

Critère primaire : latence totale de bout en bout, **incluant** le coût de génération amorti (ou explicitement non amorti selon le scénario), transport, lecture et validation du profil, dispatch et parsing. Critères secondaires : débit DOM, erreurs, robustesse aux mauvais profils, consommation mémoire, temps par taille et famille, comportement en réutilisation de documents.

### Protocole minimal

1. Séparer les corpus **d'entraînement**, **exploratoires** et **tenus à l'écart**.
2. Consigner la politique et les seuils avant la campagne confirmatoire.
3. Mesurer les petits documents (où le surcoût peut dominer), les longs JSON, les charges trompeuses et les documents malformés.
4. Comparer différentes tailles de VLEN et compilateurs dans la mesure du possible.
5. Rapporter les régressions, pas uniquement les moyennes agrégées.
6. Ne pas compter des répétitions d'un même document comme un nouvel échantillon indépendant.

## Critères d'échec honnêtes

- Une classification interne plus rapide que la lecture du profil rend l'intérêt des métadonnées négatif pour la charge considérée.
- Les profils non fiables ou obsolètes réduisent plus les performances qu'ils ne les améliorent.
- Le meilleur plan fixe est suffisamment bon pour rendre le dispatch improductif.
- La création du profil est trop coûteuse pour les JSON à usage unique.

Un tel résultat négatif serait une contribution valable à la compréhension du problème.
