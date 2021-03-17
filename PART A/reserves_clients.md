# **Relació dels clients amb les reserves en una base de dades mitjançant Python** 

##### En aquest exercici ens hem comunicat amb la base de dades mitjançant el llenguatge de Python

[Fitxer del codi de Python](./relacio_clients.py)

- Primerament importem les llibreries necessàries i fem la connexió a la base de dades.
```py
import mysql.connector
import random

random.seed()

cnx = mysql.connector.connect(host='192.168.56.101', user='perepi', password='pastanaga', database='db_hotels')
cursor = cnx.cursor()
 ```
- Declarem les variables dels mínims i màxims de clients i reserves.
```py 
minIdClient = 10001
maxIdClient = 27944
minIdReserva = 1
maxIdReserva = 26990
```
- Fem un bucle 'For' per afegir totes les dades a la base de dades mitjançant la funció `RANGE()` i `RANDOM.RANDINT()`.
```py 
for r_id in range(minIdReserva,maxIdReserva+1):
    cl_id = random.randint(minIdClient, maxIdClient)

    cursor.execute('''UPDATE reserves
                SET client_id = %s
                WHERE reserva_id = %s
                ''', (cl_id,r_id))
```
- Finalment, una vegada finalitzat l'`UPDATE`, fem un `COMMIT` i acabem la connexió.
```py

cnx.commit()
cursor.close()
cnx.close()

```
