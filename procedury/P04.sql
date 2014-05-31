
-- P04 --
/* Procedura dodaje towary do koszyka */

CREATE PROCEDURE koszyczek_1
	@id_koszyk INT,
	@id_towar INT,
	@ilosc INT
AS BEGIN
	INSERT INTO Koszyk VALUES (
	@id_koszyk,
	@id_towar,
	@ilosc)
END
GO
--Przyklad
--EXEC koszyczek_1 1011,1002,2;
GO
