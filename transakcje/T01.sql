--*********************************************************************************************************************************************--
-- TRANSAKCJE --

-- T01 --
/* Treansakcja usuwa z tabeli Pracownicy osoby zwolnione */

-- BEGIN TRANSACTION
	-- DELETE FROM Pracownicy 
	-- WHERE 
		-- data_zwol IS NOT NULL;
	-- COMMIT;
-- GO