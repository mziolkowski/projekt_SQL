-- F05 -- 
/* Funkcja która wyswietla najwyższą wyplate na wskazanym stanowisku */

CREATE FUNCTION pensja_stan
	(
	@nazwa VARCHAR (20)
	)
RETURNS INT
AS BEGIN
	DECLARE 
	@calosc INT
	SET 
	@calosc=(
		SELECT TOP 1 
			(p.premia)+(p.pensja) AS Wyplata 
		FROM 
			pracownicy p, 
			stanowiska s
		WHERE 
			id_pracownicy=id_pracownicy 
			AND @nazwa=s.nazwa 
			AND s.id_stanowiska=p.id_stanowiska 
		ORDER BY Wyplata DESC
		)
RETURN @calosc
END
GO
--Przyklad
--SELECT * FROM pensja_stan ('Handlowiec');
GO

