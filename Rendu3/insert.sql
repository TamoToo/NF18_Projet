INSERT INTO Ressource VALUES (1, 'star wars',TO_DATE('1999-05-16', 'YYYY-MM-DD'), 'presses de la cité', 'science-fiction',  147 );
INSERT INTO Ressource VALUES (2, 'harry potter',TO_DATE('1997-06-26', 'YYYY-MM-DD'), 'gallimard jeunesse', 'fantaisie',  187 );
INSERT INTO Ressource VALUES (4, 'symphonie de beethoven',TO_DATE('2000-06-26', 'YYYY-MM-DD'), 'musiqueclassique', 'classique',  777 );


INSERT INTO Livre VALUES (2, 48756, 'histoire, se situant dans les années 1990, raconte la jeunesse de Harry Potter, sorcier orphelin élevé sans affection ni considération par la seule famille vivante qui lui reste : son oncle et sa tante moldus (sans pouvoirs magiques). Le garçon découvre son identité de sorcier, son héritage tragique et la responsabilité qui lui revient', 'anglais');

INSERT INTO Musique VALUES (4,'15:02:00');

INSERT INTO Film VALUES (1,'L"histoire de Star Wars se déroule dans une galaxie qui est le théâtre d"affrontements entre les Chevaliers Jedi et les Seigneurs noirs des Sith, personnes sensibles à la Force, un champ énergétique mystérieux leur procurant des pouvoirs psychiques. Les Jedi maîtrisent le Côté lumineux de la Force, pouvoir bénéfique et défensif, pour maintenir la paix dans la galaxie. Les Sith utilisent le Côté obscur, pouvoir nuisible et destructeur, pour leurs usages personnels et pour dominer la galaxie','01:36:00', 'français');


INSERT INTO Contributeur VALUES (1, 'verne', 'jules', TO_DATE('1828-08-08', 'YYYY-MM-DD'), 'français');
INSERT INTO Contributeur VALUES (2, 'mozart', 'johannes', TO_DATE('1828-08-08', 'YYYY-MM-DD'), 'autrichien');



INSERT INTO Compositeur VALUES (2,7);

INSERT INTO Interprete VALUES (2,7);


INSERT INTO Acteur VALUES (4,3);


INSERT INTO Realisateur VALUES (6,3);



INSERT INTO Ecrivain VALUES (1, 2);


INSERT INTO Utilisateur VALUES ('richard.duchateau@bibli-compiegne.fr', 'duchateau', 'richard', TO_DATE('19550914','YYYYMMDD'), '30 Rue des Peupliers 60200 Compiègne');

INSERT INTO CompteUtilisateur VALUES ('riducha','Xxx','richard.duchateau@bibli-compiegne.fr', 'duchateau', 'richard');


INSERT INTO Membre VALUES ('richard.duchateau@bibli-compiegne.fr', 'duchateau', 'richard');

INSERT INTO Adherent VALUES ('richard.duchateau@laposte.fr', 'duchateau', 'richard', '1', NULL, '1', 0667897621);

INSERT INTO Exemplaire VALUES (1,'3.44','neuf','1',1);


INSERT INTO Pret VALUES (1,TO_DATE('1828-08-08', 'YYYY-MM-DD'),'paul.russel@gmail.com','russel','paul',25,'retard',21,NULL,NULL,'0');
