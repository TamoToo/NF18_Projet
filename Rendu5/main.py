#!/usr/bin/python3

# http://initd.org/psycopg/docs/usage.html

import psycopg2
import menus

HOST = ""
USER = ""
PASSWORD = ""
DATABASE = ""

# Open connection
conn = psycopg2.connect("host=%s dbname=%s user=%s password=%s" % (HOST, DATABASE, USER, PASSWORD))

# Main loop
end = False
while not end:
  user_info = menus.afficherMenuPrincipal(conn)
  if not user_info:
    end = True
    continue
  if user_info['role'] == 'adhérent':
    adherent_info = menus.afficherMenuAdherent(conn, user_info)
    if not adherent_info:
      end = True
      continue

  elif user_info['role'] == 'directeur':
    directeur_info = menus.afficherMenuDirecteur(conn, user_info)
    if not directeur_info:
      end = True
      continue

# Close connection
conn.close()
