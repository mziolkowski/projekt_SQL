-- F03 --
/* Funkcja która zwraca szczególy kodu towaru, po modelu produktu */

--CREATE FUNCTION kod_1
--	(
--	@model VARCHAR (40)
--	)
--RETURNS VARCHAR
--AS BEGIN
--	DECLARE @kodzik VARCHAR
--	SET @kodzik=(SELECT k.id_kod, k.magazyn, k.hala, k.poziom, k.regal, k.polka FROM Kod_towaru k, Towary t 
--	WHERE @model=t.model AND t.id_kod=k.id_kod)
--RETURN @kodzik;
--END
--GO

IF OBJECT_ID (N'dbo.kod') IS NOT NULL
   DROP FUNCTION dbo.kod
GO

CREATE FUNCTION kod(@model VARCHAR (40))
RETURNS @wynik TABLE 
(
   	[id_kod] [int] NOT NULL,
	[magazyn] [varchar](20) NOT NULL,
	[hala] [varchar](2) NOT NULL,
	[poziom] [varchar](2) NOT NULL,
	[regal] [varchar](2) NOT NULL,
	[polka] [varchar](2) NOT NULL
)
AS
-- body of the function
BEGIN
	INSERT 
		@wynik
	SELECT 
		k.id_kod,	
		k.magazyn,
		k.hala,
		k.poziom,
		k.regal,
		k.polka 
	FROM
		Kod_towaru k,
		Towary t 
	WHERE 
		@model=t.model 
		AND
		t.id_kod=k.id_kod
   RETURN
END
GO

--Przyklad
--SELECT * FROM kod ('i7-920');
