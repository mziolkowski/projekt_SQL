-- F02 --
/*Funkcje kora zwraca ilosc osób na stanowisku o podanej nazwie */

CREATE FUNCTION stanowiska_1
	(
	@nazwa VARCHAR (40)
	)
RETURNS INT
AS BEGIN
	DECLARE @zmienna INT
	SET @zmienna=(SELECT COUNT(p.id_pracownicy) FROM pracownicy p, stanowiska s WHERE
	 p.id_stanowiska=s.id_stanowiska AND s.nazwa=@nazwa)
RETURN @zmienna;
END
--Przyklad
--SELECT * FROM stanowiska_1;
GO

