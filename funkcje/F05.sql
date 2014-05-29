-- F05 -- 
/* Funkcja która wyswietla najwyższą wyplate na wskazanym stanowisku */

CREATE FUNCTION pensja_stan
	(
	@nazwa VARCHAR (20)
	)
RETURNS INT
AS BEGIN
	DECLARE @calosc INT
	SET @calosc=(SELECT (p.premia)+(p.pensja) AS Wyplata FROM pracownicy p, stanowiska s
	WHERE id_pracownicy=id_pracownicy AND @nazwa=s.nazwa AND s.id_stanowiska=p.id_stanowiska)
RETURN @calosc;
END
--Przyklad
--SELECT * FROM pensja_stan ('handlowiec')
GO

