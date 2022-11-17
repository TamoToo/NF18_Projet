#!/usr/bin/python3

# http://initd.org/psycopg/docs/usage.html

import psycopg2
import forms
import reports

HOST = "tuxa.sme.utc"
USER = "nf18a056"
PASSWORD = "HvMhY30c"
DATABASE = "dbnf18a056"

# Open connection
conn = psycopg2.connect("host=%s dbname=%s user=%s password=%s" % (HOST, DATABASE, USER, PASSWORD))


choice = 1
while choice >= 1 and choice <= 2:
    forms.afficherMenuPrincipal()
    choice = int(input())
    if (choice == 1):
      info = forms.connection(conn)
      if not info:
        break
      print(f"Vous êtes connecté en tant que {info['role']}")
      if info['role'] == 'adhérent':
        forms.afficherMenuAdherent()
        choice = int(input())
        if (choice == 1):
          reports.printAdherent(conn, info['email'])
      elif info['role'] == 'directeur':
        print('OK')



    elif(choice == 2):
      print("Au revoir")
    else:
      print("Choix invalide")



    print(choice)
# Close connection
conn.close()
