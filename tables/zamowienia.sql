CREATE TABLE Zamowienia (
id_zamowienia INT IDENTITY (1,1),
data_zamowienia DATE,
id_platnosc INT,
faktora BIT,
status_zamowienia VARCHAR (20),
zaplacone BIT,
dostawa VARCHAR (20),
czas_dostawy VARCHAR (2),

PRIMARY KEY (id_zamowienia));