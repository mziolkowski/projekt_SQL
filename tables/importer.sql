CREATE TABLE Importer (
id_importer INT IDENTITY (1,1),
nazwa VARCHAR (30),
adres VARCHAR (40),
telefon VARCHAR (15),
poczatek_wspol DATE,
koniec_wspol DATE,
prezes_firmy VARCHAR (30),
kraj VARCHAR (20),
miasto (20),

PRIMARY KEY (id_importer));