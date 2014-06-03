
-- W05 --
/* Widok przedstawia, stalych klientow */

CREATE VIEW klient_staly AS (
SELECT
	*
FROM 
	Klient
WHERE
	staly_klient=1
);
GO
--Przyklad--
--SELECT * FROM klient_staly;