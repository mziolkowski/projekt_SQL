
-- T04 --
/* Transakcja zmienia ilosc towarów na stanie, po zakupie towaru */

-- BEGIN TRANSACTION

-- UPDATE 
--	 dbo.Towary
-- SET
--	 dbo.Towary.ilosc = dbo.Towary.ilosc - dbo.Koszyk.ilosc
-- FROM
--	 dbo.Towary,
--	 dbo.Koszyk
-- WHERE
--	 dbo.Towary.id_towar = dbo.Koszyk.id_towar;
	
-- UPDATE 
--		Towary 
--	SET 
--		status_towaru='Niedostępny'
--	FROM
--		dbo.Towary,
--		dbo.Koszyk
--	WHERE 
--		dbo.Towary.ilosc=0
--		AND status_towaru='ZAMÓWIONY U PRODUCENTA' 
--		OR status_towaru='Na wyczerpaniu'
--		AND dbo.Towary.id_towar = dbo.Koszyk.id_towar;
		
--UPDATE 
--		Towary 
--	SET 
--		status_towaru='Na wyczerpaniu'
--	FROM
--		dbo.Towary,
--		dbo.Koszyk
--	WHERE 
--		dbo.Towary.ilosc>0 
--		AND dbo.Towary.ilosc<7
--		AND status_towaru='Dostępny'
--		OR status_towaru='ZAMÓWIONY U PRODUCENTA'
--		AND dbo.Towary.id_towar = dbo.Koszyk.id_towar;;

-- GO
-- COMMIT;

--***************************************************************************************--