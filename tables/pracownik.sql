CREATE TABLE Pracownik (
id_pracownik INT IDENTITY (1,1),
imie VARCHAR (20),
nazwisko VARCHAR (50),
data_ur DATE,
miasto VARCHAR (30),
adres VARCHAR (40),
telefon VARCHAR (15),
data_zatr DATE,
data_zwol DATE,
e-mail VARCHAR (30),
premia DECIMAL (10,2),
pensja DECIMAL (10,2),
stanowisko VARCHAR

PRIMARY KEY (id_pracownik));