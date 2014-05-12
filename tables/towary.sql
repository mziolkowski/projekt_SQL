CREATE TABLE Towary (
id_towar INT IDENTITY (1,1),
nazwa VARCHAR (30),
id_kod INT,
status_towaru VARCHAR (20),
opis VARCHAR (250),
ilosc INT,
cena DECIMAL (10,2),
id_importer INT,

PRIMARY KEY (id_towar));