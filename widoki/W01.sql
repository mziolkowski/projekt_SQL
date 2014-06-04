-- W01 --
/* Widok prezentuje ilosc transakcji w obecnym miesiacu */

CREATE VIEW tran_mies AS (
SELECT
* 
FROM Zamowienia z
WHERE
DATEPART(MM,z.data_zamowienia) = MONTH(GETDATE())
AND DATEPART(YY,z.data_zamowienia) = YEAR(GETDATE()));
GO

-- Przyklad --
-- SELECT * FROM tran_mies;
GO