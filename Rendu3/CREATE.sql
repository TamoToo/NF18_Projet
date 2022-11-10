

CREATE TYPE Etat AS ENUM ('neuf', 'bon', 'abimé', 'perdu');

CREATE TABLE Ressource (
	code PRIMARY KEY,
	titre VARCHAR NOT NULL,
	date DATE NOT NULL,
	editeur VARCHAR,
	genre VARCHAR NOT NULL,
	code_classification INTEGER NOT NULL
);

CREATE TABLE Film (
    code PRIMARY KEY REFERENCES Ressource(code),
    langue VARCHAR NOT NULL,
    duree INTEGER NOT NULL CHECK (duree > 0),
    synopsis VARCHAR NOT NULL
);

CREATE TABLE Livre (
    code PRIMARY KEY REFERENCES Ressource(code),
    isbn VARCHAR NOT NULL,
    résumé VARCHAR NOT NULL,
    langue VARCHAR NOT NULL
);

CREATE TABLE Musique (
    code PRIMARY KEY REFERENCES Ressource(code),
    duree INTEGER NOT NULL CHECK (duree > 0)
);

CREATE TABLE Contributeur(
    id PRIMARY KEY,
    nom VARCHAR NOT NULL,
    prenom VARCHAR NOT NULL,
    date_naissance DATE NOT NULL,
    nationalite VARCHAR NOT NULL
);

CREATE TABLE Exemplaire(
    code_ressource REFERENCES Ressource(code),
    disponibilité BOOLEAN NOT NULL,
    etat ETAT
);



