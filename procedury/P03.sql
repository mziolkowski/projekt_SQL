
-- P03 --
/* Dodanie do tabeli 'Towary' nowego towaru */

CREATE PROCEDURE nowy_towar
	@id_towar INT,
	@typ VARCHAR (30),
	@marka VARCHAR (30),
	@model VARCHAR (30),
	@id_kod INT,
	@status_towaru VARCHAR (20),
	@opis VARCHAR (250),
	@ilosc INT,
	@cena DECIMAL (10,2),
	@id_importer INT
AS BEGIN
	INSERT INTO Towary VALUES (
	(SELECT MAX(id_towar)+1 FROM Towary),
	@typ,
	@marka,
	@model,
	@id_kod,
	@status_towaru,
	@opis,
	@ilosc,
	@cena,
	@id_importer)
END
EXEC nowy_towar 1067,'Dysk HDD', 'Hitachi',1067, 'Dostępny', 'Nowy super szybki dysk 7200RPM',9,600.00,1021;
GO

