
CREATE TABLE Koszyk (
id_koszyk INT IDENTITY (1001,1),
id_towar INT NOT NULL,
ilosc INT NOT NULL,
cena DECIMAL (10,2);

PRIMARY KEY (id_koszyk));
