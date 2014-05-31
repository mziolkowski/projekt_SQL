------------------------------*************************************************-----------------------------------
-- Procedury --

-- P01 --
/* Aktualizuje tabele klient dodajac do pola
 staly klient tak, jesli zrobil w sklepie wiecej niz 4 razy zakupy */
  
CREATE PROCEDURE staly_3
AS BEGIN

	UPDATE
		Klient
	SET
		staly_klient = 1 
	WHERE
		id_klient IN 
		(
			SELECT
				id_klient
			FROM
				Zamowienia z
				JOIN
				Klient k
				ON (z.id_klienta=k.id_klient) 
			GROUP BY
				k.id_klient
			HAVING
				COUNT(z.id_zamowienia) > 3	
		)
END
GO
--Przyklad
--EXEC staly_3;
GO

