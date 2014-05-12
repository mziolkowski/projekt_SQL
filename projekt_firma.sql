CREATE DATABASE metro;

CREATE TABLE Pracownik (
id_pracownik INT IDENTITY (1,1),
imie VARCHAR (20),
nazwisko VARCHAR (50),
data_ur DATE,
miasto VARCHAR (30),
adres VARCHAR (40),
telefon VARCHAR (15),
data_zatr DATE,
data_zwol DATE,
e-mail VARCHAR (30),
premia DECIMAL (10,2),
pensja DECIMAL (10,2),
stanowisko VARCHAR

PRIMARY KEY (id_pracownik));

CREATE TABLE Stanowsiko (
id_stanowisko INT IDENTITY (1,1),
nazaw VARCHAR (20),

PRIMARY KEY (id_stanowisko));

CREATE TABLE Importer (
id_importer INT IDENTITY (1,1),
nazwa VARCHAR (30),
adres VARCHAR (40),
telefon VARCHAR (15),
poczatek_wspol DATE,
koniec_wspol DATE,
prezes_firmy VARCHAR (30),
kraj VARCHAR (20),
miasto (20),

PRIMARY KEY (id_importer));

CREATE TABLE Transport ( 
id_transport INT IDENTITY (1,1)
nazwa VARCHAR (30),
rodzaj VARCHAR (20),
adres VARCHAR (40),
telefon VARCHAR (15),
miejscowosc VARCHAR (30),

PRIMARY KEY (id_transport));

CREATE TABLE Towary (
id_towar INT IDENTITY (1,1),
nazwa VARCHAR (30),
id_kod INT,
status_towaru VARCHAR (20),
opis VARCHAR (250),
ilosc INT,
cena DECIMAL (10,2),
id_importer INT,

PRIMARY KEY (id_towar));

CREATE TABLE Zamowienia (
id_zamowienia INT IDENTITY (1,1),
data_zamowienia DATE,
id_platnosc INT,
faktora BIT,
status_zamowienia VARCHAR (20),
zaplacone BIT,
dostawa VARCHAR (20),
czas_dostawy VARCHAR (2),

PRIMARY KEY (id_zamowienia));

CREATE TABLE Platnosc (
id_platnosc INT IDENTITY (1,1),
gotowka BIT,
przelew BIT,
raty BIT,

PRIMARY KEY (id_platnosc));

CREATE TABLE kod_towaru (
id_kod INT IDENTITY (1,1),
magazyn VARCHAR (20),
hala VARCHAR (2),
poziom VARCHAR (2),
regal VARCHAR (2),
polka VARCHAR (2),

PRIMARY KEY (id_kod));

CREATE TABLE klient (
id_klient INT IDENTITY (1,1),
firma VARCHAR (20),
imie VARCHAR (20),
nazwisko VARCHAR (30),
adres VARCHAR (40),
miejscowosc VARCHAR (30),
telefon VARCHAR (15),
mail VARCHAR (30),
id_zamowienia INT,

PRIMARY KEY (id_klient));

-- ********************************************************************************************************************************************* --

INSERT INTO Pracownik VALUES 
('Michal','Romaniuk','1977-06-12','Warszawa','Szpakowa 8/9','321-534-523','2000-01-05',NULL,'mromaniuk@krosno.com',NULL,3500,'Księgowy'),
('Olga','Jakucyk','1980-01-12','Warszawa','Syreny 12','893-423-123','1999-12-12','2001-05-15','ojakucyk@krosno.com',200,2000,'Handlowiec'),
('Szymon','Brzoza','1969-03-16','Piaseczno','Kaktusowa 23','503-984-432','2007-05-11',NULL,'sbrzoza@krosno.com',250,1500,'Magazynier'),
('Joanna','Ząb','1988-11-02','Grójec','Boczna 5/10','505-452-888','2010-11-10',NULL,'jzab@krosno.com',NULL,2000,'Handlowiec'),
('Michal','Okoń','1986-05-12','Warszawa','Gradowa 99/13','442-312-421','2002-02-16','2006-03-15','mokon@krosno.com',NULL,1900,'Magazynier'),
('Janusz','Bąk','1979-01-19','Piaseczno','Klasztorna 122','892-423-528','1995-12-12','2011-06-25','jbak@krosno.com',500,3000,'Handlowiec'),
('Wiktoria','Tydla','1979-09-01','Warszawa','Akacjowa 76','884-192-093','2004-02-12','2013-08-14','wtydla@krosno.com',400,2500,'Księgowy'),
('Pawel','Kolder','1978-11-12','Warszawa','Jowisza 18','578-328-290','1998-08-22','NULL','pkolder@krosno.com',500,4000,'Informatyk'),
('Olaf','Kur','1980-01-12','Radzymin','Radiowa 92','783-423-583','2005-12-12','NULL','okur@krosno.com',NULL,2000,'Magazynier'),
('Wiesław','Idek','1966-02-08','Piaseczno','Maślana 23/12','883-312-212','2002-02-16',NULL,'widek@krosno.com',300,1900,'Magazynier');