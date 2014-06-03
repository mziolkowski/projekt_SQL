
-- W02 --
/* Widok prezentuje osoby na stanowisku Magazynier, ktore nie zostaly zwolnione i otrzymaly premie */

CREATE VIEW mgr_prem AS (
SELECT
	p.imie,
	p.nazwisko,
	s.nazwa
FROM
	Pracownicy p,
	Stanowiska s
WHERE
	p.id_stanowiska=s.id_stanowiska 
	AND p.data_zwol IS NULL
	AND p.premia IS NOT NULL
	AND s.nazwa LIKE 'Magazynier'
);
GO

-- Przyklad --
-- SELECT * FROM mgr_prem;