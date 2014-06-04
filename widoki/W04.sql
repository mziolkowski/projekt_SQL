

-- W04 --
/* Widok prezentujacy dane do wystawienia faktóry */

CREATE VIEW fakturka AS (
SELECT 
	dbo.Klient.id_klient,
	dbo.Klient.imie,
	dbo.Klient.nazwisko,
	dbo.Klient.firma,
	dbo.Klient.adres,
	dbo.Klient.kod_pocztowy,
	dbo.Klient.miejscowosc,
	dbo.Towary.id_towar,
	dbo.Towary.typ, 
    dbo.Towary.marka,
    dbo.Towary.model,
    dbo.Towary.cena,
    GETDATE() AS DATA_WYSTAWIENIA_FAKTURY
FROM 
	dbo.Zamowienia,
	dbo.Klient,
	dbo.Towary,
	dbo.Koszyk
WHERE
	dbo.Zamowienia.id_klienta = dbo.Klient.id_klient
	AND dbo.Zamowienia.id_koszyk = dbo.Koszyk.id_koszyk
	AND dbo.Koszyk.id_towar=dbo.Towary.id_towar
	AND dbo.Zamowienia.faktura=1 
	AND dbo.Zamowienia.zaplacone=1
);
GO
--Przyklad--
--SELECT * FROM fakturka;