CREATE TABLE Zamowienia (
id_zamowienia INT IDENTITY (1001,1),
id_koszyk INT,
id_klienta INT,
data_zamowienia DATE,
id_platnosc INT,
zaplacone BIT,
faktora BIT,
status_zamowienia VARCHAR (20),
id_transport INT,
czas_dostawy VARCHAR (2),

PRIMARY KEY (id_zamowienia));