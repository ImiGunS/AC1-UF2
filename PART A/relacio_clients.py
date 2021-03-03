import mysql.connector
import random

random.seed()

cnx = mysql.connector.connect(host='192.168.56.101', user='perepi', password='pastanaga', database='db_hotels')
cursor = cnx.cursor()

minIdClient = 10001
maxIdClient = 27944
minIdReserva = 1
maxIdReserva = 26990

for r_id in range(minIdReserva,maxIdReserva+1):
    cl_id = random.randint(minIdClient, maxIdClient)

    cursor.execute('''UPDATE reserves
                SET client_id = %s
                WHERE reserva_id = %s
                ''', (cl_id,r_id))


# Finalitzem l'UPDATE
cnx.commit()
cursor.close()
cnx.close()
