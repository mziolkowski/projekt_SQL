
CREATE TABLE Transport ( 
id_transport INT IDENTITY (1001,1),
nazwa VARCHAR (30) NOT NULL,
rodzaj VARCHAR (20) NOT NULL,
adres VARCHAR (40) NOT NULL,
telefon VARCHAR (15) NOT NULL,
miejscowosc VARCHAR (30) NOT NULL;

PRIMARY KEY (id_transport));
