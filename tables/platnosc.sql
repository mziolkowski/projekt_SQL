
CREATE TABLE Platnosc (
	id_platnosc INT IDENTITY,
	gotowka BIT,
	przelew BIT,
	raty BIT,
	kwota DECIMAL (10,2),

PRIMARY KEY (id_platnosc));
