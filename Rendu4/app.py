#!/usr/bin/python3

# http://initd.org/psycopg/docs/usage.html

import psycopg2
import forms
import reports

HOST = "tuxa.Sme.utc"
USER = "nf18a056"
PASSWORD = "HvMhY30c"
DATABASE = "dbnf18a056"

# Open connection
conn = psycopg2.connect("host=%s dbname=%s user=%s password=%s" % (HOST, DATABASE, USER, PASSWORD))


choice = '1'
while choice == '1' or choice == '2':
  print ("Pour ajouter un philosophe à la base, entrez 1")
  print ("Pour voir la liste des philosophes, entrez 2")
  print ("Pour sortir, entrez autre chose")
  choice = input()  
  if choice == '1':
    forms.addPhilo(conn)
  if choice == '2':
    reports.printPhilo(conn)
  print(choice)
# Close connection
conn.close()
