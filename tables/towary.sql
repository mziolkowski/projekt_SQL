CREATE TABLE Towary (
id_towar INT,
typ VARCHAR (30),
marka VARCHAR (30),
model VARCHAR (30),
id_kod INT,
status_towaru VARCHAR (20),
opis VARCHAR (250),
ilosc INT,
cena DECIMAL (10,2),
id_importer INT,

PRIMARY KEY (id_towar));

ADD FOREIGN KEY (id_kod) REFERENCES Kod_towaru (id_kod)
ADD FOREIGN KEY (id_importer) REFERENCES Importer (id_importer)

