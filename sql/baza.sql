-- Create tables section

-- Table dbo.Instruktorzy
CREATE TABLE Instruktorzy (
	idInstruktora INT IDENTITY(1, 1) PRIMARY KEY,
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	PESEL CHAR(11) NOT NULL UNIQUE,
	numerTelefonu CHAR(9) NOT NULL UNIQUE,
	dataUrodzenia DATE,

	CONSTRAINT chkPeselInstruktora CHECK(PESEL Like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chkNumerTelefonuInstruktora CHECK(numerTelefonu LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chkDataUrodzeniaInstruktora CHECK(dataUrodzenia < GETDATE())
);

-- Table dbo.Adresy
CREATE TABLE Adresy (
	idAdresu INT IDENTITY(1, 1) PRIMARY KEY,
	miejscowosc VARCHAR(50) NOT NULL,
	ulica VARCHAR(50) NOT NULL,
	kodPocztowy CHAR(6) NOT NULL,
	numerDomu SMALLINT,
	numerLokalu SMALLINT,

	CONSTRAINT chkNumerZamieszkaniaAdresu CHECK((numerDomu > 0 OR numerDomu IS NULL) AND (numerLokalu > 0 OR numerLokalu IS NULL)),
	CONSTRAINT chkKodPocztowyAdresu CHECK(kodPocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]')
);

-- Table dbo.Kursanci
CREATE TABLE Kursanci (
	idKursanta INT IDENTITY(1, 1) PRIMARY KEY,
	imie VARCHAR(30) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	dataUrodzenia DATE NOT NULL,
	numerTelefonu CHAR(9) NOT NULL UNIQUE,
	numerDowoduOsobistego CHAR(9) NOT NULL UNIQUE,
	idAdresu INT NOT NULL,
	
	CONSTRAINT chkNumerTelefonuKursanta CHECK(numerTelefonu LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chkNumerDowoduOsobistegoKursanta CHECK(numerDowoduOsobistego LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chDataUrodzeniaKursanta CHECK(dataUrodzenia < GETDATE())
);

-- Table dbo.Egzaminy
CREATE TABLE Egzaminy (
	idEgzaminu INT IDENTITY(1, 1) PRIMARY KEY,
	dataEgzaminu DATETIME NOT NULL,
	rodzaj CHAR(1) NOT NULL,
	kategoria VARCHAR(4) NOT NULL,
	zaliczony CHAR(1), 
	idKursanta INT NOT NULL,

	CONSTRAINT chkDataEgzaminu CHECK(dataEgzaminu > GETDATE()),
	CONSTRAINT chkRodzajEgzaminu CHECK(rodzaj IN ('T', 'P')),
	CONSTRAINT chkZaliczenieEgzaminu CHECK(zaliczony IS NULL OR zaliczony IN ('T', 'F')),
	CONSTRAINT chkKategoriaEgzaminu CHECK(kategoria IN('AM', 'A1', 'A2', 'A', 'B1', 'B', 'B+E', 'C', 'C1', 'C1+E', 'D', 'D1', 'D1+E', 'D+E', 'T'))
);

-- Table dbo.Kursy
CREATE TABLE Kursy (
	idKursu INT IDENTITY(1, 1) PRIMARY KEY,
	kategoria VARCHAR(4) UNIQUE NOT NULL,
	liczbaGodzin TINYINT NOT NULL,
	minimalnaIloscLat TINYINT NOT NULL,
	minimalnaIloscMiesiecy TINYINT NOT NULL,

	CONSTRAINT chkKategoriaKursu CHECK(kategoria IN('AM', 'A1', 'A2', 'A', 'B1', 'B', 'B+E', 'C', 'C1', 'C1+E', 'D', 'D1', 'D1+E', 'D+E', 'T')),
	CONSTRAINT chkMinimalnaIloscLatKursu CHECK(minimalnaIloscLat > 0),
	CONSTRAINT chkLiczbaGodzinKursu CHECK(liczbaGodzin > 0)
);

-- Table dbo.Pojazdy
CREATE TABLE Pojazdy (
	idPojazdu INT IDENTITY(1, 1) PRIMARY KEY,
	rodzaj VARCHAR(30) NOT NULL,
	numerRejestracyjny CHAR(7) UNIQUE NOT NULL,
	dataPrzegladu DATE NOT NULL,
	marka VARCHAR(20),
	model VARCHAR(20),
	rocznik SMALLINT,
	
	CONSTRAINT chkRodzajPojazdu CHECK(rodzaj IN ('samochód osobowy', 'autobus', 'motocykl', 'samochód ciężarowy')),
	CONSTRAINT chkNumerRejestracyjnyPojazdu CHECK(numerRejestracyjny LIKE '[A-Z][A-Z][A-Z][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]'),
	CONSTRAINT chkDataPrzegladuPojazdu CHECK(dataPrzegladu > GETDATE()),
	CONSTRAINT chkRocznikPojazdu CHECK(rocznik IS NULL OR rocznik > 0)
);

-- Table dbo.Jazdy
CREATE TABLE Jazdy (
	idJazdy INT IDENTITY(1, 1) PRIMARY KEY,
	dataJazdy DATE NOT NULL,
	godzinaRozpoczecia TIME NOT NULL,
	opis VARCHAR(100) NOT NULL,
	liczbaGodzin TINYINT NOT NULL,
	idInstruktora INT NOT NULL,
	idPojazdu INT NOT NULL,
	idKursanta1 INT NOT NULL,
	idKursanta2 INT,
	idKursanta3 INT,

	CONSTRAINT unqJazdaInstruktora UNIQUE(dataJazdy, idInstruktora),
	CONSTRAINT unqJazdaPojazdu UNIQUE(dataJazdy, idPojazdu),
	CONSTRAINT chkDataJazdy CHECK(dataJazdy >= GETDATE()),
	CONSTRAINT chkLiczbaGodzinJazdy CHECK(liczbaGodzin > 0 OR liczbaGodzin IS NULL),
	CONSTRAINT chkIdKursantaJazdy CHECK (idKursanta1 != idKursanta2 AND idKursanta1 != idKursanta3 AND (idKursanta2 != idKursanta3 OR idKursanta2 IS NULL OR idKursanta3 IS NULL))
);

-- Table dbo.Szkolenia
CREATE TABLE Szkolenia (
	idKursanta INT NOT NULL,
	idKursu INT NOT NULL,
	dataRozpoczecia DATE NOT NULL DEFAULT CONVERT(date, GETDATE()),
	dataZakonczenia DATE,
	
	CONSTRAINT PK_Szkolenia PRIMARY KEY (idKursanta, idKursu),
	CONSTRAINT chkDataRozpoczeciaSzkolenia CHECK(dataRozpoczecia >= CONVERT(date, GETDATE())),
	CONSTRAINT chkDataZakonczeniaSzkolenia CHECK(dataZakonczenia >= dataRozpoczecia)
);

-- Table dbo.Licencje
CREATE TABLE Licencje (
	idLicencji INT IDENTITY(1,1) PRIMARY KEY,
	dataWydania DATE NOT NULL,
	dataWaznosci DATE NOT NULL, 
	kategoria VARCHAR(4) NOT NULL,
	idInstruktora INT NOT NULL,

	CONSTRAINT chkDatyLicencji CHECK (dataWydania <= GETDATE() AND dataWydania < dataWaznosci AND dataWaznosci > GETDATE()),
	CONSTRAINT chkKategoriaLicencji CHECK(kategoria IN('AM', 'A1', 'A2', 'A', 'B1', 'B', 'B+E', 'C', 'C1', 'C1+E', 'D', 'D1', 'D1+E', 'D+E', 'T')),
	CONSTRAINT unqLicencjaInstruktora UNIQUE(kategoria, idInstruktora)
);

-- Create foreign keys (relationships) section

ALTER TABLE Egzaminy ADD CONSTRAINT Zdaje FOREIGN KEY (idKursanta) REFERENCES 
Kursanci(idKursanta) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Kursanci ADD CONSTRAINT Zawiera FOREIGN KEY (idAdresu) REFERENCES
Adresy(idAdresu) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Licencje ADD CONSTRAINT Posiada FOREIGN KEY (idInstruktora) REFERENCES
Instruktorzy(idInstruktora) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Szkolenia ADD CONSTRAINT Realizuje FOREIGN KEY (idKursanta) REFERENCES
Kursanci(idKursanta) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Szkolenia ADD CONSTRAINT Uczestniczy FOREIGN KEY (idKursu) REFERENCES
Kursy(idKursu) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Jazdy ADD CONSTRAINT Doszkala1 FOREIGN KEY (idKursanta1) REFERENCES
Kursanci(idKursanta) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Jazdy ADD CONSTRAINT Doszkala2 FOREIGN KEY (idKursanta2) REFERENCES
Kursanci(idKursanta) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Jazdy ADD CONSTRAINT Doszkala3 FOREIGN KEY (idKursanta3) REFERENCES
Kursanci(idKursanta) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Jazdy ADD CONSTRAINT Naucza FOREIGN KEY (idInstruktora) REFERENCES
Instruktorzy(idInstruktora) ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Jazdy ADD CONSTRAINT Uzywa FOREIGN KEY (idPojazdu) REFERENCES
Pojazdy(idPojazdu) ON UPDATE NO ACTION ON DELETE NO ACTION
