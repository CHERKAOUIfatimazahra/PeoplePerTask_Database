
-- Table d'utilisateur
CREATE TABLE users (
	UserID INT NOT NULL auto_increment,
    UserName unique VARCHAR(100),
    Password VARCHAR(100),
    EmailAddress unique VARCHAR(100),
    OtherRelevantInformation VARCHAR(100),
    PRIMARY KEY (UserID)
   );

-- Insertion des donnees dans le tableau des utilisateurs   
INSERT INTO users (UserName, Password, EmailAddress, OtherRelevantInformation)
VALUES 
    ('JohnDoe', 'password123', 'john.doe@example.com', 'Some relevant information'),
    ('JaneSmith', 'pass456', 'jane.smith@example.com', 'More details'),
    ('BobJohnson', 'bobpass', 'bob.johnson@example.com', 'Additional user details'),
    ('AliceWilliams', 'alicepass', 'alice.williams@example.com', 'More information about Alice');

-- Table des Temoignages
 CREATE TABLE Testimonials(
    ID_Temoignage INT PRIMARY KEY auto_increment,
    Comment varchar(100),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- Insertion des donnees dans le tableau des temoignages
INSERT INTO Testimonials (Comment, UserID)
VALUES 
    ('Great service!', 1),
    ('Very satisfied with the freelancer!', 2),
    ('Excellent work on my project!', 3),
    ('Highly recommend this platform!', 4);

-- Table des Freelancers    
CREATE TABLE Freelancers (
    Freelance_ID INT PRIMARY KEY auto_increment,
    NameFreelancer varchar(100),
    SKILLS varchar(100),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- Insertion des donnees dans le tableau des freelancers
INSERT INTO Freelancers (NameFreelancer, SKILLS, UserID)
VALUES 
    ('JohnDoe', 'Web Development', 1),
    ('JaneSmith', 'Graphic Design', 2),
    ('BobJohnson', 'Digital Marketing', 3),
    ('AliceWilliams', 'Writing', 4);

-- Table des Categories
CREATE TABLE categories (
    Category_ID INT PRIMARY KEY auto_increment,
    CategoryName VARCHAR(100)
);

-- Insertion dans la table des catégories
INSERT INTO categories (CategoryName)
VALUES 
    ('Web Development'),
    ('Graphic Design'),
    ('Digital Marketing'),
    ('Writing');

-- Table des Sous-Categories
CREATE TABLE sub_Categories (
    sub_Category_ID INT PRIMARY KEY auto_increment,
    sub_category_Name VARCHAR(100),
    Category_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES categories(Category_ID)
);

-- Insertion dans la table des sous-categories
INSERT INTO sub_Categories (sub_category_Name, Category_ID)
VALUES 
    ('Frontend Development', 1),
    ('Backend Development', 1),
    ('Logo Design', 2),
    ('Social Media Marketing', 3),
    ('Content Writing', 4);

-- Table des Projets
CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY NOT NULL auto_increment,
    Project_Title varchar(100),
    Descrip_project varchar(100),
    Category_ID INT,
    sub_Category_ID INT,
    UserID INT,
    FOREIGN KEY (Category_ID) REFERENCES categories(Category_ID),
    FOREIGN KEY (sub_Category_ID) REFERENCES sub_Categories(sub_Category_ID),
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

-- Insertion dans la table des projets
INSERT INTO Projects (Project_Title, Descrip_project, Category_ID, sub_Category_ID, UserID)
VALUES 
    ('Responsive Website', 'Develop a responsive website for a client', 1, 1, 1),
    ('Logo Redesign', 'Redesign the company logo', 2, 3, 2),
    ('Social Media Campaign', 'Create and manage a social media campaign', 3, 4, 3),
    ('Blog Content Creation', 'Write engaging blog posts', 4, 5, 4);

-- Table des Offres
CREATE TABLE Offres (
    Offre_ID INT PRIMARY KEY auto_increment,
    Amount INT,
    Deadline DATE,
    Freelance_ID INT,
    Project_ID INT,
    FOREIGN KEY (Freelance_ID) REFERENCES Freelancers(Freelance_ID),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

-- Insertion dans la table des offres
INSERT INTO Offres (Amount, Deadline, Freelance_ID, Project_ID)
VALUES 
    (50, '2020-01-14', 1, 1),
    (2, '2023-01-07', 2, 2),
    (80, '2021-12-21', 3, 3),
    (100, '2023-01-10', 4, 4);

-- select l'utilisateur qui a le nom 'AliceWilliams' avec  Password, EmailAddress et OtherRelevantInformation 
    -- SELECT * FROM users
    -- WHERE UserID = 3;  

-- select OtherRelevantInformation qui sont inferieur a 20
    -- SELECT * FROM users
    -- where CHAR_LENGTH(OtherRelevantInformation) > 20;

-- update un nom d'utilisateur 
    -- update users 
    -- SET UserName = 'FATIMA ZAHRA'
    -- WHERE UserID = 3;

-- supprime un commentaire d'un utilisatuer 
    -- DELETE FROM testimonials 
    -- WHERE ID_Temoignage = 4;

-- ALTER in tabales
    -- ALTER TABLE categories ADD created_at TIMESTAMP ;
    -- ALTER TABLE categories ADD updated_at TIMESTAMP ;
    -- ALTER TABLE categories ADD updated_by VARCHAR(100) ;
    -- ALTER TABLE categories ADD created_by VARCHAR(100) ;

    -- ALTER TABLE freelancers ADD created_at TIMESTAMP ;
    -- ALTER TABLE freelancers ADD updated_at TIMESTAMP ;
    -- ALTER TABLE freelancers ADD updated_by VARCHAR(100) ;
    -- ALTER TABLE freelancers ADD created_by VARCHAR(100) ;

    -- ALTER TABLE offres ADD created_at TIMESTAMP ;
    -- ALTER TABLE offres ADD updated_at TIMESTAMP ;
    -- ALTER TABLE offres ADD updated_by VARCHAR(100) ;
    -- ALTER TABLE offres ADD created_by VARCHAR(100) ;

    -- ALTER TABLE sub_categories ADD created_at TIMESTAMP ;
    -- ALTER TABLE sub_categories ADD updated_at TIMESTAMP ;
    -- ALTER TABLE sub_categories ADD updated_by VARCHAR(100) ;
    -- ALTER TABLE sub_categories ADD created_by VARCHAR(100) ;

    -- ALTER TABLE testimonials ADD created_at TIMESTAMP ;
    -- ALTER TABLE testimonials ADD updated_at TIMESTAMP ;
    -- ALTER TABLE testimonials ADD updated_by VARCHAR(100) ;
    -- ALTER TABLE testimonials ADD created_by VARCHAR(100) ;