-- Funkcje --

-- F01 --
/* FUNKCJA ktora zwraca ilosc importowanych towarów od producenta z którym w wybranych latach nawiązaliśmy współprace */

CREATE FUNCTION towary_grudy
(
	@nazwa VARCHAR (256),
	@data_od DATE,
	@data_do DATE
)
RETURNS INT
AS BEGIN
	DECLARE @ilosc INT
	SELECT
	@ilosc=COUNT(t.id_towar) 
		FROM 
			import i, 
			Towary t 
		WHERE 
			t.id_import=i.id_import 
			AND @nazwa=i.nazwa 
			AND i.poczatek_wspol BETWEEN @data_od AND @data_do
		
RETURN @ilosc
END
GO
--Przyklad
--SELECT dbo.towary_grudy ('Intel','1995-01-01','1996-01-01');
GO
