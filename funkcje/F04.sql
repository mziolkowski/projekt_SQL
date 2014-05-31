-- F04 --
/* Funkcja która zwraca najniższą cenę produktu konkretnego typu */

--CREATE FUNCTION nis_cena
--	(
--	@nazwa VARCHAR (40)
--	)
--RETURNS VARCHAR
--AS BEGIN
--	DECLARE @tani VARCHAR
--	SET @tani=(SELECT t.typ ,t.marka, t.model, t.opis, t.cena, t.ilosc, t.status_towaru 
--	FROM Towary t WHERE @nazwa=T.typ AND t.cena=MIN(t.cena))
--RETURN @tani;
--END 
--GO


IF OBJECT_ID (N'nis_cena') IS NOT NULL
   DROP FUNCTION nis_cena
GO

CREATE FUNCTION nis_cena (@typ VARCHAR (90))
RETURNS @wyniki TABLE 
(
    -- columns returned by the function
	[typ] [varchar](990) NOT NULL,
	[marka] [varchar](90) NOT NULL,
	[model] [varchar](90) NOT NULL,
	[status_towaru] [varchar](90) NOT NULL,
	[opis] [varchar](250) NOT NULL,
	[ilosc] [int] NULL,
	[cena] [decimal](10, 2) NOT NULL
)
AS
-- body of the function
BEGIN
	INSERT @wyniki 
	SELECT TOP 1
		t.typ,
		t.marka,
		t.model,
		t.status_towaru, 
		t.opis,
		t.ilosc,
		t.cena
	FROM
		Towary t
	WHERE
		T.typ = @typ
	ORDER BY
		t.cena ASC
	
	RETURN
END
GO

-- Przyklad
--SELECT * FROM nis_cena('Grafika');
