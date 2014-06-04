-- F02 --
/*Funkcje ktora zwraca ilosc osób na stanowisku o podanej nazwie */

CREATE FUNCTION stanowiska_1
	(
	@nazwa VARCHAR (40)
	)
RETURNS INT
AS BEGIN
	DECLARE @zmienna INT
	SET @zmienna=(
		SELECT 
			COUNT(p.id_pracownicy) AS Ilosc_osob 
		FROM 
			pracownicy p, 
			stanowiska s 
		WHERE
			p.id_stanowiska=s.id_stanowiska 
			AND s.nazwa=@nazwa
		 )
RETURN @zmienna
END
GO
--Przyklad
--SELECT dbo.stanowiska_1('Handlowiec');
GO

