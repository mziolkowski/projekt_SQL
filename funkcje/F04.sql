-- F04 --
/* Funkcja która zwraca najniższą cenę produktu konkretnego typu */

CREATE FUNCTION nis_cena
	(
	@nazwa VARCHAR (40)
	)
RETURNS VARCHAR
AS BEGIN
	DECLARE @tani VARCHAR
	SET @tani=(SELECT t.typ ,t.marka, t.model, t.opis, t.cena, t.ilosc, t.status_towaru 
	FROM Towary t WHERE @nazwa=T.typ AND t.cena=MIN(t.cena))
RETURN @tani;
END 

