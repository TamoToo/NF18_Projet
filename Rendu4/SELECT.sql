--"Afficher les ressources disponibles"
SELECT titre FROM Ressources 
JOIN Exemplaire ON Exemplaire.code = Ressource.code 
WHERE disponibilité = TRUE;

--"Renvoie le nombre de livre empruntés par Tom Holland" 
SELECT COUNT(*) FROM Ressources 
JOIN Ressources ON Ressources.code = Pret.code 
JOIN Adhérent ON Adhérent.email = Pret.adhérent
JOIN Personne ON Personne.email = Adhérent.email 
WHERE nom = Holland AND prenom = Tom

--"Renvoie le nombre de personne ayant emprunté le film top gun"
SELECT COUNT(*) FROM Adhérent 
JOIN Pret ON Pret.adhérent = Adhérent.email
JOIN Ressources ON Ressources.code = Pret.code
WHERE Ressources.titre = "top gun" 


--"Renvoie la liste des personnes ayant perud l'article empreinté"
SELECT nom , prenom FROM Personne 
JOIN Adhérent ON Adhérent.email = Personne.email
JOIN Deterioration ON deterioration.adhérent = Adhérent.email 
WHERE Deterioration.nv_etat = perdu

--"Renvoie la liste des personnes ayant eu des jours de retards, triés par le nombre de jours de retard le plus élevé au moins élevé"
SELECT nom , prenom FROM Personne 
JOIN Adhérent ON Adhérent.email = Personne.email 
JOIN Retard ON Retard.email = Adhérent.email
WHERE nb_jours > 0
ORDER BY nb_jours DESC;

--"Renvoie le nombre de jours de retards maximal"
SELECT max(nb_jours) FROM Retard;

--"Renvoie la proportion des personnes suspendu"
SELECT  COUNT(suspendu)/COUNT(*) FROM Adhérent WHERE suspendu = TRUE;

--"Revnoie la moyenne des jours de retards"
SELECT AVG(nb_jours) FROM Retard;
 
--"Classement des ressources empruntées de la plus empruntée à la moins empruntée "

SELECT COUNT(*) AS Nombre_d_emprunt,R.titre
FROM Ressource R
INNER JOIN Exemplaire E ON E.ressource = R.code
INNER JOIN Pret P ON P.code = E.code
GROUP BY R.code 
ORDER BY COUNT(*) DESC;

--"En combien d'exemplaires disponibles existe une ressource donnée (ici la ressource 1) "

SELECT COUNT(*) AS nb_exemplaires_dispo_ressource1
FROM Exemplaire
WHERE Exemplaire.ressource = 1 AND Exemplaire.disponibilite = TRUE;

--"Modifier le synopsis d’un film ( = description d’une ressource) "
UPDATE Film
SET synopsis = 'ceci est un synopsis'
WHERE Film.code = '3';

--"Regarder le synopsis d'un film "
SELECT synopsis 
FROM Film 
WHERE Film.code = '3';

