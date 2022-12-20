/*"Faire deux requête avec les contraintes"

"Genre soustraire la date de fin et la date de debut"*/


--"Afficher les ressources disponibles"
SELECT titre FROM Ressource 
JOIN Exemplaire ON Exemplaire.code_ressource = Ressource.code 
WHERE disponibilite = TRUE;

--"Renvoie le nombre de livre empruntes par Tom Holland" 
SELECT COUNT(*) FROM Ressource 
JOIN Pret ON Ressource.code = Pret.code 
JOIN Adherent ON Adherent.email = Pret.adherent
JOIN Personne ON Personne.email = Adherent.email 
WHERE Personne.nom = "holland" AND Personne.prenom = "tom";

--"Renvoie le nombre de personne ayant emprunte le film top gun"
SELECT COUNT(*) FROM Adherent 
JOIN Pret ON Pret.adherent = Adherent.email
JOIN Ressource ON Ressource.code = Pret.code
WHERE Ressource.titre = "top gun"; 


--"Renvoie la liste des personnes ayant perud l'article empreinte"
SELECT nom , prenom FROM Personne 
JOIN Adherent ON Adherent.email = Personne.email
JOIN Deterioration ON deterioration.adherent = Adherent.email 
WHERE Deterioration.nv_etat = "perdu";

--"Renvoie la liste des personnes ayant eu des jours de retards, tries par le nombre de jours de retard le plus eleve au moins eleve"
SELECT nom , prenom FROM Personne 
JOIN Adherent ON Adherent.email = Personne.email 
JOIN Retard ON Retard.adherent = Adherent.email
WHERE nb_jours > 0
ORDER BY nb_jours DESC;

--"Renvoie le nombre de jours de retards maximal"
SELECT max(nb_jours) FROM Retard;

--"Renvoie la proportion des personnes suspendu"
SELECT  COUNT(suspension)/COUNT(*) FROM Adherent WHERE suspension = TRUE;

--"Revnoie la moyenne des jours de retards"
SELECT AVG(nb_jours) FROM Retard;
 
--"Classement des ressources empruntees de la plus empruntee à la moins empruntee "

SELECT COUNT(*) AS Nombre_d_emprunt,R.titre
FROM Ressource R
INNER JOIN Exemplaire E ON E.code_ressource = R.code
INNER JOIN Pret P ON P.code = E.code_ressource
GROUP BY R.code 
ORDER BY COUNT(*) DESC;

--"En combien d'exemplaires disponibles existe une ressource donnee (ici la ressource 1) "

SELECT COUNT(*) AS nb_exemplaires_dispo_ressource1
FROM Exemplaire
WHERE Exemplaire.code_ressource = 1 AND Exemplaire.disponibilite = TRUE;

--"Modifier le synopsis d’un film ( = description d’une ressource) "
UPDATE Film
SET synopsis = 'ceci est un synopsis'
WHERE Film.code = '3';

--"Regarder le synopsis d'un film "
SELECT synopsis 
FROM Film 
WHERE Film.code = '3';

