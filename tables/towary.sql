
CREATE TABLE Towary (
	id_towar INT,
	typ VARCHAR (30) NOT NULL,
	marka VARCHAR (30) NOT NULL,
	model VARCHAR (30) NOT NULL,
	id_kod INT NOT NULL,
	status_towaru VARCHAR (20) NOT NULL,
	opis VARCHAR (250) NOT NULL,
	ilosc INT,
	cena DECIMAL (10,2) NOT NULL,
	id_importer INT

PRIMARY KEY (id_towar));

ALTER TABLE Towary ADD FOREIGN KEY (id_kod) REFERENCES Kod_towaru (id_kod)
ALTER TABLE Towary ADD FOREIGN KEY (id_importer) REFERENCES Importer (id_importer)
GO

