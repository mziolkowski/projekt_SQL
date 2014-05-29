
-- P05 --
/* Procedura która zwraca towary które trzeba zamówić i zmienia ich status */

CREATE PROCEDURE zam_twr
AS BEGIN
	SELECT * FROM Towary t WHERE T.status_towaru LIKE 'NIEDOSTĘPNY';
	UPDATE Towary SET status_towaru='ZAMÓWIONY U PRODUCENTA' WHERE ilosc=0;
END
--Przyklad
--EXEC zam_twr;
GO

