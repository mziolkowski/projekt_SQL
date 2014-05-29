-- Funkcje --

-- F01 --
/* FUNKCJA ktora zwraca ilosc importowanych towarów od producenta z którym w 1999-2001 nawiązaliśmy współprace */

CREATE FUNCTION towary_grud
(
	@nazwa VARCHAR (256),
	@data_od DATE,
	@data_do DATE 
)
RETURNS INT
AS BEGIN
	DECLARE @ilosc INT
	SET @ilosc=(SELECT COUNT(t.id_towar) FROM Importer i, Towary t WHERE t.id_importer=i.id_importer AND @nazwa=i.nazwa AND 
	i.poczatek_wspol BETWEEN @data_od AND @data_do);
RETURN @ilosc
end
GO
