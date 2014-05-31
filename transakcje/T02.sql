
--T02 --
/* Transakcja dodaje do tabeli Klient pole 'UWAGA' i pisze w nim uwage klientom, którzy nie robili zakupów, lub zrobili tylko raz */

 -- BEGIN TRANSACTION
	 -- ALTER TABLE Klient ADD UWAGA VARCHAR (90);
	 -- GO
		 -- UPDATE Klient SET UWAGA='Zacznij robić więcej zakupów' WHERE
		 -- id_klient IN 
		 -- (
			 -- SELECT
				 -- id_klient
			 -- FROM
				 -- Zamowienia z
				 -- JOIN
				 -- Klient k
				 -- ON (z.id_klienta=k.id_klient) 
			 -- GROUP BY
				 -- k.id_klient
			 -- HAVING
				 -- COUNT(z.id_zamowienia) < 2
		 -- )
-- COMMIT; 
--GO