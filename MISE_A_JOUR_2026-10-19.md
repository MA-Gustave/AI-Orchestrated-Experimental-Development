# Mise à jour documentaire AI-Orch — 19 octobre 2026

Cette révision conserve l'argument de recherche et les résultats E00–E14 du 11 octobre 2026 comme **historique exploratoire**, puis intègre séparément les **résultats natifs finaux du Test 106** et **l'audit Test 107** datés du 18 octobre 2026.

## Changements livrés

- README et article scientifique **anglais/français**, ainsi que les deux résumés.
- Études de cas et registres de preuves **anglais/français** (références E-14 à E-20 et F10 à F16).
- Nouvelle fiche détaillée [anglais](docs/FINAL_NATIVE_RESULTS_2026-10-18.md) et [français](docs/RESULTATS_NATIFS_FINAUX_2026-10-18.md).
- Pages wiki : accueil, étude de cas, preuves/limites, barre latérale et une page dédiée aux résultats finaux.
- Table dérivée **18 JSON × 2 cibles** conservée octet pour octet dans `evidence/`, avec contrôle SHA-256 et script de vérification `scripts/verify-test106-summary.py`.
- Journal des changements et liste des vérifications nécessaires avant publication.

## Données à citer

| Paramètre | Cloud-V | EPCC |
|---|---:|---:|
| Stable / fallback officiel simdjson 5.0.4, DOM, 18 JSON publics | **1,6007×** | **1,8946×** |
| Stable / A2 original, DOM | 1,00001× | 0,99959× |
| Nombre de lignes de mesure Test 106 | 92 435 | 75 400 |
| JSONTestSuite, sans divergence signalée | 340/340 | 340/340 |
| Ratio DOM stable/fallback sur 95 petits JSON valides | **0,6665×** | **0,8497×** |

Ce résultat prouve uniquement une performance dans **ce protocole et face à ce fallback**. L'audit Test 107 conserve le statut historique **`ENGINE PASS` / `HOLD_CI_AND_RELEASE_SIGNOFF`**. La CI connexe #78 ultérieure n'est pas un certificat de sûreté mémoire native RVV et ne crée ni tag officiel ni autorisation de publication.

## Vérification et publication

Exécuter à la racine du projet :

```bash
python3 scripts/verify-test106-summary.py
```

Le script vérifie l'empreinte du CSV, les 18 identités, les ratios géométriques et l'échec NL4 Cloud-V. Il **ne remplace pas** un audit des archives natives originales (non fournies) ou une exécution du benchmark. Cinq empreintes SHA-256 C++ indiquées par le manifeste VectorPath ont aussi été confrontées au contenu du snapshot fourni durant la préparation de cette mise à jour.

Cette archive constitue une **révision locale prête à intégrer**. Aucun changement n'a été poussé sur GitHub et le wiki distant ne se synchronise pas automatiquement avec `wiki/`. Le dépôt de profil / site web fourni séparément (`docs(2).zip`) n'est pas modifié : il présentait déjà les principaux chiffres finaux et il appartient à un autre projet.
