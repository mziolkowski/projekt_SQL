USE  firma;

CREATE TABLE Zamowienia (
id_zamowienia INT IDENTITY (1001,1),
id_koszyk INT,
id_klienta INT,
data_zamowienia DATE,
id_platnosc INT,
zaplacone BIT,
faktora BIT,
status_zamowienia VARCHAR (20),
id_transport INT,
czas_dostawy VARCHAR (2),

PRIMARY KEY (id_zamowienia));


CREATE TABLE Klient (
id_klient INT,
firma VARCHAR (20),
imie VARCHAR (20),
nazwisko VARCHAR (30),
adres VARCHAR (40),
kod_pocztowy VARCHAR (7),
miejscowosc VARCHAR (30),
telefon VARCHAR (15),
mail VARCHAR (30),

PRIMARY KEY (id_klient));

CREATE TABLE Importer (
id_importer INT,
nazwa VARCHAR (30),
adres VARCHAR (40),
kod_pocztowy VARCHAR (7),
miasto varchar(20),
telefon VARCHAR (15),
poczatek_wspol DATE,
koniec_wspol DATE,
prezes_firmy VARCHAR (50),
kraj VARCHAR (20),

PRIMARY KEY (id_importer));
CREATE TABLE Kod_towaru (
id_kod INT,
magazyn VARCHAR (20),
hala VARCHAR (2),
poziom VARCHAR (2),
regal VARCHAR (2),
polka VARCHAR (2),

PRIMARY KEY (id_kod));
CREATE TABLE Koszyk (
id_koszyk INT,
produkt INT,
ilosc INT,
cena DECIMAL (10,2),

PRIMARY KEY (id_koszyk));
CREATE TABLE Platnosc (
id_platnosc INT IDENTITY (1001,1),
gotowka BIT,
przelew BIT,
raty BIT,
kwota DECIMAL (10,2),
waluta CHAR (3),

PRIMARY KEY (id_platnosc));
CREATE TABLE Pracownik (
id_pracownik INT,
imie VARCHAR (20),
nazwisko VARCHAR (50),
data_ur DATE,
miasto VARCHAR (30),
adres VARCHAR (40),
telefon VARCHAR (15),
data_zatr DATE,
data_zwol DATE,
mail VARCHAR (30),
premia DECIMAL (10,2),
pensja DECIMAL (10,2),
id_stanowisko INT,

PRIMARY KEY (id_pracownik));
CREATE TABLE Stanowisko (
id_stanowisko INT,
nazwa VARCHAR (20),

PRIMARY KEY (id_stanowisko));
CREATE TABLE Towary (
id_towar INT,
typ VARCHAR (30),
marka VARCHAR (30),
model VARCHAR (30),
id_kod INT,
status_towaru VARCHAR (20),
opis VARCHAR (250),
ilosc INT,
cena DECIMAL (10,2),
id_importer INT,

PRIMARY KEY (id_towar));
CREATE TABLE Transport ( 
id_transport INT IDENTITY (1001,1),
nazwa VARCHAR (30),
rodzaj VARCHAR (20),
adres VARCHAR (40),
telefon VARCHAR (15),
miejscowosc VARCHAR (30),

PRIMARY KEY (id_transport));

INSERT INTO Pracownik VALUES 
-- Prezes --
(1000,'Krzysztof','Zawada','1965-10-12','Warszawa','Polna 15','213-994-789','1990-01-05',NULL,'krzysztof.zawada@itshop.com',NULL,15000,1000),

-- Kierownik --
(1001,'Roman','Ostrzewski','1966-03-22','Warszawa','Jastrzębia 99','920-883-991','1990-01-05',NULL,'roman.ostrzewski@itshop.com',1500,1000,1001),

-- Ksiegowy --
(1014,'Michal','Romaniuk','1977-06-12','Warszawa','Szpakowa 8/9','321-534-523','2000-01-05',NULL,'mromaniuk@itshop.com',NULL,3500,1006),
(1007,'Wiktoria','Tydla','1979-09-01','Warszawa','Akacjowa 76','884-192-093','2004-02-12','2013-08-14','wtydla@itshop.com',400,2500,1006),

-- Handlowiec --
(1002,'Olga','Jakucyk','1980-01-12','Warszawa','Syreny 12','893-423-123','1999-12-12','2001-05-15','ojakucyk@itshop.com',200,2000,1002),
(1006,'Janusz','Bąk','1979-01-19','Piaseczno','Klasztorna 122','892-423-528','1995-12-12','2011-06-25','jbak@itshop.com',500,3000,1002),
(1004,'Joanna','Ząb','1988-11-02','Grójec','Boczna 5/10','505-452-888','2010-11-10',NULL,'jzab@itshop.com',NULL,2000,1002),

-- Magazynier --
(1003,'Szymon','Brzoza','1969-03-16','Piaseczno','Kaktusowa 23','503-984-432','2007-05-11',NULL,'sbrzoza@itshop.com',250,1500,1003),
(1005,'Michal','Okoń','1986-05-12','Warszawa','Gradowa 99/13','442-312-421','2002-02-16','2006-03-15','mokon@itshop.com',NULL,1900,1003),
(1009,'Olaf','Kur','1980-01-12','Radzymin','Radiowa 92','783-423-583','2005-12-12',NULL,'okur@itshop.com',NULL,2000,1003),
(1010,'Wiesław','Idek','1966-02-08','Piaseczno','Maślana 23/12','883-312-212','2002-02-16',NULL,'widek@itshop.com',300,1900,1003),

-- Informatyk --
(1008,'Pawel','Kolder','1978-11-12','Warszawa','Jowisza 18','578-328-290','1998-08-22',NULL,'pkolder@itshop.com',500,4000,1005),

-- Sprzedawca --
(1011,'Olga','Byk','1980-11-12','Warszawa','Sowia 1','432-423-432','2000-12-12',NULL,'obyk@itshop.com',150,2000,1004),
(1012,'Jakub','Szmit','1988-01-04','Piaseczno','Szklana 1/12','874-673-875','2000-11-12',NULL,'jszmit@itshop.com',NULL,2200,1004),
(1013,'Józef','Olgier','1979-8-09','Warszawa','Garażowa 15','903-837-790','2000-12-12','2011-05-15','jolgier@itshop.com',150,1900,1004);

INSERT INTO Klient VALUES
(1101,NULL,'Michał','Kłos','Kwiatowa 12','00-312','Warszawa','232-234-842','dark_lord@gmail.com'),
(1102,NULL,'Mateusz','Jarosz','Ogrodowa 21/3','01-131','Gdansk','980-423-032','jar_mat@wp.pl'),
(1103,'Wirox','Jolanta','Paczork','Farbyki 91','12=023','Katowice','893-110-201','jpaczork@wirox.com'),
(1104,NULL,'Gabriella','Sawa','Konduktorska 84/1012','99-987','Kraków','232-234-842','lady0214@gmail.com'),
(1105,NULL,'Adam','Strzala','�?akowska 45','72-076','Gdansk','098-234-738','adamson@yahoo.com'),
(1106,'Press','Urszula','Sołtek','Sasanki 211','32-823','Katowice','754-895-345','urszula_solek@press.com'),
(1107,'Zoofix','Szymon','Chołek','Leśna 15','10-525','Wrocław','543-675-842','s_cholek@zoofif.com'),
(1108,'Merida','Michał','Lubisz','Ołtarzowa 5/31','11-922','Kraków','930-321-009','mlubisz@merida.com'),
(1109,NULL,'Tomasz','Piłat','Idy 8/42','93-222','Zakopane','939-212-991','tomek.pilat@gmail.com'),
(1110,NULL,'Adam','Kor','Sezamkowa 321/43','55-902','Warszawa','321-311-782','Kor001@yahoo.com'),
(1111,NULL,'Sebastian','Torr','Kwiatowa 123','00-882','Wrocław','892-444-792','root00213@gmail.com')
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

INSERT INTO importer VALUES
(1001,'Intel','Bursztynowa 12','99-083','Szczecin','283-892-391','1990-01-05','2000-01-05','Tomasz Stachurski','Polska'),
(1002,'Intel','Central Expy 190','33-221','Santa Clara','325-647-432','1995-01-05',NULL,'Jamie L. Matthews','Stany Zjednoczone'),
(1003,'AMD','Danforth Dr 72','45-874','Sunnyvale','457-437-328','2000-11-12',NULL,'Bruce Claflin','Stany Zjednoczone'),
(1004,'Samsung','Żelazna 83','00-300','Warszawa','942-117-773','1997-06-06',NULL,'Jan Kozłowski','Polska'),
(1005,'Asus','Isis Taipei 32','00-043','Tajpej','356-585-883','1998-03-21',NULL,'Jonney Shih','Tajwan'),
(1006,'Gigabyte','Isis Taipei 56','00-068','Tajpej','758-879-489','1998-03-21',NULL,'Yeh Pei-Cheng','Tajwan'),
(1007,'MSI','Jana Pawła II 93','00-300','Wrosław','849-234-134','2000-10-02',NULL,'Karol Pałek','Polska'),
(1008,'Saphire','Grodkowska 123','02-072','Katowice','992-023-472','1992-12-21',NULL,'Dariusz Starnoch','Polska'),
(1009,'Kingston','Valles 312','09-486','Fountain Valley','546-123-795','1999-12-21',NULL,'John Tu','Stany Zjednoczone'),
(1010,'Kingston','Romanowska 31','34-241','Kraków','793-231-546','1991-12-09','1998-03-09','Dariusz Starnoch','Polska'),
(1011,'GoodRam','Mikołowska 42','43-173','�?aziska Górne','459-985-235','1992-07-11',NULL,'Wiesław Andrzejewski','Polska'),
(1012,'Corsair','Central street 21','23-956','Fremont','315-998-414','2004-08-25',NULL,'Andy Paul','Stany Zjednoczone'),
(1013,'Corsair','Krzyżanowska 23','78-898','Kraków','123-468-969','1998-08-24','2004-04-12','Michał Kurzajewski','Polska'),
(1014,'Patriot Memory','Słupecka 83','26-326','Warszawa','135-459-320','2002-09-01',NULL,'Józef Wawrzyniak','Polska'),
(1015,'XFX - Pine Technology','Sarmacka 22','55-787','Zakopane','012-125-203','1995-02-01',NULL,'Patryk Małysz','Polska'),
(1016,'SilentiumPC','Okrzei 9','05-870','Błonie','292-013-890','2001-12-03',NULL,'Sylwester Nowak','Polska'),
(1017,'BeQuiet','Biedenkamp 3A','21-509','Glinde','164-926-312','2003-12-03',NULL,'Hannes Runge','Germany'),
(1018,'BeQuiet','Piaskowa 8','45-555','�?ódź','767-567-643','2000-02-15','2002-11-19	','Anna Woźniak','Polska'),
(1019,'Western Digigtal','Orange 81','15-257','Newport Beach','021-560-320','2000-02-15','2002-11-19	','Matt Massengill','Stany Zjednoczone'),
(1020,'Western Digigtal','Radarowa 68','65-798','Chełm','476-988-625','2003-12-15',NULL,'Joanna Wiatr','Polska'),
(1021,'Hitachi','Chiyoda 39','89-939','Tokio','245-123-485','2003-12-15',NULL,'Hiroaki Nakanishi','Japonia'),
(1022,'Seagate','Sawana 71','96-126','Scotts Valley','210-419-306','1990-04-15',NULL,'Alan Shugart','Stany Zjednoczone'),
(1023,'Zalman','Isahy 30','36-825','Anyang','154-409-265','2000-08-25',NULL,'Alan Shugart','Korea Południowa'),
(1024,'Fractal Design','Puławska 189','48-577','Warszawa','236-303-788','1994-02-19',NULL,'Adam Warecki','Polska'),
(1025,'Cooler Master','Krakowska 77','12-992','Wrocław','556-123-789','1994-09-22',NULL,'Janusz Opolski','Polska'),
(1026,'Tp-link','Isha 43','98-468','Shenzhen','235-889-225','1997-01-22',NULL,'Zhao Jianjun','Chiny'),
(1027,'LG','Zamkowa 27','45-336','Kielce','232-454-002','1998-12-01',NULL,'Janusz Michcik','Polska'),
(1028,'EdiMax','Spacerowa 13','24-668','Warsawa','221-031-784','2001-04-03',NULL,'Bartłomiej Skalski','Polska'),
(1029,'D-Link','Kolejowa 8','47-112','Kraków','321-402-552','2000-05-28',NULL,'Stefan Mercel','Polska'),
(1030,'D-Link','Shinghu 12','76-212','Tajpej','892-423-893','1990-12-28','1999-12-24','Tony Tsao','Tajwan')
INSERT INTO Stanowisko VALUES 
(1000,'Prezes'),
(1001,'Kierownik'),
(1002,'Handlowiec'),
(1003,'Magazynier'),
(1004,'Sprzedawca'),
(1005,'Informatyk'),
(1006,'Księgowy');
INSERT INTO Towary VALUES
(1001,'Procesor','Intel','Core 2 Duo',1001,'Dostępny','2x2,4 GHz, 8Mb cache',7,671.00,1001),
(1002,'Procesor','Amd','X6 FX-6300',1002,'Niedostępny','2x3,6 GHz, 8Mb cache',0,370.00,1001),
(1003,'Procesor','Intel','i7-920',1003,'Dostępny','4x2,5 GHz, 10Mb cache',10,999.00,1001),
(1004,'Procesor','Intel','i5-770',1004,'Dostępny','4x2,2 GHz, 10Mb cache',11,853.00,1001),
(1005,'Procesor','Amd','X8 FX-8320',1005,'Dostępny','4x3,6 GHz, 10Mb cache',14,535.00,1001),
(1006,'Procesor','Intel','i5-4670',1006,'Niedostępny','4x3,2 GHz, 10Mb cache',0,870.00,1001),
-------------------------------------------------------------------------------------------------
(1007,'Grafika','Asus','GeForce GTX 660',1007,'Dostępny','2 Gb DDR5, Szyna 192Bit',12,630.00,1001),
(1008,'Grafika','Asus','Radeon R9 270X',1008,'Dostępny','2 Gb DDR5, Szyna 256Bit',10,762.00,1001),
(1009,'Grafika','Gigabyte','Radeon R9 270',1009,'Niedostępny','2 Gb DDR5, Szyna 256Bit',0,630.00,1001),
(1010,'Grafika','MSI',' Radeon R7 250',1010,'Niedostępny','2 Gb DDR3, Szyna 128Bit',0,293.00,1001),
(1011,'Grafika','Sapphire','Radeon R7 260X',1011,'Dostępny','2 Gb DDR5, Szyna 128Bit',15,460.00,1001),
(1012,'Grafika','Asus','Radeon R9 270X',1012,'Dostępny','4 Gb DDR5, Szyna 256Bit',18,800.00,1001),
--------------------------------------------------------------------------------------------------
(1013,'Pamięć RAM','Kingston','HyperX Fury',1013,'Dostępny','4 Gb DDR3, Częstotliwość pracy 1600MHz',20,140.00,1001),
(1014,'Pamięć RAM','Kingston','HyperX',1014,'Dostępny','2x8 Gb DDR3, Częstotliwość pracy 1600MHz',10,600.00,1001),
(1015,'Pamięć RAM','GoogRam','Play',1015,'Dostępny','4 Gb DDR3, Częstotliwość pracy 1333MHz',4,135.00,1001),
(1016,'Pamięć RAM','GoodRam','Play',1016,'Niedostępny','4 Gb DDR3, Częstotliwość pracy 1600MHz',0,140.00,1001),
(1017,'Pamięć RAM','Corsair','Classic',1017,'Niedostępny','2x2 Gb DDR3, Częstotliwość pracy 1600MHz',0,170.00,1001),
(1018,'Pamięć RAM','Patriot','Retail',1018,'Dostępny','2x4 Gb DDR3, Częstotliwość pracy 1333MHz',11,280.00,1001),
--------------------------------------------------------------------------------------------------
(1019,'Płyta główna','Gigabyte','G1-Sniper',1019,'Niedostępny','ATX, Chipset Intel B85, Socket 1150',0,320.00,1001),
(1020,'Płyta główna','Asus','H81M-E',1020,'Niedostępny','Micro ATX, Chipset Intel B81, Socket 1150',0,185.00,1001),
(1021,'Płyta główna','Asus','Z87-A',1021,'Dostępny','ATX, Chipset Intel Z87, Socket 1150',12,479.00,1001),
(1022,'Płyta główna','MSI','Gaming Intel',1022,'Dostępny','ATX, Chipset Intel Z87, Socket 1150',6,460.00,1001),
(1023,'Płyta główna','MSI','970A-G43',1023,'Dostępny','ATX, Chipset AMD SB950, AMD 970, Socket AM3+',15,223.00,1001),
(1024,'Płyta główna','Gigabyte','760G',1024,'Niedostępny','Micro ATX, Chipset  AMD SB710, AMD 760G, Socket AM3+, AM3',0,187.00,1001),
--------------------------------------------------------------------------------------------------
(1025,'Zasilacz','Corsair','VS',1025,'Dostępny','ATX 12V, 450W',15,145.00,1001),
(1026,'Zasilacz','XFX','Pro Series',1026,'Dostępny',' ATX 12V, EPS12V, 550W',10,235.00,1001),
(1027,'Zasilacz','Corsair','RM',1027,'Niedostępny',' ATX 12V, 850W',0,545.00,1001),
(1028,'Zasilacz','SilentiumPC','Deus',1028,'Niedostępny',' ATX 12V, 600W',0,235.00,1001),
(1029,'Zasilacz','Corsair','VS',1029,'Dostępny',' ATX 12V, 350W',9,115.00,1001),
(1030,'Zasilacz','BeQuiet','Dark Power Pro 10',1030,'Dostępny',' ATX 12V V2.92, ATX 12V V2.31, 550W',5,512.00,1001),
---------------------------------------------------------------------------------------------------
(1031,'Dysk Twardy 3,5"','Western Digigtal','Caviar Blue',1031,'Dostępny','Sata III, 500Gb 7200RPM, 16MB Cache',9,180.00,1001),
(1032,'Dysk Twardy 3,5"','Seagate','Classic',1032,'Dostępny','Sata III, 1000b 7200RPM, 64MB Cache',18,195.00,1001),
(1033,'Dysk Twardy 3,5"','Western Digigtal','Red',1033,'Niedostępny','Sata III, 2000Gb 7200RPM, 64MB Cache',0,358.00,1001),
(1034,'Dysk Twardy 3,5"','Hitachi','Ultrastar',1034,'Dostępny','Sata III, 2000Gb 7200RPM, 64MB Cache',8,630.00,1001),
(1035,'Dysk Twardy 3,5"','Seagate','Barracuda',1035,'Niedostępny','Sata III, 3000Gb 7200RPM, 64MB Cache',0,470.00,1001),
(1036,'Dysk Twardy 3,5"','Western Digigtal','Caviar Blue',1036,'Dostępny','Sata III, 250Gb 7200RPM, 16MB Cache',13,184.00,1001),
----------------------------------------------------------------------------------------------------
(1037,'Obudowa','Zalman','Z3 PLUS',1037,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',15,160.00,1001),
(1038,'Obudowa','SilentiumPC','Gladius M40 Pure',1038,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',18,199.00,1001),
(1039,'Obudowa','Corsair','Carbide Series 330R',1039,'Niedostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',0,300.00,1001),
(1040,'Obudowa','SilentiumPC','Brutus M23',1040,'Dostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',5,139.00,1001),
(1041,'Obudowa','Fractal Design','Define R4',1004,'Niedostępny','Czarana, Midi Tower, Kompatybilność z Micro ATX, ATX',18,385.00,1001),
(1042,'Obudowa','Cooler Master','Elite 330U',1043,'Niedostępny','Czarano-srebrna, Midi Tower, Kompatybilność z Micro ATX, ATX',0,155.00,1001),
----------------------------------------------------------------------------------------------------
(1043,'Karta sieciowa','TP-LINK Design','TG-3269',1043,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.x',19,35.00,1001),
(1044,'Karta sieciowa','TP-LINK Design','TF-3239DL',1044,'Niedostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.x',0,16.00,1001),
(1045,'Karta sieciowa','EdiMax','EN-9260TX-E',1045,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI Express',7,42.00,1001),
(1046,'Karta sieciowa','D-Link','DFE-528TX',1046,'Niedostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.x',0,34.00,1001),
(1047,'Karta sieciowa','Intel','Gigabit Pro',1047,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.3',10,110.00,1001),
(1048,'Karta sieciowa','Intel','Intel E10G42BTDA',1048,'Dostępny','Przeznaczenie: Komputer stacjonarny, wewnętrzna, PCI 2.00',2,1615.00,1001),
-----------------------------------------------------------------------------------------------------
(1049,'Napęd Optyczny','Asus','DRW-24F1ST',1049,'Dostępny','Czarana, DVD-RW, SATA, Czas dostępu 140ms(CD) 160ms(DVD)',5,63.00,1001),
(1050,'Napęd Optyczny','LG','GH24NSB0',1050,'Niedostępny','Czarana, DVD-RW, SATA, Czas dostępu 140ms(CD) 160ms(DVD)',0,59.00,1001),
(1051,'Napęd Optyczny','Samsung','SH-224DB BLACK',1051,'Dostępny','Czarana, DVD-RW, SATA, Czas dostępu 130ms(CD) 150ms(DVD)',8,59.00,1001),
(1052,'Napęd Optyczny','LG','SST-SOD02',1052,'Dostępny','Srebrna, DVD-RW, SATA, Czas dostępu 130ms(CD) 150ms(DVD)',10,297.00,1001),
(1053,'Napęd Optyczny','Samsung','SH-224BB',1053,'Niedostępny','Czarana, DVD-RW, SATA, Czas dostępu 130ms(CD) 150ms(DVD)',0,65.00,1001),
(1054,'Napęd Optyczny','Samsung','SH-118BB',1054,'Dostępny','Czarana, DVD-RW, SATA, Czas dostępu 130ms(CD) 140ms(DVD)',17,65.00,1001),
------------------------------------------------------------------------------------------------------
(1055,'Karta dźwiękowa','Asus','Xonra DG',1055,'Dostępny','Wewnętrzna, Interfejs PCI, System 5,1',8,95.00,1001),
(1056,'Karta dźwiękowa','Creative','Sound Blaster Z',1056,'Dostępny','Wewnętrzna, Interfejs PCI-Express x1, System 5,1',11,313.00,1001),
(1057,'Karta dźwiękowa','Creative','Sound Blaster Recon 3D',1057,'Niedostępny','Wewnętrzna, Interfejs PCI x1',0,365.00,1001),
(1058,'Karta dźwiękowa','Asus','Xonar Essence ST',1058,'Dostępny','Wewnętrzna, Interfejs PCI',2,679.00,1001),
(1059,'Karta dźwiękowa','Asus','Xonar DGX',1059,'Dostępny','Wewnętrzna, Interfejs PCI-Express, System 5,1',12,119.00,1001),
(1060,'Karta dźwiękowa','Creative','X-Fi Extrime Audio',1060,'Niedostępny','Wewnętrzna, Interfejs PCI-Express x1',0,180.00,1001),
-------------------------------------------------------------------------------------------------------
(1061,'Chłodzenie CPU','SilentiumPC','Fera 2',1061,'Dostępny','Wysokość 152mm, LGA1155, LGA1150, FM2, LGA2011, LGA1366, LGA1156, Prędkość obrotowa 500 - 1400RPM',12,95.00,1001),
(1062,'Chłodzenie CPU','SilentiumPC','Spartan Pro',1062,'Niedostępny','Wysokość 135mm, LGA1155, LGA1150, FM2, LGA2011, LGA1366, LGA1156, Prędkość obrotowa 500 - 1200RPM',0,67.00,1001),
(1063,'Chłodzenie CPU','Zalman','CNPS10X Performa',1063,'Dostępny','Wysokość 152mm, LGA1155, LGA1366, LGA1156, LGA775, AM3+, AM3, Prędkość obrotowa 900 - 1350RPM',15,122.00,1001),
(1064,'Chłodzenie CPU','Zalman','CNPS14X Performa',1064,'Dostępny','Wysokość 160mm, LGA1155, LGA1150, LGA2011, LGA1366, LGA1156,  Prędkość obrotowa 900 - 1350RPM',11,150.00,1001),
(1065,'Chłodzenie CPU','BeQuiet','Dark Rock Advanced',1065,'Niedostępny','Wysokość 167mm, LGA1155, LGA1150, Socket 940, Socket 754, LGA2011  Prędkość obrotowa 1500RPM',0,212.00,1001),
(1066,'Chłodzenie CPU','Noctau','NH-U9B',1066,'Dostępny','Wysokość 152mm, LGA1366, LGA1156, LGA775, AM3, AM2+, AM2  Prędkość obrotowa 1500RPM',7,228.00,1001);
--------------------------------------------------------------------------------------------------------

select * from Towary;


