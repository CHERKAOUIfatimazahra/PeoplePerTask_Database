# PeoplePerTask_Database

## Table des Matières
1. [Description du projet](#description-du-projet)
2. [Architecture globale](#architecture-globale)
3. [Base de données](#base-de-données)
   - [Technologies utilisées](#technologies-utilisées)
   - [Schéma de base de données](#schéma-de-base-de-données)
   - [Requêtes SQL](#requêtes-sql)
   - [Diagramme UML](#diagramme-uml)
4. [Bonnes pratiques](#bonnes-pratiques)
5. [Liens utiles](#liens-utiles)

---

## Description du projet

**PeoplePerTask** est une plateforme web conçue pour mettre en relation des utilisateurs, freelances et porteurs de projets. Elle facilite la gestion des offres, des catégories, des sous-catégories, ainsi que des témoignages pour optimiser l'expérience utilisateur.

---

## Architecture globale

L'architecture repose sur une base de données relationnelle optimisée avec des relations clés primaires et étrangères, assurant l'intégrité des données.

---

## Base de données

### Technologies utilisées
- **SGBD** : MySQL
- **Outils UML** : Lucidchart
- **Langage** : SQL

---

### Schéma de base de données
| **Table**         | **Colonnes**                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| **Utilisateurs**   | `id` (PK), `nom_utilisateur`, `mot_de_passe` (haché), `email`, `autres_informations`           |
| **Catégories**     | `id` (PK), `nom`                                                                              |
| **Sous-Catégories**| `id` (PK), `nom`, `id_categorie` (FK → Catégories)                                            |
| **Projets**        | `id` (PK), `titre`, `description`, `id_categorie` (FK), `id_sous_categorie` (FK), `id_user` (FK) |
| **Freelances**     | `id` (PK), `nom`, `compétences`, `id_user` (FK → Utilisateurs)                                |
| **Offres**         | `id` (PK), `montant`, `délai`, `id_freelance` (FK), `id_projet` (FK)                           |
| **Témoignages**    | `id` (PK), `commentaire`, `id_user` (FK → Utilisateurs)                                       |

---

### Requêtes SQL

#### Création de la table `Utilisateurs` :
```sql
CREATE TABLE Utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom_utilisateur VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    autres_informations TEXT
);
```

#### Création de la table `Catégories` :
```sql
CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);
```

#### Exemple de requête pour la table `Projets` :
```sql
CREATE TABLE Projets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL,
    description TEXT,
    id_categorie INT,
    id_sous_categorie INT,
    id_user INT,
    FOREIGN KEY (id_categorie) REFERENCES Categories(id),
    FOREIGN KEY (id_sous_categorie) REFERENCES SousCategories(id),
    FOREIGN KEY (id_user) REFERENCES Utilisateurs(id)
);
```

---

### Diagramme UML

Le diagramme UML représente les relations **1:1**, **1:N** et **N:M** entre les entités.

---

## Bonnes pratiques
1. **Indexation** :
   - Ajout d'index sur les clés étrangères pour améliorer les performances.
   ```sql
   CREATE INDEX idx_projets_categorie ON Projets(id_categorie);
   ```

2. **Contraintes d'intégrité** :
   - Utilisation des clés étrangères pour garantir la cohérence des données.

3. **Sécurité des mots de passe** :
   - Utilisation de **bcrypt** pour le hachage.

---

## Liens utiles
- **Documentation MySQL** : [MySQL Reference](https://dev.mysql.com/doc/)
- **Outils UML** : [Lucidchart](https://www.lucidchart.com/), [Draw.io](https://app.diagrams.net/)

