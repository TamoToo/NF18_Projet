#!/usr/bin/python3

from datetime import datetime



def quote(s):
    if s:
        return '\'%s\'' % s
    else:
        return 'NULL'

def connection(conn):
    username = quote(input("Username : "))
    password = quote(input("Password : "))
    # Connect, execute SQL, close
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
    # Connect, execute SQL, close
    cur = conn.cursor()
    sql = f"INSERT INTO ressource VALUES ({id}, {titre}, {date_apparition}, {editeur}, {genre}, {code_classification})"
    cur.execute(sql)
    conn.commit()