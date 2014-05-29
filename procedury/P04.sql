
-- P04 --
/* Procedura dodaje towary do koszyka */

CREATE PROCEDURE koszyczek_1
	@id_koszyk INT,
	@id_towar INT,
	@ilosc INT,
	@cena DECIMAL (10,2)
AS BEGIN
	INSERT INTO Koszyk VALUES (
	@id_koszyk,
	@id_towar,
	@ilosc,
	@cena)
END
--Przyklad
--EXEC koszyczek_1 1001,'1002',2,400.00;
GO

