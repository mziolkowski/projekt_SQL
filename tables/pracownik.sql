CREATE TABLE Pracownik (
id_pracownik INT,
imie VARCHAR (20),
nazwisko VARCHAR (50),
data_ur DATE,
miasto VARCHAR (30),
adres VARCHAR (40),
telefon VARCHAR (15),
data_zatr DATE,
data_zwol DATE,
mail VARCHAR (30),
premia DECIMAL (10,2),
pensja DECIMAL (10,2),
stanowisko VARCHAR (20),

PRIMARY KEY (id_pracownik));