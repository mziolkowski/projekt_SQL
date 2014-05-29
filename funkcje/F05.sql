-- F05 -- 
/* Funkcja która wyswietla najwyższą wyplate na wskazanym stanowisku */

CREATE FUNCTION pensja_stan
	(
	@nazwa VARCHAR (20)
	)
RETURNS INT
AS BEGIN
	DECLARE @calosc INT
	SET @calosc=(SELECT (p.premia)+(p.pensja) AS Wyplata FROM Pracownik p, Stanowisko s
	WHERE id_pracownik=id_pracownik AND @nazwa=s.nazwa AND s.id_stanowisko=p.id_stanowisko)
RETURN @calosc;
END
GO

