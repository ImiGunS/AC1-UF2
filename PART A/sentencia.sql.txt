#1

SELECT nom 
FROM hotels
WHERE nom REGEXP '[aeiou][aeiou]$'
ORDER BY nom asc;

#2
SELECT nom 
FROM hotels
ORDER BY length(nom) desc, nom asc ;

#3
SELECT nom as poblacio
FROM poblacions
WHERE nom REGEXP '^[aeiou]'
ORDER BY nom asc;


#4
SELECT nom 
FROM hotels
WHERE nom REGEXP '[aeiou][aeiou](c)$'
ORDER BY nom asc ;

#5 esta repe XDDDDDDD
SELECT nom as poblacio
FROM poblacions
WHERE nom REGEXP '^[aeiou]'
ORDER BY nom asc;

#6
SELECT p.nom as poblacio, count(h.hotel_id) as quantitat
FROM hotels h
INNER JOIN poblacions p 
ON h.poblacio_id = p.poblacio_id
GROUP BY p.nom
ORDER BY p.nom;

#7
SELECT poblacio
FROM (SELECT p.nom as poblacio, count(h.hotel_id) as quantitat
      FROM hotels h 
      INNER JOIN poblacions p 
      ON p.poblacio_id = h.poblacio_id
      GROUP BY p.nom) AS TMP_table
WHERE quantitat = 2
ORDER BY poblacio;

#8-----------------------------------------------------------------FALTAAA
CREATE TABLE clients(
  pais_id TINYINT UNSIGNED PRIMARY KEY,
  nom VARCHAR(40)
);


#9
SELECT MONTH(r.data_inici) as mes, COUNT(r.reserva_id) as num_reserves 
FROM reserves r
INNER JOIN habitacions h ON h.hab_id = r.hab_id
INNER JOIN hotels hot ON hot.hotel_id = h.hotel_id
WHERE YEAR(data_inici) = 2015 AND hot.nom = 'Catalonia Ramblas'
GROUP BY MONTH(data_inici)
ORDER BY mes;

#10
SELECT hotel_id, nom, categoria, qt_hab 
FROM (SELECT hab.hotel_id, h.nom, h.categoria, COUNT(hab.hab_id) as qt_hab 
      FROM hotels h
      INNER JOIN habitacions hab ON h.hotel_id = hab.hotel_id
      WHERE categoria = 4
      GROUP BY hab.hotel_id) as TMP
WHERE qt_hab < 20
GROUP BY hotel_id
ORDER BY qt_hab;

#11-----------------------------------------------------------------------------------------------------------------
SELECT c.client_id, c.nom, c.cognom1
FROM clients c
INNER JOIN reserves r ON c.client_id = r.client_id
INNER JOIN habitacions h ON h.hab_id = r.hab_id
INNER JOIN hotels hot ON h.hotel_id = hot.hotel_id
WHERE YEAR(r.data_inici) = 2015;  #FALTA LO DE REPETIR HOTEL, NO HO SE FER 


SELECT c.nom, c.cognom1, hot.hotel_id
FROM clients c
INNER JOIN reserves r ON c.client_id = r.client_id
INNER JOIN habitacions h ON h.hab_id = r.hab_id
INNER JOIN hotels hot ON h.hotel_id = hot.hotel_id
WHERE YEAR(r.data_inici) = 2014;   #AIXO ES UNA TAULA DE LES PERSONES A QUIN HOTEL VAN ANAR L'ANY 2014
#------------------------------------------------------------------------------------------------------------------------

