INSERT INTO Ressource VALUES (1, 'star wars', TO_DATE('1999-05-16', 'YYYY-MM-DD'), 'presses de la cité', 'science-fiction',  147 );
INSERT INTO Ressource VALUES (2, 'harry potter', TO_DATE('1997-06-26', 'YYYY-MM-DD'), 'gallimard jeunesse', 'fantaisie',  187 );
INSERT INTO Ressource VALUES (4, 'symphonie de beethoven', TO_DATE('2000-06-26', 'YYYY-MM-DD'), 'musiqueclassique', 'classique',  777 );


INSERT INTO Livre VALUES (2, 48756, 'histoire, se situant dans les années 1990, raconte la jeunesse de Harry Potter, sorcier orphelin élevé sans affection ni considération par la seule famille vivante qui lui reste : son oncle et sa tante moldus (sans pouvoirs magiques). Le garçon découvre son identité de sorcier, son héritage tragique et la responsabilité qui lui revient', 'anglais');

INSERT INTO Musique VALUES (4,'15:02:00');

INSERT INTO Film VALUES (1,'L"histoire de Star Wars se déroule dans une galaxie qui est le théâtre d"affrontements entre les Chevaliers Jedi et les Seigneurs noirs des Sith, personnes sensibles à la Force, un champ énergétique mystérieux leur procurant des pouvoirs psychiques. Les Jedi maîtrisent le Côté lumineux de la Force, pouvoir bénéfique et défensif, pour maintenir la paix dans la galaxie. Les Sith utilisent le Côté obscur, pouvoir nuisible et destructeur, pour leurs usages personnels et pour dominer la galaxie','01:36:00', 'français');


INSERT INTO Contributeur VALUES (1, 'verne', 'jules', TO_DATE('1828-08-08', 'YYYY-MM-DD'), 'français');
INSERT INTO Contributeur VALUES (4, 'mozart', 'johannes', TO_DATE('1828-08-08', 'YYYY-MM-DD'), 'autrichien');
INSERT INTO Contributeur VALUES (2, 'dicaprio', 'leonardo', TO_DATE('1974-11-11', 'YYYY-MM-DD'), 'américain');

INSERT INTO Exemplaire VALUES (1, TRUE, 'neuf');
INSERT INTO Exemplaire VALUES (2, TRUE, 'bon');
INSERT INTO Exemplaire VALUES (4, TRUE, 'perdu');





INSERT INTO Interprete VALUES (4,2);
INSERT INTO Compositeur VALUES (4,1);

INSERT INTO Auteur VALUES (2, 2);

INSERT INTO Acteur VALUES (1,1);

INSERT INTO Realisateur VALUES (1,1);




INSERT INTO Personne VALUES ('jules.verne@etu.utc.fr', 'verne', 'jules', 'rue de la paix');
INSERT INTO Personne VALUES ('jacques.chirac@etu.utc.fr', 'chirac', 'jacques', 'avenue de la république');

INSERT INTO Adherent VALUES ('jules.verne@etu.utc.fr', TO_DATE('1828-02-08', 'YYYY-MM-DD'), 0667897621, 'ze154d' );

INSERT INTO Personnel VALUES ('jacques.chirac@etu.utc.fr', 'directeur');

INSERT INTO Compte_Utilisateur VALUES ('verneju','jules.verne@etu.utc.fr', 'azerty123');


INSERT INTO Pret VALUES (2, 'jules.verne@etu.utc.fr', TO_DATE('2015-02-08', 'YYYY-MM-DD'), 7);
INSERT INTO Retard VALUES (1, 4, 'jules.verne@etu.utc.fr');
INSERT INTO Deterioration VALUES (1, 'abimé', 0, 'jules.verne@etu.utc.fr');
