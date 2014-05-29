------------------------------*************************************************-----------------------------------
-- Procedury --

-- P01 --
/* Aktualizuje tabele klient dodajac do pola
 staly klient tak, jesli zrobil w sklepie wiecej niz 4 razy zakupy */
  
CREATE PROCEDURE staly_3
AS BEGIN

	WITH ilosc_transakcji_CTE 
	(
		cte_id_klient
	)
	AS
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
			COUNT(z.id_zamowienia) > 4	
	)
	UPDATE
		k
	SET
		staly_klient =1 
	FROM
	Klient k 
	JOIN
	ilosc_transakcji_CTE
	ON (k.id_klient=cte_id_klient)
END

-- przyklad
EXEC staly_3;
GO

