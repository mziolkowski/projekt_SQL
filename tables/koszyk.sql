
CREATE TABLE Koszyk (
	id_koszyk INT,
	id_towar INT NOT NULL,
	ilosc INT NOT NULL,
	cena DECIMAL (10,2)

PRIMARY KEY (id_koszyk));
GO
