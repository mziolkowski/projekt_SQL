
-- W03 --
/* Widok prezentujacy towary niedostepne */

CREATE VIEW niedos_twr AS (
SELECT
	t.typ,
	t.marka,
	t.model,
	i.nazwa AS U_niego_zamowic,
	i.telefon
	
FROM
	Towary t,
	Import i
WHERE
	t.status_towaru LIKE 'Niedostępny'
	AND t.id_import=i.id_import
);
GO
-- Przyklad --
--SELECT * FROM niedos_twr;	