-- F02 --
/*Funkcje kora zwraca ilosc osób na stanowisku o podanej nazwie */

CREATE FUNCTION stanowisko_1
	(
	@nazwa VARCHAR (40)
	)
RETURNS INT
AS BEGIN
	DECLARE @zmienna INT
	SET @zmienna=(SELECT COUNT(p.id_pracownik) FROM Pracownik p, Stanowisko s WHERE
	 p.id_stanowisko=s.id_stanowisko AND s.nazwa=@nazwa)
RETURN @zmienna;
END
GO

