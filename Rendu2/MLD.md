# MODELE LOGIQUE DE DONNEES (MLD)

>## CLASSES:

- Ressource(#code:integer, titre:string, date_apparition:date, editeur:string, genre:string, code_classification:integer)

- Film(#code=>Ressource, langue:string, durée:integer, synopsis:text)

- Livre(#code=>Ressource, isbn:integer, résumé:string, langue:string)

- Musique(#code=>Ressource, durée:integer)

- Contributeur(#id:integer, nom:string, prénom:string, date_de_naissance:date, nationalité:string)

- Exemplaire(#code => Ressource , disponibilité:boolean, etat: {neuf | bon | abîmé | perdu})

- Personne(#email : string , nom:string, prenom : string , adresse : string)

- Adhérent(#email => Personne, date_de_naissance : date, telephone : integer , carte : string) 

- Personnel(#email => Personne,role_employe : string) 

- Prêt(#code=>Exemplaire, #adhérent=>Adhérent, date:date, durée:integer)

- Détérioration(#id : integer , nv_etat: {neuf | bon | abîmé | perdu}, coût : integer , adhérent => Adhérent)

- Retard(#id : integer , nb_jours : integer , adhérent => Adhérent)

- Compte_Utilisateur(#login : string ,#email => Personne ,  mdp : string)

#### Relations
- Interprete (#code => Musique, #id => Contributeur)

- Compositeur (#code => Musique, #id => Contributeur)

- Auteur (#code => Livre, #id => Contributeur)

- Realisateur (#code => Film, #id => Contributeur)

- Acteur (#code => Film, #id => Contributeur)

### Commentaire
Choix le la méthode d'héritage par référence le choix d'héritage par classe fille n'étant pas judicieux ici.
