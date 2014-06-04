
--P09 --
/* Procedura dodaje do tabeli Klient pole 'UWAGA' i pisze w nim uwage klientom, którzy nie robili zakupów, lub zrobili tylko raz */

CREATE PROCEDURE uwaga
 AS BEGIN
	  ALTER TABLE Klient ADD UWAGA VARCHAR (90)
END;
GO
EXEC uwaga;
GO

CREATE PROCEDURE uwaga_2
AS BEGIN
		  UPDATE Klient 
		  SET 
			UWAGA='Zacznij robić więcej zakupów' 
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
				  COUNT(z.id_zamowienia) < 2
			)
END;
GO
--Przyklad--
--EXEC uwaga_2; 
GO
-----------------------------*************************************************-----------------------------------
GO