
CREATE TABLE Klient (
id_klient INT,
firma VARCHAR (20) NOT NULL,
imie VARCHAR (20) NOT NULL,
nazwisko VARCHAR (30) NOT NULL,
adres VARCHAR (40) NOT NULL,
kod_pocztowy VARCHAR (7) NOT NULL,
miejscowosc VARCHAR (30) NOT NULL,
telefon VARCHAR (15) NOT NULL,
mail VARCHAR (30) NOT NULL,
staly_klient BIT;

PRIMARY KEY (id_klient));
