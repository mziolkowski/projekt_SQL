
-- P06 --
/* Procedura która zwraca jakie towary są w magazynie na poziomie A */

CREATE PROCEDURE twr_magA
AS BEGIN
	SELECT 
		t.id_towar, 
		t.typ, 
		t.marka, 
		t.model 
	FROM 
		Towary t
		JOIN Kod_towaru k
		ON (k.id_kod=t.id_kod ) 
	WHERE 
		k.poziom LIKE 'A'; 
END
GO
--Przyklad
--EXEC twr_magA;
GO
