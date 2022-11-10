# MODELE LOGIQUE DE DONNEES (MLD)

>## RELATIONS:

- Ressource(#code:integer, titre:string NOT NULL, date_apparition:date, editeur:string, genre:string, code_classification:integer) avec code_classification key
 
    # Contrainte: pour toute ressource il existe au moins un exemplaire ce qui se traduit par:
        - Projection(Ressource,code)=Projection(Exemplaire,code)

- Film(#code=>Ressource, langue:string, durée: time, synopsis:text)

- Livre(#code=>Ressource, isbn:integer NOT NULL, résumé:string, langue:string)

- Musique(#code=>Ressource, durée: time)

- Contributeur(#id:integer, nom:string NOT NULL, prénom:string NOT NULL, date_de_naissance:date NOT NULL, nationalité:string)

- Exemplaire(#code => Ressource , disponibilité:boolean, etat: {neuf | bon | abîmé | perdu})

- Personne(#email : string , nom:string, prenom : string , adresse : string)

    #Contrainte : Un utilisateur est forcément un membre ou un adhérent, et il ne peut pas être les deux. Ce qui se traduit par:
        - Intersection (projection(Personne, email),projection(Personnel,email) ) = { }
        - Projection(Personnel, email) = projection(Adhérent, email) union projection(Personnel,email)
****
- Adhérent(#email => Personne, date_de_naissance : date NOT NULL, telephone : integer , carte : string) 

- Personnel(#email => Personne,role_employe : string) 

- Prêt(#code=>Exemplaire, #adhérent=>Adhérent, #date:date NOT NULL, durée:integer NOT NULL)

- Détérioration(#id : integer , nv_etat: {neuf | bon | abîmé | perdu}, coût : integer , adhérent => Adhérent)

- Retard(#id : integer , nb_jours : integer , adhérent => Adhérent)

- Compte_Utilisateur(#login : string ,#email => Personne ,  mdp : string  NOT NULL)  avec login local key

- Interprete (#code => Musique, #id => Contributeur)
    #Contrainte: il y a forcément un interprète
        -projection(Musique,code)=projection(Interprete,code)

- Compositeur (#code => Musique, #id => Contributeur)
    #Contrainte: il y a forcément un compositeur pour un enregistrement
        - projection(Musique,code)=projection(Compositeur,code)

- Auteur (#code => Livre, #id => Contributeur)
    # Contrainte: il y a forcément un Auteur pour un livre
        - projection(Livre,code)=projection(Auteur,code)

- Realisateur (#code => Film, #id => Contributeur)
    #Contrainte: il y a forcément un réalisateur pour un film
        - projection(Film,code)=projection(Realisateur,code)

- Acteur (#code => Film, #id => Contributeur)

_Transformez Réservation comme une classe d'association avec date local key également_

- Réservation(#code=> Exemplaire,#adhérent=>Adhérent, #date:date )

### Commentaire
Ici pour la **transformation de Ressource**, on note : classe mère abstraite, héritage presque complet, association N:M sur la classe mère.
L'héritage par les classes filles est donc exclu, on choisit donc l'héritage par référence.

On souhaite représenter le fait qu’une **sanction peut être un retard, une deterioration  ou les deux**, donc nous ne pouvons pas utiliser l’héritage par la classe fille car on ne pourrait pas représenter le cas où ce sont les deux avec les clés que nous avons défini. Grâce aux clés défini les clés  dans les classes filles on choisit un heritage par référence.

Pour l'héritage Personne avec adhérent et personnel: on utilise de même l’héritage par référence de la classe fille vers la mère.
__
### Contraintes 
Un héritage exclusif est présent pour la classe Ressource : une ressource est soit une Musique soit un Film ou soit un Livre. Contrainte: 
 On a ainsi 
 - Intersection (projection(Film,code),projection(Livre,code),projection(Musique,code) ) ={ }
 - Projection(Ressource,code)= projection(Film,code) union projection(Livre,code) union projection(Musique,code)

_Après il y a des relations issues des association -1.. (qui est votre cas) et des relations issues des classes d'association (qui est votre cas aussi pour Prêt et Réservation)_
