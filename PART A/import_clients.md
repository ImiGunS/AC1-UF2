# **Importació dels clients a una base de dades mitjançant Python**

##### En aquest exercici ens hem comunicat amb la base de dades mitjançant el llenguatge de Python

[Fitxer del codi de Python](./import_clients.py)

- Primerament importem les llibreries necessàries i fem la connexió a la base de dades.
  ```py
    import mysql.connector
    import csv
    from datetime import date
    
    cnx = mysql.connector.connect(host='192.168.56.101',user='perepi',password='pastanaga', database='db_hotels')
    cursor = cnx.cursor()
  ```
   
- Obrim l'arxiu on estan les dades mitjançant el seu **PATH**.
  ```py
  with open(r"C:\Users\ernen\Documents\M-02 Base Dades\AC1_UF2\BBDD\dades_clients-puntcoma.csv") as csv_file
  ```

- Com aquest fitxer té l'extensió `.csv` i les dades estan separades pel `';'`, l'utilitzem com a delimitador.
  ```py
  csv_reader = csv.reader(csv_file,delimiter=";")
  print(csv_reader)
  ```
- Fem un bucle 'For' per afegir totes les dades a la base de dades.
  ```py
  line_count = 0
    
    for row in csv_reader:
    
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
            
        else:
            print(f"\t El nostre client{row[0]} amb nom {row[1]} i cognom {row[2]}, amb sexe {row[3]} amb data naixament {row[4]} 
            i el seu/a pais d'origen és {row[5]} .")
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
  ```
- Finalment, una vegada finalitzat l'`INSERT`, fem un `COMMIT` i acabem la connexió.
  ```py
    cnx.commit()

    cursor.close()

    cnx.close()
  ```

