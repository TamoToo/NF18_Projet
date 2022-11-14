INSERT INTO Ressource VALUES (1, 'top gun', TO_DATE('1986-09-17', 'YYYY-MM-DD'), 'paramount pictures', 'action',  115 );
INSERT INTO Ressource VALUES (2, 'harry potter', TO_DATE('1997-06-26', 'YYYY-MM-DD'), 'gallimard jeunesse', 'fantaisie',  299 );
INSERT INTO Ressource VALUES (4, 'tchikita', TO_DATE('2016-09-19', 'YYYY-MM-DD'), 'jul', 'rap',  334 );


INSERT INTO Livre VALUES (2, 34573, 'Harry Potter est un garçon ordinaire. Mais, le jour de ses onze ans, son existence bascule : un géant vient le chercher pour l emmener dans une école de sorciers. Voler à cheval sur des balais, jeter des sorts, combattre les Trolls: Harry Potter se révèle être un sorcier vraiment doué.', 'anglais');

INSERT INTO Musique VALUES (4,'15:02:00');

INSERT INTO Film VALUES (1,'Dans l océan Indien à la fin des années 1980, durant les dernières années de la guerre froide. Au cours d une patrouille aérienne de routine, deux chasseurs F-14 Tomcat de l US Navy embarqués sur le porte-avions USS Enterprise rencontrent deux chasseurs MiG-28 soviétiques, au comportement hostile. Les pilotes américains parviennent à mettre les avions soviétiques en fuite mais le leader de la formation, Bill « Cougar » Cortell, se retrouve en état de choc à la suite de l accrochage. Le pilote de l autre appareil américain, Pete « Maverick » Mitchell — un aviateur avec un tempérament de « chien fou », peu apprécié de sa hiérarchie et marqué par la disparition en vol de son père, le 5 novembre 1965, lors de la guerre du Viêt Nam — retourne alors chercher Cougar, malgré les ordres reçus et le manque de kérosène de son avion, et l aide à se poser sur le porte-avions.','01:40:00', 'français');


INSERT INTO Contributeur VALUES (1, 'cruise', 'tom', TO_DATE('1862-07-03', 'YYYY-MM-DD'), 'americain');
INSERT INTO Contributeur VALUES (4, 'mari', 'julien', TO_DATE('1990-01-14', 'YYYY-MM-DD'), 'francais');
INSERT INTO Contributeur VALUES (2, ' Rowling', 'J.K.', TO_DATE('1965-07-31', 'YYYY-MM-DD'), 'britannique');

INSERT INTO Exemplaire VALUES (1, TRUE, 'neuf');
INSERT INTO Exemplaire VALUES (2, TRUE, 'bon');
INSERT INTO Exemplaire VALUES (4, TRUE, 'perdu');





INSERT INTO Interprete VALUES (4,4);
INSERT INTO Compositeur VALUES (4,4);

INSERT INTO Auteur VALUES (2, 2);

INSERT INTO Acteur VALUES (1,1);

INSERT INTO Realisateur VALUES (1,1);




INSERT INTO Personne VALUES ('tom.cruise@etu.utc.fr', 'cruise', 'tom', 'rue de l avion');
INSERT INTO Personne VALUES ('tom.holland@etu.utc.fr', 'holland', 'tom', 'avenue de l araignée');

INSERT INTO Adherent VALUES ('tom.cruise@etu.utc.fr', TO_DATE('1862-07-03', 'YYYY-MM-DD'), 0669354585, 'zebi13' );

INSERT INTO Personnel VALUES ('tom.holland@etu.utc.fr', 'directeur');

INSERT INTO Compte_Utilisateur VALUES ('cruisetom','tom.cruise@etu.utc.fr', 'tomi60200');


INSERT INTO Pret VALUES (2, 'tom.cruise@etu.utc.fr', TO_DATE('2013-02-07', 'YYYY-MM-DD'), 3);
INSERT INTO Retard VALUES (1, 4, 'tom.cruise@etu.utc.fr');
INSERT INTO Deterioration VALUES (1, 'abimé', 0, 'tom.cruise@etu.utc.fr');
