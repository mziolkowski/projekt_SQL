
CREATE TABLE Towary (
	id_towar INT,
	typ VARCHAR (90) NOT NULL,
	marka VARCHAR (90) NOT NULL,
	model VARCHAR (90) NOT NULL,
	id_kod INT NOT NULL,
	status_towaru VARCHAR (90) NOT NULL,
	opis VARCHAR (250) NOT NULL,
	ilosc INT,
	cena DECIMAL (10,2) NOT NULL,
	id_import INT

PRIMARY KEY (id_towar));

ALTER TABLE Towary ADD FOREIGN KEY (id_kod) REFERENCES Kod_towaru (id_kod)
ALTER TABLE Towary ADD FOREIGN KEY (id_import) REFERENCES Import (id_import)
GO

