
CREATE TABLE Klient (
id_klient INT,
firma VARCHAR (20),
imie VARCHAR (20),
nazwisko VARCHAR (30),
adres VARCHAR (40),
kod_pocztowy VARCHAR (7),
miejscowosc VARCHAR (30),
telefon VARCHAR (15),
mail VARCHAR (30),
staly_klient BIT;

PRIMARY KEY (id_klient));
