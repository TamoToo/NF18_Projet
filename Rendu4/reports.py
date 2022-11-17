#!/usr/bin/python3

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



