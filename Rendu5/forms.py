#!/usr/bin/python3

from datetime import datetime
import reports
import psycopg2


def quote(s):
    if s:
        return '\'%s\'' % s
    else:
        return 'NULL'

def connection(conn):
    username = quote(input("Username : "))
    password = quote(input("Password : "))
    # Connect, execute SQL and commit
    cur = conn.cursor()
    sql = f"SELECT * FROM Compte_Utilisateur WHERE user_login = {username} AND pass = {password}"
    cur.execute(sql)
    conn.commit()
    res = cur.fetchone()
    if not res:
        print("Utilisateur ou mot de passe incorrect")
        return None
    print("Connexion réussie")
    info = {'email': res[1]}
    sql = f"SELECT role_employee FROM Personnel WHERE email = '{res[1]}'"
    cur.execute(sql)
    conn.commit()
    res = cur.fetchone()
    info['role'] = res[0] if res else 'adhérent'
    return info

def addRessource(conn):
    id = int(input("id: "))
    titre = quote(input("Titre : "))
    date_apparition = quote(datetime.strptime(input("Date de parution (YYYY-MM-DD): "), "%Y-%m-%d").date())
    editeur = quote(input("Editeur : "))
    genre = quote(input("Genre : "))
    code_classification = quote(input("Code de classification : "))
    # Connect, execute SQL and commit
    cur = conn.cursor()
    sql = f"INSERT INTO ressource VALUES ({id}, {titre}, {date_apparition}, {editeur}, {genre}, {code_classification})"
    cur.execute(sql)
    conn.commit()

def addAdherent(conn):
    email = quote(input("Email : "))
    nom = quote(input("Nom : "))
    prenom = quote(input("Prénom : "))
    adresse = quote(input("Adresse : "))
    date_naissance = quote(datetime.strptime(input("Date de naissance (YYYY-MM-DD): "), "%Y-%m-%d").date())
    telephone = quote(input("Numéro de téléphone : "))
    carte = quote(input("Carte : "))
    suspension = quote(input("Suspension : "))
    blacklist = quote(input("Blacklisté : "))
    # Connect, execute SQL and commit
    cur = conn.cursor()
    sql = f"INSERT INTO Personne VALUES ({email}, {nom}, {prenom}, {adresse})"
    cur.execute(sql)
    sql = f"INSERT INTO Adherent VALUES ({email}, {date_naissance}, {telephone}, {carte}, {suspension}, {blacklist})"
    cur.execute(sql)
    conn.commit()

def blacklistAdherent(conn):
    email = quote(input("Email : "))
    val = input("Blacklisté (o/n) : ")
    # Connect, execute SQL and commit
    cur = conn.cursor()
    if val == 'o':
        sql = f"UPDATE Adherent SET blacklist = TRUE WHERE email = {email}"
    else:
        sql = f"UPDATE Adherent SET blacklist = FALSE WHERE email = {email}"
    cur.execute(sql)
    conn.commit()

def emprunterRessource(conn, email):
    cur = conn.cursor()
    sql = f"SELECT blacklist FROM Adherent WHERE email = '{email}'"
    cur.execute(sql)
    conn.commit()
    res = cur.fetchone()
    if res[0] == "True":
        print("Vous êtes blacklisté")
        return
    #reports.printRessourcesDisponible(conn)
    print("Ressource à emprunter :")
    id = int(input("id: "))
    nb_jours = int(input("Nombre de jours : "))
    # Connect, execute SQL and commit
    sql = f"INSERT INTO Pret VALUES ({id}, '{email}', CURRENT_DATE, {nb_jours})"
    try:
        cur.execute(sql)
        conn.commit()
    except psycopg2.Error as e:
        print("Erreur : ", e)
        conn.rollback()