
-- P02 --
/* Dodanie do tabeli towary opisu 'Niedostepny' jesli bedzie 0 sztuk na stanie i "Na wyczerpaniu" jesli ilosc bedzie mniej niż 6 */

CREATE PROCEDURE stan
AS BEGIN
	UPDATE 
		Towary 
	SET 
		status_towaru='Niedostępny'
	WHERE 
		ilosc=0;
END
--EXEC stan;
GO

CREATE PROCEDURE stan_3
AS BEGIN
	UPDATE 
		Towary 
	SET 
		status_towaru='Na wyczerpaniu' 
	WHERE 
		ilosc>0 
		AND ilosc<7;
END
GO
--Przyklad
--EXEC stan_3;

GO
