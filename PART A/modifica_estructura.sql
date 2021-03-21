USE db_hotels;


CREATE TABLE clients(
	client_id 		INT UNSIGNED AUTO_INCREMENT,
	nom				VARCHAR(15),
    cognom1			VARCHAR(25),
    sexe			ENUM('F','M'),
    data_naixement	DATE,
    pais_origen_id	TINYINT UNSIGNED,
    CONSTRAINT PK_client PRIMARY KEY (client_id),
    CONSTRAINT FK_clients_paisos FOREIGN KEY (pais_origen_id)
		REFERENCES paisos( pais_id)
);


ALTER TABLE reserves
	ADD COLUMN client_id INT UNSIGNED AFTER reserva_id;
    
ALTER TABLE reserves
    ADD CONSTRAINT fk_reserves_clients FOREIGN KEY (client_id)
		REFERENCES clients (client_id);

