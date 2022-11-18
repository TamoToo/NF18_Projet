#!/usr/bin/python3

def printAllRessources(conn):
    # Connect and retrieve data
    cur = conn.cursor()
    sql = "SELECT * FROM ressource"
    cur.execute(sql)
    # Fetch data line by line
    raw = cur.fetchall()
    # Print data
    for row in raw:
        print(f"ID : {row[0]}")
        print(f"Titre : {row[1]}")
        print(f"Date de parution : {row[2]}")
        print(f"Editeur : {row[3]}")
        print(f"Genre : {row[4]}")
        print(f"Code de classification : {row[5]}")
        print()


def printRessources(conn, email):
    # Connect and retrieve data
    cur = conn.cursor()
    sql = f"SELECT * FROM ressource r INNER JOIN pret p ON r.code = p.code WHERE p.adherent = '{email}'"
    cur.execute(sql)
    # Fetch data line by line
    raw = cur.fetchall()
    # Print data
    for row in raw:
        print(f"ID : {row[0]}")
        print(f"Titre : {row[1]}")
        print(f"Date de parution : {row[2]}")
        print(f"Editeur : {row[3]}")
        print(f"Genre : {row[4]}")
        print(f"Code de classification : {row[5]}")
        print()

def printAdherent(conn, email):
    # Connect and retrieve data
    cur = conn.cursor()
    sql = f"SELECT * FROM personne p INNER JOIN adherent a ON p.email = a.email WHERE p.email = '{email}'"
    cur.execute(sql)
    # Fetch data line by line
    raw = cur.fetchone()
    # Print data
    print(f"Email : {raw[0]}")
    print(f"Nom : {raw[1]}")
    print(f"Prénom : {raw[2]}")
    print(f"Adresse : {raw[3]}")
    print(f"Date de naissance : {raw[5]}")
    print(f"Numéro de téléphone : {raw[6]}")
    print(f"Carte : {raw[7]}")
    print(f"Suspension : {raw[8]}")
    print(f"Blacklisté : {raw[9]}")


def printAllAdherents(conn):
    # Connect and retrieve data
    cur = conn.cursor()
    sql = "SELECT * FROM personne p INNER JOIN adherent a ON p.email = a.email"
    cur.execute(sql)
    # Fetch data line by line
    raw = cur.fetchall()
    # Print data
    for row in raw:
        print(row)
        print(f"Email : {row[0]}")
        print(f"Nom : {row[1]}")
        print(f"Prénom : {row[2]}")
        print(f"Adresse : {row[3]}")
        print(f"Date de naissance : {row[5]}")
        print(f"Numéro de téléphone : {row[6]}")
        print(f"Carte : {row[7]}")
        print(f"Suspension : {row[8]}")
        print(f"Blacklisté : {row[9]}")
        print()