
CREATE TABLE Platnosc (
id_platnosc INT IDENTITY (1001,1),
gotowka BIT,
przelew BIT,
raty BIT,
kwota DECIMAL (10,2),
waluta CHAR (3);

PRIMARY KEY (id_platnosc));
