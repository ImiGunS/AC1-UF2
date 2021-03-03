import mysql.connector
import csv
from datetime import date

cnx = mysql.connector.connect(host='192.168.56.101',user='perepi',password='pastanaga', database='db_hotels')
cursor = cnx.cursor()

with open(r"C:\Users\ernen\Documents\M-02 Base Dades\AC1_UF2\BBDD\dades_clients-puntcoma.csv") as csv_file:
    csv_reader = csv.reader(csv_file,delimiter=";")
    print(csv_reader)
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        else:
            print(f"\t El nostre client{row[0]} amb nom {row[1]} i cognom {row[2]}, amb sexe {row[3]} amb data naixament {row[4]} i el seu/a pais d'origen és {row[5]} .")
            print(f'Processed {line_count} lines.')
            client_id = (row[0])
            nom = row[1]
            cognom1 = row[2]
            sexe = row[3]
            datasplit = row[4].split("/")
            data_naixement = date(int(datasplit[2]), int(datasplit[1]), int(datasplit[0]))
            pais_origen_id = row[5]
            cursor.execute('''INSERT INTO clients(client_id,nom,cognom1,sexe,data_naixement,pais_origen_id)
                VALUES (%s,%s,%s,%s,%s,%s)''',(client_id,nom,cognom1,sexe,data_naixement,pais_origen_id))
            line_count += 1


# Executem l'INSERT

cnx.commit()
cursor.close()
cnx.close()

