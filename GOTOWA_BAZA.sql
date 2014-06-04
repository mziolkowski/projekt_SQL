DROP DATABASE firma;
GO
CREATE DATABASE firma;
GO

USE firma;
GO


CREATE TABLE Koszyk (
	id_koszyk INT,
	id_towar INT NOT NULL,
	ilosc INT NOT NULL

PRIMARY KEY (id_koszyk));
GO


CREATE TABLE Klient (
	id_klient INT,
	firma VARCHAR (20),
	imie VARCHAR (20) NOT NULL,
	nazwisko VARCHAR (30) NOT NULL,
	adres VARCHAR (40) NOT NULL,
	kod_pocztowy VARCHAR (7) NOT NULL,
	miejscowosc VARCHAR (30) NOT NULL,
	telefon VARCHAR (15) NOT NULL,
	mail VARCHAR (30) NOT NULL,
	staly_klient BIT,

PRIMARY KEY (id_klient));
GO


CREATE TABLE Platnosci (
	id_platnosci INT IDENTITY (1001,1),
	gotowka BIT,
	przelew BIT,
	raty BIT,
	kwota DECIMAL (10,2),

PRIMARY KEY (id_platnosci));
GO


CREATE TABLE Transport ( 
		id_transport INT,
		nazwa VARCHAR (50) NOT NULL,
		rodzaj VARCHAR (50) NOT NULL,

PRIMARY KEY (id_transport));
GO




CREATE TABLE Stanowiska (
	id_stanowiska INT NOT NULL,
	nazwa VARCHAR (20) NOT NULL

PRIMARY KEY (id_stanowiska));
GO


CREATE TABLE Kod_towaru (
	id_kod INT,
	magazyn VARCHAR (20) NOT NULL,
	hala VARCHAR (2) NOT NULL,
	poziom VARCHAR (2) NOT NULL,
	regal VARCHAR (2) NOT NULL,
	polka VARCHAR (2) NOT NULL

PRIMARY KEY (id_kod));
GO


CREATE TABLE Import (
	id_import INT,
	nazwa VARCHAR (30) NOT NULL,
	adres VARCHAR (40) NOT NULL,
	kod_pocztowy VARCHAR (7) NOT NULL,
	miasto VARCHAR (20) NOT NULL,
	telefon VARCHAR (15) NOT NULL, 
	poczatek_wspol DATE NOT NULL,
	koniec_wspol DATE,
	prezes_firmy VARCHAR (50) NOT NULL,
	kraj VARCHAR (20) NOT NULL

PRIMARY KEY (id_import));
GO


CREATE TABLE Pracownicy (
	id_pracownicy INT,
	imie VARCHAR (20) NOT NULL,
	nazwisko VARCHAR (50) NOT NULL,
	data_ur DATE NOT NULL,
	miasto VARCHAR (30) NOT NULL,
	adres VARCHAR (40) NOT NULL,
	telefon VARCHAR (15) NOT NULL,
	data_zatr DATE NOT NULL,
	data_zwol DATE,
	mail VARCHAR (30) NOT NULL,
	premia DECIMAL (10,2),
	pensja DECIMAL (10,2) NOT NULL,
	id_stanowiska INT NOT NULL

PRIMARY KEY (id_pracownicy));

ALTER TABLE pracownicy ADD FOREIGN KEY (id_stanowiska) REFERENCES stanowiska (id_stanowiska)
GO


CREATE TABLE Towary (
	id_towar INT,
	typ VARCHAR (90) NOT NULL,
	marka VARCHAR (90) NOT NULL,
	model VARCHAR (90) NOT NULL,
	id_kod INT NOT NULL,
	status_towaru VARCHAR (90) NOT NULL,
	opis VARCHAR (250) NOT NULL,
	ilosc INT,
	cena DECIMAL (10,2) NOT NULL,
	id_import INT

PRIMARY KEY (id_towar));

ALTER TABLE Towary ADD FOREIGN KEY (id_kod) REFERENCES Kod_towaru (id_kod)
ALTER TABLE Towary ADD FOREIGN KEY (id_import) REFERENCES Import (id_import)
GO



CREATE TABLE Zamowienia (
	id_zamowienia INT,
	id_koszyk INT NOT NULL,
	id_klienta INT NOT NULL,
	data_zamowienia DATE NOT NULL,
	id_platnosci INT NOT NULL,
	zaplacone BIT NOT NULL,
	faktura BIT,
	status_zamowienia VARCHAR (20) NOT NULL,
	id_transport INT NOT NULL,
	czas_dostawy VARCHAR (2) NOT NULL

PRIMARY KEY (id_zamowienia));

ALTER TABLE Zamowienia ADD FOREIGN KEY (id_koszyk) REFERENCES Koszyk (id_koszyk)
ALTER TABLE Zamowienia ADD FOREIGN KEY (id_klienta) REFERENCES Klient (id_klient)
ALTER TABLE Zamowienia ADD FOREIGN KEY (id_platnosci) REFERENCES platnosci (id_platnosci)
ALTER TABLE Zamowienia ADD FOREIGN KEY (id_transport) REFERENCES Transport (id_transport)
GO



INSERT INTO Stanowiska VALUES 
	(1001,'Prezes'),
	(1002,'Kierownik'),
	(1003,'Handlowiec'),
	(1004,'Magazynier'),
	(1005,'Sprzedawca'),
	(1006,'Informatyk'),
	(1007,'Księgowy');
GO


INSERT INTO Pracownicy VALUES 

-- Prezes --
	(1000,'Krzysztof','Zawada','1965-10-12','Warszawa','Polna 15','213-994-789','1990-01-05',NULL,'krzysztof.zawada@itshop.com',0,15000,1001),

-- Kierownik --
	(1001,'Roman','Ostrzewski','1966-03-22','Warszawa','Jastrzębia 99','920-883-991','1990-01-05',NULL,'roman.ostrzewski@itshop.com',1500,1000,1002),

-- Księgowy --
	(1014,'Michal','Romaniuk','1977-06-12','Warszawa','Szpakowa 8/9','321-534-523','2000-01-05',NULL,'mromaniuk@itshop.com',0,3500,1007),
	(1007,'Wiktoria','Tydla','1979-09-01','Warszawa','Akacjowa 76','884-192-093','2004-02-12','2013-08-14','wtydla@itshop.com',400,2500,1007),

-- Handlowiec --
	(1002,'Olga','Jakucyk','1980-01-12','Warszawa','Syreny 12','893-423-123','1999-12-12','2001-05-15','ojakucyk@itshop.com',200,2000,1003),
	(1006,'Janusz','Bąk','1979-01-19','Piaseczno','Klasztorna 122','892-423-528','1995-12-12','2011-06-25','jbak@itshop.com',500,3000,1003),
	(1004,'Joanna','Ząb','1988-11-02','Grójec','Boczna 5/10','505-452-888','2010-11-10',NULL,'jzab@itshop.com',0,2000,1003),

-- Magazynier --
	(1003,'Szymon','Brzoza','1969-03-16','Piaseczno','Kaktusowa 23','503-984-432','2007-05-11',NULL,'sbrzoza@itshop.com',250,1500,1004),
	(1005,'Michal','Okoń','1986-05-12','Warszawa','Gradowa 99/13','442-312-421','2002-02-16','2006-03-15','mokon@itshop.com',0,1900,1004),
	(1009,'Olaf','Kur','1980-01-12','Radzymin','Radiowa 92','783-423-583','2005-12-12',NULL,'okur@itshop.com',0,2000,1004),
	(1010,'Wiesław','Idek','1966-02-08','Piaseczno','Maślana 23/12','883-312-212','2002-02-16',NULL,'widek@itshop.com',300,1900,1004),

-- Informatyk --
	(1008,'Pawel','Kolder','1978-11-12','Warszawa','Jowisza 18','578-328-290','1998-08-22',NULL,'pkolder@itshop.com',500,4000,1006),

-- Sprzedawca --
	(1011,'Olga','Byk','1980-11-12','Warszawa','Sowia 1','432-423-432','2000-12-12',NULL,'obyk@itshop.com',150,2000,1005),
	(1012,'Jakub','Szmit','1988-01-04','Piaseczno','Szklana 1/12','874-673-875','2000-12-12',NULL,'jszmit@itshop.com',0,2200,1005),
	(1013,'Józef','Olgier','1979-8-09','Warszawa','Garażowa 15','903-837-790','2000-12-12','2011-05-15','jolgier@itshop.com',150,1900,1005);
GO


INSERT INTO Klient VALUES
	(1101,NULL,'Michał','Kłos','Kwiatowa 12','00-312','Warszawa','232-234-842','dark_lord@gmail.com',0),
	(1102,NULL,'Mateusz','Jarosz','Ogrodowa 21/3','01-131','Gdansk','980-423-032','jar_mat@wp.pl',0),
	(1103,'Wirox','Jolanta','Paczork','Farbyki 91','12-023','Katowice','893-110-201','jpaczork@wirox.com',0),
	(1104,NULL,'Gabriella','Sawa','Konduktorska 84/1012','99-987','Kraków','232-234-842','lady0214@gmail.com',0),
	(1105,NULL,'Adam','Strzala','Łakowska 45','72-076','Gdansk','098-234-738','adamson@yahoo.com',0),
	(1106,'Press','Urszula','Sołtek','Sasanki 211','32-823','Katowice','754-895-345','urszula_solek@press.com',0),
	(1107,'Zoofix','Szymon','Chołek','Leśna 15','10-525','Wrocław','543-675-842','s_cholek@zoofif.com',0),
	(1108,'Merida','Michał','Lubisz','Ołtarzowa 5/31','11-922','Kraków','930-321-009','mlubisz@merida.com',0),
	(1109,NULL,'Tomasz','Piłat','Idy 8/42','93-222','Zakopane','939-212-991','tomek.pilat@gmail.com',0),
	(1110,NULL,'Adam','Kor','Sezamkowa 321/43','55-902','Warszawa','321-311-782','Kor001@yahoo.com',0),
	(1111,NULL,'Sebastian','Torr','Kwiatowa 123','00-882','Wrocław','892-444-792','root00213@gmail.com',0);
GO


INSERT INTO Kod_towaru VALUES 
	(1001,'Warszawa','1','A','32','15'),
	(1002,'Warszawa','3','B','28','28'),
	(1003,'Warszawa','1','A','12','2'),
	(1004,'Warszawa','3','B','21','17'),
	(1005,'Warszawa','1','A','2','1'),
	(1006,'Warszawa','2','B','32','15'),
	(1007,'Warszawa','2','A','32','14'),
	(1008,'Warszawa','1','B','2','2'),
	(1009,'Warszawa','1','A','3','10'),
	(1010,'Warszawa','1','A','7','7'),

	(1011,'Warszawa','2','A','12','15'),
	(1012,'Warszawa','1','A','5','28'),
	(1013,'Warszawa','1','B','22','9'),
	(1014,'Warszawa','3','B','9','7'),
	(1015,'Warszawa','1','A','9','14'),
	(1016,'Warszawa','3','B','3','15'),
	(1017,'Warszawa','3','A','16','4'),
	(1018,'Warszawa','2','A','2','5'),
	(1019,'Warszawa','3','A','3','11'),
	(1020,'Warszawa','2','B','7','7'),

	(1021,'Warszawa','2','A','44','19'),
	(1022,'Warszawa','1','B','33','18'),
	(1023,'Warszawa','1','A','19','16'),
	(1024,'Warszawa','2','B','23','27'),
	(1025,'Warszawa','1','A','2','23'),
	(1026,'Warszawa','2','B','8','15'),
	(1027,'Warszawa','2','A','41','32'),
	(1028,'Warszawa','3','B','31','29'),
	(1029,'Warszawa','1','A','28','10'),
	(1030,'Warszawa','1','A','27','23'),

	(1031,'Warszawa','3','A','1','1'),
	(1032,'Warszawa','3','B','2','22'),
	(1033,'Warszawa','2','A','38','25'),
	(1034,'Warszawa','3','B','22','27'),
	(1035,'Warszawa','1','A','39','1'),
	(1036,'Warszawa','2','B','32','25'),
	(1037,'Warszawa','2','A','9','3'),
	(1038,'Warszawa','1','B','22','4'),
	(1039,'Warszawa','1','A','31','10'),
	(1040,'Warszawa','1','A','18','11'),

	(1041,'Warszawa','2','A','11','42'),
	(1042,'Warszawa','1','A','28','28'),
	(1043,'Warszawa','1','A','12','12'),
	(1044,'Warszawa','2','B','14','19'),
	(1045,'Warszawa','2','A','20','10'),
	(1046,'Warszawa','2','A','13','19'),
	(1047,'Warszawa','1','A','30','29'),
	(1048,'Warszawa','3','B','7','17'),
	(1049,'Warszawa','1','B','20','10'),
	(1050,'Warszawa','2','B','39','42'),

	(1051,'Warszawa','1','A','32','7'),
	(1052,'Warszawa','2','A','24','23'),
	(1053,'Warszawa','2','A','17','2'),
	(1054,'Warszawa','2','B','11','17'),
	(1055,'Warszawa','1','B','27','15'),
	(1056,'Warszawa','3','B','15','2'),
	(1057,'Warszawa','3','A','26','22'),
	(1058,'Warszawa','1','A','2','2'),
	(1059,'Warszawa','3','B','38','11'),
	(1060,'Warszawa','1','A','39','7'),

	(1061,'Warszawa','2','A','29','39'),
	(1062,'Warszawa','3','B','35','19'),
	(1063,'Warszawa','2','A','31','2'),
	(1064,'Warszawa','3','B','21','13'),
	(1065,'Warszawa','2','A','3','15'),
	(1066,'Warszawa','2','B','31','39');

--***********************************************************************************************************************************--
GO


INSERT INTO Import VALUES
	(1001,'Intel','Bursztynowa 12','99-083','Szczecin','283-892-391','1990-01-05','2000-01-05','Tomasz Stachurski','Polska'),
	(1002,'Intel','Central Expy 190','33-221','Santa Clara','325-647-432','1995-01-05',NULL,'Jamie L. Matthews','Stany Zjednoczone'),
	(1003,'AMD','Danforth Dr 72','45-874','Sunnyvale','457-437-328','2000-11-12',NULL,'Bruce Claflin','Stany Zjednoczone'),
	(1004,'Samsung','Żelazna 83','00-300','Warszawa','942-117-773','1997-06-06',NULL,'Jan Kozłowski','Polska'),
	(1005,'Asus','Isis Taipei 32','00-043','Tajpej','356-585-883','1998-03-21',NULL,'Jonney Shih','Tajwan'),
	(1006,'Gigabyte','Isis Taipei 56','00-068','Tajpej','758-879-489','1998-03-21',NULL,'Yeh Pei-Cheng','Tajwan'),
	(1007,'MSI','Jana Pawła II 93','00-300','Wrosław','849-234-134','2000-06-02',NULL,'Karol Pałek','Polska'),
	(1008,'Saphire','Grodkowska 123','02-072','Katowice','992-023-472','1992-12-21',NULL,'Dariusz Starnoch','Polska'),
	(1009,'Kingston','Valles 312','09-486','Fountain Valley','546-123-795','1999-12-21',NULL,'John Tu','Stany Zjednoczone'),
	(1010,'Kingston','Romanowska 31','34-241','Kraków','793-231-546','1991-12-09','1998-03-09','Dariusz Starnoch','Polska'),
	(1011,'GoodRam','Mikołowska 42','43-173','Łaziska Górne','459-985-235','1992-07-11',NULL,'Wiesław Andrzejewski','Polska'),
	(1012,'Corsair','Central street 21','23-956','Fremont','315-998-414','2004-08-25',NULL,'Andy Paul','Stany Zjednoczone'),
	(1013,'Corsair','Krzyżanowska 23','78-898','Kraków','123-468-969','1998-08-24','2004-04-12','Michał Kurzajewski','Polska'),
	(1014,'Patriot Memory','Słupecka 83','26-326','Warszawa','135-459-320','2002-09-01',NULL,'Józef Wawrzyniak','Polska'),
	(1015,'XFX - Pine Technology','Sarmacka 22','55-787','Zakopane','012-125-203','1995-02-01',NULL,'Patryk Małysz','Polska'),
	(1016,'SilentiumPC','Okrzei 9','05-870','Błonie','292-013-890','2001-12-03',NULL,'Sylwester Nowak','Polska'),
	(1017,'BeQuiet','Biedenkamp 3A','21-509','Glinde','164-926-312','2003-12-03',NULL,'Hannes Runge','Germany'),
	(1018,'BeQuiet','Piaskowa 8','45-555','Łódź','767-567-643','2000-02-15','2002-11-19','Anna Woźniak','Polska'),
	(1019,'Western Digigtal','Orange 81','15-257','Newport Beach','021-560-320','2000-02-15','2002-11-19	','Matt Massengill','Stany Zjednoczone'),
	(1020,'Western Digigtal','Radarowa 68','65-798','Chełm','476-988-625','2003-12-15',NULL,'Joanna Wiatr','Polska'),
	(1021,'Hitachi','Chiyoda 39','89-939','Tokio','245-123-485','2003-12-15',NULL,'Hiroaki Nakanishi','Japonia'),
	(1022,'Seagate','Sawana 71','96-126','Scotts Valley','210-419-306','1990-04-15',NULL,'Alan Shugart','Stany Zjednoczone'),
	(1023,'Zalman','Isahy 30','36-825','Anyang','154-409-265','2000-08-25',NULL,'Alan Shugart','Korea Południowa'),
	(1024,'Fractal Design','Puławska 189','48-577','Warszawa','236-303-788','1994-02-19',NULL,'Adam Warecki','Polska'),
	(1025,'Cooler Master','Krakowska 77','12-992','Wrocław','556-123-789','1994-09-22',NULL,'Janusz Opolski','Polska'),
	(1026,'Tp-link','Isha 43','98-468','Shenzhen','235-889-225','1997-01-22',NULL,'Zhao Jianjun','Chiny'),
	(1027,'LG','Zamkowa 27','45-336','Kielce','232-454-002','1998-12-01',NULL,'Janusz Michcik','Polska'),
	(1028,'EdiMax','Spacerowa 13','24-668','Warszawa','221-031-784','2001-04-03',NULL,'Bartłomiej Skalski','Polska'),
	(1029,'D-Link','Kolejowa 8','47-112','Kraków','321-402-552','2000-05-28',NULL,'Stefan Mercel','Polska'),
	(1030,'D-Link','Shinghu 12','76-212','Tajpej','892-423-893','1990-12-28','1999-12-24','Tony Tsao','Tajwan');
GO


INSERT INTO Towary VALUES
	(1001,'Procesor','Intel','Core 2 Duo',1001,'Dostępny','2x2,4 GHz, 8Mb cache',7,671.00,1002),
	(1002,'Procesor','Amd','X6 FX-6300',1002,'Niedostępny','2x3,6 GHz, 8Mb cache',0,370.00,1003),
	(1003,'Procesor','Intel','i7-920',1003,'Dostępny','4x2,5 GHz, 10Mb cache',10,999.00,1002),
	(1004,'Procesor','Intel','i5-770',1004,'Dostępny','4x2,2 GHz, 10Mb cache',11,853.00,1002),
	(1005,'Procesor','Amd','X8 FX-8320',1005,'Dostępny','4x3,6 GHz, 10Mb cache',14,535.00,1003),
	(1006,'Procesor','Intel','i5-4670',1006,'Niedostępny','4x3,2 GHz, 10Mb cache',0,870.00,1002),
-------------------------------------------------------------------------------------------------
	(1007,'Grafika','Asus','GeForce GTX 660',1007,'Dostępny','2 Gb DDR5, Szyna 192Bit',12,630.00,1005),
	(1008,'Grafika','Asus','Radeon R9 270X',1008,'Dostępny','2 Gb DDR5, Szyna 256Bit',10,762.00,1005),
	(1009,'Grafika','Gigabyte','Radeon R9 270',1009,'Niedostępny','2 Gb DDR5, Szyna 256Bit',0,630.00,1006),
	(1010,'Grafika','MSI',' Radeon R7 250',1010,'Niedostępny','2 Gb DDR3, Szyna 128Bit',0,293.00,1007),
	(1011,'Grafika','Saphire','Radeon R7 260X',1011,'Dostępny','2 Gb DDR5, Szyna 128Bit',15,460.00,1008),
	(1012,'Grafika','Asus','Radeon R9 270X',1012,'Dostępny','4 Gb DDR5, Szyna 256Bit',18,800.00,1005),
--------------------------------------------------------------------------------------------------
	(1013,'Pamięć RAM','Kingston','HyperX Fury',1013,'Dostępny','4 Gb DDR3, Częstotliwość pracy 1600MHz',20,140.00,1009),
	(1014,'Pamięć RAM','Kingston','HyperX',1014,'Dostępny','2x8 Gb DDR3, Częstotliwość pracy 1600MHz',10,600.00,1009),
	(1015,'Pamięć RAM','GoodRam','Play',1015,'Dostępny','4 Gb DDR3, Częstotliwość pracy 1333MHz',20,135.00,1011),
	(1016,'Pamięć RAM','GoodRam','Play',1016,'Niedostępny','4 Gb DDR3, Częstotliwość pracy 1600MHz',0,140.00,1011),
	(1017,'Pamięć RAM','Corsair','Classic',1017,'Niedostępny','2x2 Gb DDR3, Częstotliwość pracy 1600MHz',0,170.00,1013),
	(1018,'Pamięć RAM','Patriot','Retail',1018,'Dostępny','2x4 Gb DDR3, Częstotliwość pracy 1333MHz',11,280.00,1014),
--------------------------------------------------------------------------------------------------
	(1019,'Płyta główna','Gigabyte','G1-Sniper',1019,'Niedostępny','ATX, Chipset Intel B85, Socket 1150',0,320.00,1006),
	(1020,'Płyta główna','Asus','H81M-E',1020,'Niedostępny','Micro ATX, Chipset Intel B81, Socket 1150',0,185.00,1005),
	(1021,'Płyta główna','Asus','Z87-A',1021,'Dostępny','ATX, Chipset Intel Z87, Socket 1150',12,479.00,1005),
	(1022,'Płyta główna','MSI','Gaming Intel',1022,'Dostępny','ATX, Chipset Intel Z87, Socket 1150',6,460.00,1007),
	(1023,'Płyta główna','MSI','970A-G43',1023,'Dostępny','ATX, Chipset AMD SB950, AMD 970, Socket AM3+',15,223.00,1007),
	(1024,'Płyta główna','Gigabyte','760G',1024,'Niedostępny','Micro ATX, Chipset  AMD SB710, AMD 760G, Socket AM3+, AM3',0,187.00,1006),
--------------------------------------------------------------------------------------------------
	(1025,'Zasilacz','Corsair','VS',1025,'Dostępny','ATX 12V, 450W',15,145.00,1012),
	(1026,'Zasilacz','XFX','Pro Series',1026,'Dostępny',' ATX 12V, EPS12V, 550W',10,235.00,1015),
	(1027,'Zasilacz','Corsair','RM',1027,'Dostępny',' ATX 12V, 850W',0,545.00,1013),
	(1028,'Zasilacz','SilentiumPC','Deus',1028,'Niedostępny',' ATX 12V, 600W',0,235.00,1016),
	(1029,'Zasilacz','Corsair','VS',1029,'Dostępny',' ATX 12V, 350W',3,115.00,1012),
	(1030,'Zasilacz','BeQuiet','Dark Power Pro 10',1030,'Dostępny',' ATX 12V V2.92, ATX 12V V2.31, 550W',5,512.00,1017),
---------------------------------------------------------------------------------------------------
	(1031,'Dysk Twardy 3,5"','Western Digigtal','Caviar Blue',1031,'Dostępny','Sata III, 500Gb 7200RPM, 16MB Cache',9,180.00,1020),
	(1032,'Dysk Twardy 3,5"','Seagate','Classic',1032,'Dostępny','Sata III, 1000b 7200RPM, 64MB Cache',18,195.00,1022),
	(1033,'Dysk Twardy 3,5"','Western Digigtal','Red',1033,'Niedostępny','Sata III, 2000Gb 7200RPM, 64MB Cache',0,13580.00,1019),
	(1034,'Dysk Twardy 3,5"','Hitachi','Ultrastar',1034,'Dostępny','Sata III, 2000Gb 7200RPM, 64MB Cache',3,630.00,1021),
	(1035,'Dysk Twardy 3,5"','Seagate','Barracuda',1035,'Niedostępny','Sata III, 3000Gb 7200RPM, 64MB Cache',0,470.00,1022),
	(1036,'Dysk Twardy 3,5"','Western Digigtal','Caviar Blue',1036,'Dostępny','Sata III, 250Gb 7200RPM, 16MB Cache',13,184.00,1020),
----------------------------------------------------------------------------------------------------
	(1037,'Obudowa','Zalman','Z3 PLUS',1037,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',15,160.00,1023),
	(1038,'Obudowa','SilentiumPC','Gladius M40 Pure',1038,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',18,199.00,1016),
	(1039,'Obudowa','Corsair','Carbide Series 330R',1039,'Niedostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',0,300.00,1012),
	(1040,'Obudowa','SilentiumPC','Brutus M23',1040,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',5,139.00,1016),
	(1041,'Obudowa','Fractal Design','Define R4',1041,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',18,385.00,1024),
	(1042,'Obudowa','Cooler Master','Elite 330U',1042,'Niedostępny','Czarano-srebrna, Midi Tower, Kompatybilność z Micro ATX, ATX',0,155.00,1025),
-----------------------------------------------------------------------------------------------------
	(1043,'Karta sieciowa','TP-LINK Design','TG-3269',1043,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.x',19,35.00,1026),
	(1044,'Karta sieciowa','TP-LINK Design','TF-3239DL',1044,'Niedostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.x',0,16.00,1026),
	(1045,'Karta sieciowa','EdiMax','EN-9260TX-E',1045,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI Express',7,42.00,1028),
	(1046,'Karta sieciowa','D-Link','DFE-528TX',1046,'Niedostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.x',0,34.00,1029),
	(1047,'Karta sieciowa','Intel','Gigabit Pro',1047,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.3',10,110.00,1001),
	(1048,'Karta sieciowa','Intel','Intel E10G42BTDA',1048,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.00',2,1615.00,1001),
-----------------------------------------------------------------------------------------------------
	(1049,'Napęd Optyczny','Asus','DRW-24F1ST',1049,'Dostępny','Czarana, DVD-RW, SATA, Czas dostępu 140ms(CD) 160ms(DVD)',5,63.00,1005),
	(1050,'Napęd Optyczny','LG','GH24NSB0',1050,'Niedostępny','Czarana, DVD-RW, SATA, Czas dostępu 140ms(CD) 160ms(DVD)',0,59.00,1027),
	(1051,'Napęd Optyczny','Samsung','SH-224DB BLACK',1051,'Dostępny','Czarana, DVD-RW, SATA, Czas dostępu 130ms(CD) 150ms(DVD)',8,59.00,1004),
	(1052,'Napęd Optyczny','LG','SST-SOD02',1052,'Dostępny','Srebrna, DVD-RW, SATA, Czas dostępu 130ms(CD) 150ms(DVD)',10,297.00,1027),
	(1053,'Napęd Optyczny','Samsung','SH-224BB',1053,'Niedostępny','Czarana, DVD-RW, SATA, Czas dostępu 130ms(CD) 150ms(DVD)',0,65.00,1004),
	(1054,'Napęd Optyczny','Samsung','SH-118BB',1054,'Dostępny','Czarana, DVD-RW, SATA, Czas dostępu 130ms(CD) 140ms(DVD)',17,65.00,1004),
------------------------------------------------------------------------------------------------------
	(1055,'Karta dźwiękowa','Asus','Xonra DG',1055,'Dostępny','Wewnętrzna, Interfejs PCI, System 5,1',8,95.00,1005),
	(1056,'Karta dźwiękowa','Creative','Sound Blaster Z',1056,'Dostępny','Wewnętrzna, Interfejs PCI-Express x1, System 5,1',11,313.00,1005),
	(1057,'Karta dźwiękowa','Creative','Sound Blaster Recon 3D',1057,'Niedostępny','Wewnętrzna, Interfejs PCI x1',0,365.00,1005),
	(1058,'Karta dźwiękowa','Asus','Xonar Essence ST',1058,'Dostępny','Wewnętrzna, Interfejs PCI',2,679.00,1005),
	(1059,'Karta dźwiękowa','Asus','Xonar DGX',1059,'Dostępny','Wewnętrzna, Interfejs PCI-Express, System 5,1',12,119.00,1005),
	(1060,'Karta dźwiękowa','Creative','X-Fi Extrime Audio',1060,'Niedostępny','Wewnętrzna, Interfejs PCI-Express x1',0,180.00,1005),
-------------------------------------------------------------------------------------------------------
	(1061,'Chłodzenie CPU','SilentiumPC','Fera 2',1061,'Dostępny','Wysokość 152mm, LGA1155, LGA1150, FM2, LGA2011, LGA1366, LGA1156, Prędkość obrotowa 500 - 1400RPM',12,95.00,1016),
	(1062,'Chłodzenie CPU','SilentiumPC','Spartan Pro',1062,'Niedostępny','Wysokość 135mm, LGA1155, LGA1150, FM2, LGA2011, LGA1366, LGA1156, Prędkość obrotowa 500 - 1200RPM',0,67.00,1016),
	(1063,'Chłodzenie CPU','Zalman','CNPS10X Performa',1063,'Dostępny','Wysokość 152mm, LGA1155, LGA1366, LGA1156, LGA775, AM3+, AM3, Prędkość obrotowa 900 - 1350RPM',15,122.00,1023),
	(1064,'Chłodzenie CPU','Zalman','CNPS14X Performa',1064,'Dostępny','Wysokość 160mm, LGA1155, LGA1150, LGA2011, LGA1366, LGA1156,  Prędkość obrotowa 900 - 1350RPM',11,150.00,1023),
	(1065,'Chłodzenie CPU','BeQuiet','Dark Rock Advanced',1065,'Niedostępny','Wysokość 167mm, LGA1155, LGA1150, Socket 940, Socket 754, LGA2011  Prędkość obrotowa 1500RPM',0,212.00,1018),
	(1066,'Chłodzenie CPU','Noctau','NH-U9B',1066,'Dostępny','Wysokość 152mm, LGA1366, LGA1156, LGA775, AM3, AM2+, AM2  Prędkość obrotowa 1500RPM',7,228.00,1023);
--------------------------------------------------------------------------------------------------------
GO


INSERT INTO Transport VALUES 
(1001,'UPC','Kurier'),
(1002,'DHL','Kurier'),
(1003,'FedEX','Kurier'),
(1004,'Poczta Polska','Paczka 48'),
(1005,'Poczta Polska','Paczka 24'),
(1006,'Poczta Polska','Paczka pocztowa priorytetowa');

GO

INSERT INTO Platnosci VALUES 
(1,0,0,250.00),
(0,0,1,155.00),
(0,1,0,55.00),
(1,0,0,123.00),
(1,0,0,250.00),
(0,0,1,120.00),
(0,1,0,134.00),
(1,0,0,172.00);

GO

INSERT INTO Koszyk VALUES
(1001,1003,2),
(1002,1034,3),
(1003,1056,1),
(1004,1011,2),
(1005,1061,1),
(1006,1043,1),
(1007,1013,3),
(1008,1015,4),
(1009,1029,3),
(1010,1054,3);

GO
 INSERT INTO Zamowienia VALUES
 (1001,1001,1101,'2014-05-25',1001,1,0,'W drodze',1006,3),
 (1002,1002,1108,'2014-03-12',1002,1,1,'Dostarczono',1001,3),
 (1003,1003,1101,'2011-02-07',1002,1,0,'W drodze',1004,3),
 (1004,1004,1101,'2012-06-11',1001,1,0,'W drodze',1005,3),
 (1005,1005,1103,'2011-05-01',1001,1,1,'Dostarczono',1002,0),
 (1006,1006,1101,'2012-05-24',1003,1,0,'Dostarczono',1003,0),
 (1007,1007,1105,'2010-06-09',1001,1,0,'W drodze',1006,3),
 (1008,1008,1104,'2011-09-12',1003,1,0,'W drodze',1005,3),
 (1009,1009,1107,'2013-12-01',1002,1,1,'Dostarczono',1001,0),
 (1010,1010,1108,'2012-11-05',1002,1,0,'W drodze',1003,3);
 GO

------------------------------*************************************************-----------------------------------
-- Procedury --

-- P01 --
/* Aktualizuje tabele klient dodajac do pola
 staly klient tak, jesli zrobil w sklepie wiecej niz 3 razy zakupy */
  
CREATE PROCEDURE staly_3
	@ile_zam varchar (2)
AS BEGIN
SET @ile_zam=3;
	UPDATE
		Klient
	SET
		staly_klient = 1 
	WHERE
		id_klient IN 
		(
			SELECT
				id_klient
			FROM
				Zamowienia z
				JOIN
				Klient k
				ON (z.id_klienta=k.id_klient) 
			GROUP BY
				k.id_klient
			HAVING
				COUNT(z.id_zamowienia) > @ile_zam	
		)
END
GO
--Przyklad
--EXEC staly_3 3;
GO



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


-- P03 --
/* Dodanie do tabeli 'Towary' nowego towaru */

CREATE PROCEDURE nowy_towar
	@id_towar INT,
	@typ VARCHAR (30),
	@marka VARCHAR (30),
	@model VARCHAR (30),
	@id_kod INT,
	@status_towaru VARCHAR (20),
	@opis VARCHAR (250),
	@ilosc INT,
	@cena DECIMAL (10,2),
	@id_import INT
AS BEGIN
	INSERT INTO Towary VALUES (
	@id_towar,
	@typ,
	@marka,
	@model,
	@id_kod,
	@status_towaru,
	@opis,
	@ilosc,
	@cena,
	@id_import)
END
GO
--Przyklad
--EXEC nowy_towar 1067,'Dysk HDD', 'Hitachi','M320',1065, 'Dostępny', 'Nowy super szybki dysk 7200RPM',9,600.00,1021;
GO



-- P04 --
/* Procedura dodaje towary do koszyka */

CREATE PROCEDURE koszyczek_1
	@id_koszyk INT,
	@id_towar INT,
	@ilosc INT
AS BEGIN
	INSERT INTO Koszyk VALUES (
	@id_koszyk,
	@id_towar,
	@ilosc)
END
GO
--Przyklad
--EXEC koszyczek_1 1011,1032,2;
GO


-- P05 --
/* Procedura która zwraca towary które trzeba zamówić i zmienia ich status */

CREATE PROCEDURE zam_twr
AS BEGIN
	SELECT 
		* 
	FROM 
		Towary t 
	WHERE 
		T.status_towaru LIKE 'NIEDOSTĘPNY';
		
		UPDATE 
			Towary 
		SET 
			status_towaru='ZAMÓWIONY U PRODUCENTA' 
		WHERE 
			ilosc=0;
END
GO
--Przyklad
--EXEC zam_twr;
GO



-- P06 --
/* Procedura która zwraca jakie towary są w magazynie na poziomie A */

CREATE PROCEDURE twr_magA
AS BEGIN
	SELECT 
		t.id_towar, 
		t.typ, 
		t.marka, 
		t.model 
	FROM 
		Towary t
		JOIN Kod_towaru k
		ON (k.id_kod=t.id_kod ) 
	WHERE 
		k.poziom LIKE 'A'; 
END
GO
--Przyklad
--EXEC twr_magA;
GO


-- P07 --
/* Procedura która dodaje nowe zamowienia do zrealizowania */

CREATE PROCEDURE zam_towaru
	@id_zamowienia INT,
	@id_koszyk INT,
	@id_klienta INT,
	@data_zamowienia DATE,
	@id_platnosci INT,
	@zaplacone BIT,
	@faktura BIT,
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
	@faktura,
	@status_zamowienia,
	@id_transport,
	@czas_dostawy)
END
GO
--Przyklad
 --EXEC zam_towaru 1011,1011,1105,'2014-06-06',1001,1,0,'W drodze',1002,3;





-- P08 --
/* Procedura dodaje do tabeli Klient kolumne Podpowiedz, w celu poinformowania klienta z firmy o mozliwosci wyboru faktury przy platnosci */
CREATE PROCEDURE podpowiedz
AS BEGIN
	 ALTER TABLE 
		 Klient 
	 ADD 
		 Podpowiedz VARCHAR (200)
END;
GO	 
EXEC podpowiedz;		 
GO
 
CREATE PROCEDURE podpowiedz_2
AS BEGIN
		 UPDATE 
			dbo.Klient
		 SET 
			dbo.Klient.Podpowiedz='Przy płatności za zamówienie, zaznacz opcje "FAKTURA" w celu wystawienia faktury na firme'
		 WHERE
			firma IS NOT NULL
END;
GO		
--Przyklad --
--EXEC podpowiedz_2;
 GO 
 

--P09 --
/* Procedura dodaje do tabeli Klient pole 'UWAGA' i pisze w nim uwage klientom, którzy nie robili zakupów, lub zrobili tylko raz */

CREATE PROCEDURE uwaga
 AS BEGIN
	  ALTER TABLE Klient ADD UWAGA VARCHAR (90)
END;
GO
EXEC uwaga;
GO

CREATE PROCEDURE uwaga_2
AS BEGIN
		  UPDATE Klient 
		  SET 
			UWAGA='Zacznij robić więcej zakupów' 
		  WHERE
			id_klient IN 
			(
			  SELECT
				id_klient
			  FROM
				Zamowienia z
				  JOIN
				  Klient k
				  ON (z.id_klienta=k.id_klient) 
			  GROUP BY
				  k.id_klient
			  HAVING
				  COUNT(z.id_zamowienia) < 2
			)
END;
GO
--Przyklad--
--EXEC uwaga_2; 
GO
-----------------------------*************************************************-----------------------------------
GO

-- Funkcje --

-- F01 --
/* FUNKCJA ktora zwraca ilosc importowanych towarów od producenta z którym w wybranych latach nawiązaliśmy współprace */

CREATE FUNCTION towary_grudy
(
	@nazwa VARCHAR (256),
	@data_od DATE,
	@data_do DATE
)
RETURNS INT
AS BEGIN
	DECLARE @ilosc INT
	SELECT
	@ilosc=COUNT(t.id_towar) 
		FROM 
			import i, 
			Towary t 
		WHERE 
			t.id_import=i.id_import 
			AND @nazwa=i.nazwa 
			AND i.poczatek_wspol BETWEEN @data_od AND @data_do
		
RETURN @ilosc
END
GO
--Przyklad
--SELECT dbo.towary_grudy ('Intel','1995-01-01','1996-01-01');
GO

-- F02 --
/*Funkcje ktora zwraca ilosc osób na stanowisku o podanej nazwie */

CREATE FUNCTION stanowiska_1
	(
	@nazwa VARCHAR (40)
	)
RETURNS INT
AS BEGIN
	DECLARE @zmienna INT
	SET @zmienna=(
		SELECT 
			COUNT(p.id_pracownicy) AS Ilosc_osob 
		FROM 
			pracownicy p, 
			stanowiska s 
		WHERE
			p.id_stanowiska=s.id_stanowiska 
			AND s.nazwa=@nazwa
		 )
RETURN @zmienna
END
GO
--Przyklad
--SELECT dbo.stanowiska_1('Handlowiec');
GO


-- F03 --
/* Funkcja która zwraca szczególy kodu towaru, po modelu produktu */

--CREATE FUNCTION kod_1
--	(
--	@model VARCHAR (40)
--	)
--RETURNS VARCHAR
--AS BEGIN
--	DECLARE @kodzik VARCHAR
--	SET @kodzik=(SELECT k.id_kod, k.magazyn, k.hala, k.poziom, k.regal, k.polka FROM Kod_towaru k, Towary t 
--	WHERE @model=t.model AND t.id_kod=k.id_kod)
--RETURN @kodzik;
--END
--GO

IF OBJECT_ID (N'dbo.kod') IS NOT NULL
   DROP FUNCTION dbo.kod
GO

CREATE FUNCTION kod(@model VARCHAR (40))
RETURNS @wynik TABLE 
(
   	[id_kod] [int] NOT NULL,
	[magazyn] [varchar](20) NOT NULL,
	[hala] [varchar](2) NOT NULL,
	[poziom] [varchar](2) NOT NULL,
	[regal] [varchar](2) NOT NULL,
	[polka] [varchar](2) NOT NULL
)
AS
-- body of the function
BEGIN
	INSERT 
		@wynik
	SELECT 
		k.id_kod,	
		k.magazyn,
		k.hala,
		k.poziom,
		k.regal,
		k.polka 
	FROM
		Kod_towaru k,
		Towary t 
	WHERE 
		@model=t.model 
		AND
		t.id_kod=k.id_kod
   RETURN
END
GO

--Przyklad
--SELECT * FROM kod ('i7-920');

-- F04 --
/* Funkcja która zwraca najniższą cenę produktu konkretnego typu */

--CREATE FUNCTION nis_cena
--	(
--	@nazwa VARCHAR (40)
--	)
--RETURNS VARCHAR
--AS BEGIN
--	DECLARE @tani VARCHAR
--	SET @tani=(SELECT t.typ ,t.marka, t.model, t.opis, t.cena, t.ilosc, t.status_towaru 
--	FROM Towary t WHERE @nazwa=T.typ AND t.cena=MIN(t.cena))
--RETURN @tani;
--END 
--GO


IF OBJECT_ID (N'nis_cena') IS NOT NULL
   DROP FUNCTION nis_cena
GO

CREATE FUNCTION nis_cena (@typ VARCHAR (90))
RETURNS @wyniki TABLE 
(
    -- columns returned by the function
	[typ] [varchar](990) NOT NULL,
	[marka] [varchar](90) NOT NULL,
	[model] [varchar](90) NOT NULL,
	[status_towaru] [varchar](90) NOT NULL,
	[opis] [varchar](250) NOT NULL,
	[ilosc] [int] NULL,
	[cena] [decimal](10, 2) NOT NULL
)
AS
-- body of the function
BEGIN
	INSERT @wyniki 
	SELECT TOP 1
		t.typ,
		t.marka,
		t.model,
		t.status_towaru, 
		t.opis,
		t.ilosc,
		t.cena
	FROM
		Towary t
	WHERE
		T.typ = @typ
	ORDER BY
		t.cena ASC
	
	RETURN
END
GO

-- Przyklad
--SELECT * FROM nis_cena('Grafika');

-- F05 -- 
/* Funkcja która wyswietla najwyższą wyplate na wskazanym stanowisku */

CREATE FUNCTION pensja_stan
	(
	@nazwa VARCHAR (20)
	)
RETURNS INT
AS BEGIN
	DECLARE 
	@calosc INT
	SET 
	@calosc=(
		SELECT TOP 1 
			(p.premia)+(p.pensja) AS Wyplata 
		FROM 
			pracownicy p, 
			stanowiska s
		WHERE 
			id_pracownicy=id_pracownicy 
			AND @nazwa=s.nazwa 
			AND s.id_stanowiska=p.id_stanowiska 
		ORDER BY Wyplata DESC
		)
RETURN @calosc
END
GO
--Przyklad
--SELECT  dbo.pensja_stan('Handlowiec');
GO



--*********************************************************************************************************************************************--
-- TRANSAKCJE --

-- T01 --
/* Treansakcja usuwa z tabeli Pracownicy osoby zwolnione */

-- BEGIN TRANSACTION
	-- DELETE FROM Pracownicy 
	-- WHERE 
		-- data_zwol IS NOT NULL;
	-- COMMIT;
-- GO

 -- T02 --
 /* Transakcja usuwa rekory z tabeli Zamowienia, które sa sprzed 2012 */
 
 -- BEGIN TRANSACTION
	-- DELETE 
	-- FROM 
		-- Zamowienia 
	-- WHERE 
		-- YEAR(data_zamowienia)<=2011;
-- COMMIT;
-- GO

-- T03 --
/* Transakcja, która archiwizuje cała baze danych */

--BEGIN TRANSACTION

--	SELECT 
--	* 
--	INTO Pracownicy_BACKUP FROM Pracownicy;
	
--		SELECT 
--		* 
--		INTO Import_BACKUP FROM Import;
		
--			SELECT 
--			* 
--			INTO Klient_BACKUP FROM Klient;
			
--				SELECT 
--				* 
--				INTO Koszyk_BACKUP FROM Koszyk;
				
--					SELECT 
--					* 
--					INTO Platnosci_BACKUP FROM Platnosci;
					
--						SELECT 
--						* 
--						INTO Stanowiska_BACKUP FROM Stanowiska;
						
--							SELECT 
--							* 
--							INTO Towary_BACKUP FROM Towary;
							
--								SELECT 
--								* 
--								INTO Transport_BACKUP FROM Transport;
									
--									SELECT 
--									* 
--									INTO Zamowienia_BACKUP FROM Zamowienia;
	
--COMMIT;
--GO

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

-- W01 --
/* Widok prezentuje ilosc transakcji w obecnym miesiacu */

CREATE VIEW tran_mies1 AS (
SELECT
* 
FROM Zamowienia z
WHERE
DATEPART(MM,z.data_zamowienia) = MONTH(GETDATE())
AND DATEPART(YY,z.data_zamowienia) = YEAR(GETDATE()));
GO

-- Przyklad --
-- SELECT * FROM tran_mies1;
GO

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

-- W05 --
/* Widok przedstawia, stalych klientow */

CREATE VIEW klient_staly AS (
SELECT
	*
FROM 
	Klient
WHERE
	staly_klient=1
);
GO
--Przyklad--
--SELECT * FROM klient_staly;

