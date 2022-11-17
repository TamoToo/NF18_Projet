"Renvoie la liste des personnes ayant emprunter un livre entre le 11/02/2001 et le 11/02/2022"

"Renvoie le nombre de livre empruntés par Tom Holland" 

"Renvoie le nombre de personne ayant emprunté le film top gun"

"Renvoie la liste des personnes ayant eu des sanctions"

"Renvoie la liste des personnes ayant eu des sanctions triés par le nombre de jours de retard le plus élevé"

" Classement des ressources empruntées de la plus empruntée à la moins empruntée "

SELECT COUNT(*) AS Nombre_d_emprunt,R.titre
FROM Ressource R
INNER JOIN Exemplaire E ON E.ressource = R.code
INNER JOIN Pret P ON P.code = E.code
GROUP BY R.code 
ORDER BY COUNT(*) DESC;

"En combien d'exemplaires disponibles existe une ressource donnée (ici la ressource 1) "

SELECT COUNT(*) AS nb_exemplaires_dispo_ressource1
FROM Exemplaire
WHERE Exemplaire.ressource = 1 AND Exemplaire.disponibilite = '1';

"Modifier le synopsis d’un film ( = description d’une ressource) "
UPDATE Film
SET synopsis = 'ceci est un synopsis'
WHERE Film.code = '3';

"Regarder le synopsis d'un film "
SELECT synopsis 
FROM Film 
WHERE Film.code = '3';

