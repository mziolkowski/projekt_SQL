
CREATE TABLE Importer (
	id_importer INT,
	nazwa VARCHAR (30) NOT NULL,
	adres VARCHAR (40) NOT NULL,
	kod_pocztowy VARCHAR (7) NOT NULL,
	miasto VARCHAR (20) NOT NULL,
	telefon VARCHAR (15) NOT NULL, 
	poczatek_wspol DATE NOT NULL,
	koniec_wspol DATE,
	prezes_firmy VARCHAR (50) NOT NULL,
	kraj VARCHAR (20) NOT NULL

PRIMARY KEY (id_importer));
GO
