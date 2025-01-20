# Projet de Data Warehouse Tunisair

## 🚀 Description 
Ce projet vise à développer un entrepôt de données pour Tunisair, l'agence aérienne tunisienne. L'objectif est d'intégrer et d'analyser des données provenant de multiples sources et APIs en appliquant les phases de l'ETL (Extraction, Transformation et Chargement). Le résultat final est un cube multidimensionnel permettant des analyses approfondies.

### 📂 Dimensions 
- **Caractéristiques des vols**
- **Aéroport**
- **Date**

### 📈 Mesures 
- **Minutes de retard**
- **Nombre de passagers (Classe économique)**
- **Nombre de passagers (Premium économique)**
- **Nombre de passagers (Classe affaires)**
- **Nombre de passagers (Première classe)**
- **Revenus des vols**

### 💡 Questions Clés d'Analyse 
1. Quelle est la durée moyenne des retards observés sur une période déterminée ?
2. Comment le nombre de passagers a-t-il évolué au cours de l'année 2023 ?
3. Quels sont les aéroports de destination les plus problématiques en termes de retards sur une période donnée ?
4. Quels sont les facteurs les plus fréquents responsables des retards des vols ?
5. Quelle est la classe la plus réservée par les passagers ?
6. Quelle est la destination la plus fréquente pour les passagers de Tunisair ?
7. Quel est le revenu total généré par type de vol en 2023 ?

## 🛠️ Méthodologie 

### 📄 Processus ETL 
Le processus ETL est implémenté en utilisant Python et Talend. Plusieurs sources de données, listées ci-dessous, ont été utilisées pour garantir une analyse exhaustive.

#### 📂 Fichiers Sources :
- `Airports.json` : Données sur les aéroports.
- `DataSet_Tunisair.xlsx` : Feuille de calcul principale contenant diverses informations.
- `DB_Type_Classe_be.accdb` et `Type_Classe.accdb` : Bases de données Access pour les types de classes.
- `Type_Vols.csv` : Informations sur les vols.

#### Étapes :
1. **Extraction** : Les données sont récupérées à partir des fichiers mentionnés et d'APIs.
2. **Transformation** : Les données sont nettoyées, structurées et agrégées selon les besoins analytiques à l'aide de Python et Talend.
3. **Chargement** : Les données transformées sont chargées dans un cube de données multidimensionnel.

### ✈️ Déploiement 
Le cube de données généré est déployé en utilisant deux méthodes :
1. **SSAS (SQL Server Analysis Services)**
2. **Pentaho**

### 📊 Visualisation 
- Les analyses sont visualisées à l'aide de Power BI.
- Les requêtes sont exécutées en XML.
- Des graphiques interactifs présentent les principaux enseignements.

### 🔄 Automatisation 
L'entrepôt de données est actualisé quotidiennement pour assurer un traitement automatisé et à jour.

## 🌟 Résultats et Enseignements 
Le projet fournit des informations exploitables sur :
- Les retards des vols et leurs causes.
- Les tendances des passagers par classe et par année.
- La performance des revenus par type de vol.
- L'analyse des performances des aéroports.

## 📂 Fichiers Inclus 
- `TunisairETL.ipynb` : Notebook Python détaillant le processus ETL.
- Fichiers sources : `Airports.json`, `DataSet_Tunisair.xlsx`, `DB_Type_Classe_be.accdb`, `Type_Classe.accdb`, `Type_Vols.csv`.

## 🚀 Améliorations Futures 
- Intégration de dimensions supplémentaires (ex. : conditions météorologiques).
- Amélioration des capacités de traitement en temps réel.
- Exploration de modèles d'apprentissage automatique pour l'analyse prédictive.

## 📞 Contact 
Pour toute information complémentaire, veuillez contacter l'équipe projet.

---


