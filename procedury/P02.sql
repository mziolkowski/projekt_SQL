
-- P02 --
/* Dodanie do tabeli towary opisu 'Niedostepny' jesli bedzie 0 sztuk na stanie i "Na wyczerpaniu" jesli ilosc bedzie mniej niż 6 */

CREATE PROCEDURE stan
AS BEGIN
	UPDATE 
		Towary 
	SET 
		status_towaru='Niedostępny'
	WHERE 
		ilosc=0
		AND status_towaru='Dostępny' 
		OR status_towaru='Na wyczerpaniu';
END
--EXEC stan;
GO

CREATE PROCEDURE stan_3
	@ile_jest INT
AS BEGIN
	UPDATE 
		Towary 
	SET 
		status_towaru='Na wyczerpaniu' 
	WHERE 
		ilosc>0 
		AND ilosc<@ile_jest;
END
GO
--Przyklad
--EXEC stan_3 7;

GO
