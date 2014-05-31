
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
	@id_import INT
AS BEGIN
	INSERT INTO Towary VALUES (
	@id_towar,
	@typ,
	@marka,
	@model,
	@id_kod,
	@status_towaru,
	@opis,
	@ilosc,
	@cena,
	@id_import)
END
GO
--Przyklad
--EXEC nowy_towar 1067,'Dysk HDD', 'Hitachi','M320',1065, 'Dostępny', 'Nowy super szybki dysk 7200RPM',9,600.00,1021;
GO

