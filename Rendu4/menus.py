import reports
import forms

def afficherMenuPrincipal(conn):
    choice = 0
    while choice != 3:
        print("1. Se connecter\n"
        "2. Afficher toutes les ressources\n"
        "3. Quitter\n"
        "Choix : ")
        choice = int(input())
        if choice == 1:
            info = forms.connection(conn)
            if info:
                print(f"Vous êtes connecté en tant que {info['role']}")
                return info
        elif choice == 2:
            reports.printAllRessources(conn)
        elif choice == 3:
            print("Au revoir")
            return None
        else:
            print("Choix invalide")

def afficherMenuAdherent(conn, user_info):
    choice = 0
    while True:
        print("1. Afficher mes informations\n"
        "2. Afficher mes ressources\n"
        "3. Quitter\n"
        "Choix : ")
        choice = int(input())
        if choice == 1:
            reports.printAdherent(conn, user_info['email'])
        elif choice == 2:
            reports.printRessources(conn, user_info['email'])
        elif choice == 3:
            print("Au revoir")
            return None
        else:
            print("Choix invalide")


def afficherMenuDirecteur(conn, user_info):
    choice = 0
    while True:
        print("1. Ajouter une ressource\n"
        "2. Afficher tous les adhérents\n"
        "3. Quitter\n"
        "Choix : ")
        choice = int(input())
        if choice == 1:
            forms.addRessource(conn)
        elif choice == 2:
            reports.printAllAdherents(conn)
        elif choice == 3:
            print("Au revoir")
            return None
        else:
            print("Choix invalide")