
CREATE TABLE Platnosci (
	id_platnosci INT IDENTITY,
	gotowka BIT,
	przelew BIT,
	raty BIT,
	kwota DECIMAL (10,2),

PRIMARY KEY (id_platnosci));
GO
