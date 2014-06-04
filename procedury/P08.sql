
-- P08 --
/* Procedura dodaje do tabeli Klient kolumne Podpowiedz, w celu poinformowania klienta z firmy o mozliwosci wyboru faktury przy platnosci */
CREATE PROCEDURE podpowiedz
AS BEGIN
	 ALTER TABLE 
		 Klient 
	 ADD 
		 Podpowiedz VARCHAR (200)
END;
GO	 
EXEC podpowiedz;		 
GO
 
CREATE PROCEDURE podpowiedz_2
AS BEGIN
		 UPDATE 
			dbo.Klient
		 SET 
			dbo.Klient.Podpowiedz='Przy płatności za zamówienie, zaznacz opcje "FAKTURA" w celu wystawienia faktury na firme'
		 WHERE
			firma IS NOT NULL
END;
GO		
--Przyklad --
--EXEC podpowiedz_2;
 GO 
 