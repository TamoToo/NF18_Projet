DROP TABLE IF EXISTS Ressource, Film, Livre, Musique, Contributeur, Exemplaire, Personne, Adherent, Personnel, Deterioration, Retard, Pret, Compte_Utilisateur, Interprete, Compositeur, Auteur, Realisateur, Acteur;
DROP TYPE IF EXISTS ETAT;


CREATE TYPE ETAT AS ENUM('neuf', 'bon', 'abimé', 'perdu');

CREATE TABLE Ressource (
	code INTEGER PRIMARY KEY,
	titre VARCHAR NOT NULL,
	date_apparition DATE NOT NULL,
	editeur VARCHAR,
	genre VARCHAR,
	code_classification INTEGER UNIQUE NOT NULL,
    CHECK (code_classification>0 and code_classification<1000)
);

CREATE TABLE Film (
    code INTEGER PRIMARY KEY,
    synopsis VARCHAR,
    duree TIME NOT NULL,
    langue VARCHAR,
    FOREIGN KEY (code) REFERENCES Ressource(code)
);

CREATE TABLE Livre (
    code INTEGER PRIMARY KEY,
    isbn INTEGER UNIQUE,
    résumé VARCHAR,
    langue VARCHAR,
    FOREIGN KEY (code) REFERENCES Ressource(code)
);

CREATE TABLE Musique (
    code INTEGER PRIMARY KEY,
    duree TIME NOT NULL,
    FOREIGN KEY (code) REFERENCES Ressource(code)
);

CREATE TABLE Contributeur(
    id INTEGER PRIMARY KEY,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    nationalite VARCHAR,
    FOREIGN KEY (id) REFERENCES Ressource(code)
);

CREATE TABLE Exemplaire(
    code_ressource INTEGER PRIMARY KEY,
    disponibilité BOOLEAN NOT NULL,
    etat ETAT,
    FOREIGN KEY (code_ressource) REFERENCES Ressource(code)
);

CREATE TABLE Personne(
    email VARCHAR PRIMARY KEY,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    adresse VARCHAR
);

CREATE TABLE Adherent(
    email VARCHAR PRIMARY KEY,
    date_naissance DATE NOT NULL,
    téléphone INTEGER,
    carte VARCHAR NOT NULL,
    FOREIGN KEY (email) REFERENCES Personne(email)
);

CREATE TABLE Personnel(
    email VARCHAR PRIMARY KEY,
    role_employee VARCHAR NOT NULL,
    FOREIGN KEY (email) REFERENCES Personne(email)
);

CREATE TABLE Deterioration(
    id INTEGER PRIMARY KEY,
    nv_etat ETAT,
    cout INTEGER,
    adhérent VARCHAR,
    FOREIGN KEY (adhérent) REFERENCES Adherent(email)
);

CREATE TABLE Retard(
    id INTEGER PRIMARY KEY,
    nb_jours INTEGER,
    adhérent VARCHAR,
    FOREIGN KEY (adhérent) REFERENCES Adherent(email)
);

CREATE TABLE Pret(
    code INTEGER,
    adhérent VARCHAR,
    date_pret DATE NOT NULL,
    nb_jours INTEGER NOT NULL,
    FOREIGN KEY (code) REFERENCES Exemplaire(code_ressource),
    FOREIGN KEY (adhérent) REFERENCES Adherent(email),
    PRIMARY KEY(code, adhérent, date_pret)
);

CREATE TABLE Compte_Utilisateur(
    user_login VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    pass VARCHAR(32) NOT NULL,
    FOREIGN KEY (email) REFERENCES Adherent(email),
    PRIMARY KEY(user_login, email)
);

CREATE TABLE Interprete(
    code INTEGER,
    id INTEGER,
    FOREIGN KEY (code) REFERENCES Musique(code),
    FOREIGN KEY (id) REFERENCES Contributeur(id),
    PRIMARY KEY(code, id)
);

CREATE TABLE Compositeur(
    code INTEGER,
    id INTEGER,
    FOREIGN KEY (code) REFERENCES Musique(code),
    FOREIGN KEY (id) REFERENCES Contributeur(id),
    PRIMARY KEY(code, id)
);

CREATE TABLE Auteur(
    code INTEGER,
    id INTEGER,
    FOREIGN KEY (code) REFERENCES Livre(code),
    FOREIGN KEY (id) REFERENCES Contributeur(id),
    PRIMARY KEY(code, id)
);

CREATE TABLE Realisateur(
    code INTEGER,
    id INTEGER,
    FOREIGN KEY (code) REFERENCES Film(code),
    FOREIGN KEY (id) REFERENCES Contributeur(id),
    PRIMARY KEY(code, id)
);

CREATE TABLE Acteur(
    code INTEGER,
    id INTEGER,
    FOREIGN KEY (code) REFERENCES Film(code),
    FOREIGN KEY (id) REFERENCES Contributeur(id),
    PRIMARY KEY(code, id)
);