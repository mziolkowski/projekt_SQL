
-- T03 --
/* Transakcja dodaje do tabeli Klient kolumne Podpowiedz, w celu poinformowania klienta z firmy o mozliwosci wyboru faktury przy platnosci */

-- BEGIN TRANSACTION
	-- ALTER TABLE 
		-- Klient 
	-- ADD 
		-- Podpowiedz VARCHAR (200);
	-- GO
		-- UPDATE 
			-- Klient 
		-- SET 
		-- Podpowiedz='Przy płatności za zamówienie, zaznacz opcje "FAKTURA" w celu wystawienia faktury na firme'
		-- WHERE
		-- firma IS NOT NULL;
-- COMMIT;
-- GO