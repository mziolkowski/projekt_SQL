-- F03 --
/* Funkcja która zwraca szczególy kodu towaru, po modelu produktu */

CREATE FUNCTION kod_1
	(
	@model VARCHAR (40)
	)
RETURNS VARCHAR
AS BEGIN
	DECLARE @kodzik VARCHAR
	SET @kodzik=(SELECT k.id_kod, k.magazyn, k.hala, k.poziom, k.regal, k.polka FROM Kod_towaru k, Towary t 
	WHERE @model=t.model AND t.id_kod=k.id_kod)
RETURN @kodzik;
END

