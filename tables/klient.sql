CREATE TABLE klient (
id_klient INT IDENTITY (1,1),
firma VARCHAR (20),
imie VARCHAR (20),
nazwisko VARCHAR (30),
adres VARCHAR (40),
miejscowosc VARCHAR (30),
telefon VARCHAR (15),
mail VARCHAR (30),
id_zamowienia INT,

PRIMARY KEY (id_klient));