
-- Procedury --

-- P01 --
/* Aktualizuje tabele klient dodajac do pola
 staly klient tak, jesli zrobil w sklepie wiecej niz 4 razy zakupy */
  
CREATE PROCEDURE staly_3
AS BEGIN
	UPDATE Klient SET staly_klient=1 FROM Zamowienia z JOIN Klient k ON (z.id_klienta=k.id_klient ) GROUP BY staly_klient  HAVING COUNT(z_id_zamowienia)=4 ;
END
EXEC staly_2;

