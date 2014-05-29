
CREATE TABLE Pracownicy (
	id_pracownicy INT,
	imie VARCHAR (20) NOT NULL,
	nazwisko VARCHAR (50) NOT NULL,
	data_ur DATE NOT NULL,
	miasto VARCHAR (30) NOT NULL,
	adres VARCHAR (40) NOT NULL,
	telefon VARCHAR (15) NOT NULL,
	data_zatr DATE NOT NULL,
	data_zwol DATE,
	mail VARCHAR (30) NOT NULL,
	premia DECIMAL (10,2),
	pensja DECIMAL (10,2) NOT NULL,
	id_stanowiska INT NOT NULL

PRIMARY KEY (id_pracownicy));

ALTER TABLE pracownicy ADD FOREIGN KEY (id_stanowiska) REFERENCES stanowiska (id_stanowiska)
GO
