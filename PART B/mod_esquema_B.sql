USE db_hotels;
CREATE TABLE provincies(
	provincia_id		TINYINT(1) UNSIGNED AUTO_INCREMENT,
    nom 				VARCHAR(40) NOT NULL,
    CONSTRAINT PK_provincia PRIMARY KEY(provincia_id)
);
CREATE table restaurants(
	restaurant_id 		INT UNSIGNED AUTO_INCREMENT,
    nom					VARCHAR(40) NOT NULL,
    descripcio			VARCHAR(150),
    n_michelin			CHAR(1) COMMENT 'Les estrelles Michelin poden anar de 0 a 5',
    puntuacio			CHAR(3) COMMENT 'La valoració del restaurant 0 a 5 punts ',
    adreca				VARCHAR(100),
    poblacio			SMALLINT(5) UNSIGNED NOT NULL,
    provincia			TINYINT(1) UNSIGNED NOT NULL,
    web					VARCHAR(50),
    geolocalitzacio		POINT,
    CONSTRAINT PK_restaurants PRIMARY KEY (restaurant_id),
    CONSTRAINT FK_restaurants_poblacions FOREIGN KEY(poblacio)
		REFERENCES poblacions(poblacio_id),
	CONSTRAINT FK_restaurants_provincies FOREIGN KEY(provincia)
		REFERENCES provincies(provincia_id)
);
ALTER TABLE hotels
	ADD COLUMN 	provincia 			TINYINT(1) UNSIGNED NOT NULL,
    ADD COLUMN 	geolocalitzacio 	POINT,
    ADD COLUMN 	descripcio			VARCHAR(200),
    ADD COLUMN 	puntuacio			CHAR(3) COMMENT 'La valoració del hotel va de  0 a 5 punts ',
    ADD COLUMN 	web					VARCHAR(50),
    ADD COLUMN 	telefon				CHAR(9),
    ADD COLUMN 	nestrelles			CHAR(1) COMMENT 'Les estrelles que pot tenir un hotel van de 3 a 5(menys de tres seria un hostal)'
;
    
ALTER TABLE poblacions
	ADD COLUMN 	provincia		TINYINT(1) UNSIGNED,
    ADD CONSTRAINT FK_poblacions_provincies FOREIGN KEY (provincia)
			REFERENCES provincies(provincia_id);

INSERT INTO provincies(provincia_id,nom)
	VALUES	('1','Tarragona'),
			('2','Barcelona'),
            ('3','Girona'),
            ('4','Lleida');