# Résultats natifs finaux — VectorPath-RVV / VLA-MethodLab (18 octobre 2026)

**Mise à jour de recherche du 19 octobre 2026.** Synthèse des mesures natives **Test 106 terminées** et de l'audit documentaire historique **Test 107**. Aucun nouveau test natif n'a été exécuté pour AI-Orch ; il ne s'agit pas d'une réplication indépendante ni d'un article évalué par des pairs.

## Ce que signifie « final »

L'objet qualifié est le profil stable **VectorPath-RVV** (fork dérivé de simdjson **5.0.3**) : backend RVV-VLA, dispatch adaptatif **A2 niveau 2 / 16 Kio**, chemins « packed » désactivés, **Stage 2 original**. `SIMPLE_RUN` et `NL4` restent expérimentaux. La référence externe est le **fallback officiel de simdjson 5.0.4**, et non son meilleur backend x86/RVV, ni le **VLS256 v5.0.3** des premières campagnes.

**Population principale :** 18 fichiers JSON publics épinglés, confirmation Test 106, moyenne géométrique de ratios de débit appariés, avec **poids égal pour chaque fichier**, calculée **séparément sur chaque machine**.

| Résultat Test 106 | Cloud-V (GCC) | EPCC (Clang 16) |
|---|---:|---:|
| Stable / fallback officiel — DOM | **1,6007× (+60,07 %)** | **1,8946× (+89,46 %)** |
| Stable / fallback — Stage 1 | 2,0376× | 2,5035× |
| Stable / fallback — Stage 2 | 1,2727× | 1,4687× |
| Stable / A2 original — DOM | **1,00001× (+0,001 %)** | **0,99959× (−0,041 %)** |
| Pire fichier public contre A2 | 0,9976× | 0,9970× |
| Lignes de mesure (toutes strates) | **92 435** | **75 400** |
| Cas JSONTestSuite évalués, aucune divergence signalée | **340/340** | **340/340** |
| Gate moteur Test 106 | **PASS** | **PASS** |

**Total : 167 835 lignes de mesure**, et non 167 835 charges indépendantes. Les binaires `VP_STABLE` et `A2_ORIGINAL` sont de **SHA-256 identiques sur chaque hôte**. La règle de non-régression fixée à l'avance (moyenne stable/A2 ≥0,995× ; aucun des 18 documents sous 0,980×) est satisfaite par stable sur les deux hôtes. **NL4 échoue sur Cloud-V** (0,9797× sur `twitterescaped.json`) : pas de promotion en configuration stable.

### Résultats négatifs et portée

- Sur **95 très petits fichiers JSON valides** (2 à 110 octets ; médiane 8), le rapport stable/fallback descend à **0,6665× Cloud-V** et **0,8497× EPCC**. Il s'agit d'une régression de débit, **pas** d'un échec de conformité.
- JSONTestSuite comprend 95 valides (`y_`), 188 invalides (`n_`), 35 à validité dépendante de l'implémentation (`i_`) et 22 cas transformés, pour **340 tests par cible**. Zéro divergence signalée dans la portée du test ; aucune certification exhaustive n'en découle.
- Les ratios de Stage 1, Stage 2 et DOM décrivent des mesures différentes ; ne pas les additionner. Les accélérations sur corpus synthétiques fortement échappés ne sont pas intégrées au résultat principal.
- Le **Test 107 historique** conclut **`ENGINE PASS`** mais **`HOLD_CI_AND_RELEASE_SIGNOFF`** : il ne faut **pas** le transformer rétroactivement en autorisation de livraison.
- La CI connexe **#78**, réussie **après l'audit**, porte sur le dépôt distinct `Simdjson-rvv-vla` sous x86/default ; elle ne valide ni l'identité exacte des sources gelées VectorPath, ni Valgrind en RVV natif. Les réserves sur sûreté mémoire restent entières.

## Traçabilité réelle de cette mise à jour

Le [tableau de 18 fichiers](../evidence/TEST106_Public_18JSON_PerDocument_Results_EN.csv) a été recopié **sans modification** depuis l'archive MethodLab ; SHA-256 `23e538a714d1820d2b6d4711a7569c2999975db5cc8ff5a268686c75eb858283`. Ses moyennes géométriques ont été **recalculées localement**. Les cinq fichiers C++ désignés dans le manifeste de source gelée VectorPath ont été comparés à leurs SHA-256 et concordent. Les **archives brutes natives originales** Cloud-V et EPCC n'étaient **pas jointes** : leur intégrité complète n'est donc **pas** vérifiée ici.

SHA-256 des archives natives indiqués par le manifeste (non recalculés sur les ZIP originaux) : Cloud-V `cb0808f0fdc95d2cda99039af78abe8b91349c1d74832254c21df52ac2258168` ; EPCC `d670d27d0811c97dae1427921ed19e397046d01c15de830fa447a95d9bd0b25a`. Aucun tag Git immutable ou feu vert mainteneur n'est établi par ces pièces.

Les **6 887 observations E14 du 11 octobre** face au **VLS256 officiel 5.0.3** demeurent dans le manuscrit comme **résultats exploratoires historiques** ; elles ne sont **pas comparables directement** au candidat A2 du 18 octobre face au fallback 5.0.4. Les preuves portent sur la qualification du moteur dans ce protocole, **pas sur un avantage causal démontré de l'IA** sur une méthode de développement concurrente.

**Sources :** [rapport Test 106](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/TEST106_PUBLICATION_REPORT_EN.md) ; [CSV originel](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/releases/test106/TEST106_Public_18JSON_PerDocument_Results_EN.csv) ; [audit historique Test 107](https://github.com/MA-Gustave/VLA-MethodLab/blob/main/results/releases/test107/TEST107_FORMAL_RELEASE_AUDIT_EN.md) ; [manifeste de source gelée](https://github.com/MA-Gustave/VectorPath-RVV/blob/main/docs/release/FROZEN_SOURCE_MANIFEST.json). Voir aussi [synthèse anglaise](FINAL_NATIVE_RESULTS_2026-10-18.md).
