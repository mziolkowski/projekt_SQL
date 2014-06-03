--******************************************************************************************************************************************--
-- Widoki --

-- W01 --
/* Widok prezentuje ilosc transakcji w miesiacu maj */

CREATE VIEW tran_maj AS (
SELECT
* 
FROM Zamowienia 
WHERE
MONTH(data_zamowienia)=5);
GO

-- Przyklad --
-- SELECT * FROM tran_maj;
-- GO
