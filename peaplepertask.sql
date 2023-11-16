
create table users (
	UserID INT NOT NULL auto_increment,
    UserName VARCHAR(100),
    Password VARCHAR(100),
    EmailAddress VARCHAR(100),
    OtherRelevantInformation VARCHAR(100),
    PRIMARY KEY (UserID)
   );

 CREATE TABLE Temoignages (
    ID_Temoignage INT PRIMARY KEY,
    Commentaire varchar(100),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

CREATE TABLE Freelancers (
    FreelanceID INT PRIMARY KEY,
    NameFreelancer varchar(100),
    SKILLS varchar(100),
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- CREATE TABLE Offres (
--     Offre_ID INT PRIMARY KEY,
--     Montant DECIMAL(10, 2),
--     Delai INT,
--     FOREIGN KEY (FreelanceID) REFERENCES Freelances(FreelanceID),
--     FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
-- );

CREATE TABLE categories (
    Category_ID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

CREATE TABLE sub_Categories (
    sub_Category_ID INT PRIMARY KEY,
    Nom_Sous_Categorie VARCHAR(100),
    ID_Categorie INT,
    FOREIGN KEY (ID_Categorie) REFERENCES Categories(ID_Categorie)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY NOT NULL auto_increment,
    ProjectTitle varchar(100),
    Descrip_project varchar(100),
    FOREIGN KEY (UserID) REFERENCES users(UserID)
    FOREIGN KEY (UserID) REFERENCES users(UserID)
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);