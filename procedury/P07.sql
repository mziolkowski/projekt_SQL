
-- P07 --
/* Procedura która dodaje nowe zamowienia do zrealizowania */

CREATE PROCEDURE zam_towaru
	@id_zamowienia INT,
	@id_koszyk INT,
	@id_klienta INT,
	@data_zamowienia DATE,
	@id_platnosci INT,
	@zaplacone BIT,
	@faktora BIT,
	@status_zamowienia VARCHAR (90),
	@id_transport INT,
	@czas_dostawy VARCHAR (2)
AS BEGIN
INSERT INTO Zamowienia VALUES (
	@id_zamowienia,
	@id_koszyk,
	@id_klienta,
	@data_zamowienia,
	@id_platnosci,
	@zaplacone,
	@faktora,
	@status_zamowienia,
	@id_transport,
	@czas_dostawy)
END
GO
--Przyklad
 --EXEC zam_towaru 1011,1011,1105,'2014-06-06',1001,1,0,'W drodze',1002,3;


------------------------------*************************************************-----------------------------------
GO
