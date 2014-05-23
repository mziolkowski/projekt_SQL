
CREATE TABLE Pracownik (
id_pracownik INT,
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
id_stanowisko INT NOT NULL;

PRIMARY KEY (id_pracownik));

ADD FOREIGN KEY (id_stanowisko) REFERENCES Stanowisko (id_stanowisko)
