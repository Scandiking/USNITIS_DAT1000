-- skript for basisstruktur ansattpersonal2023
-- utvidet med skranker

DROP SCHEMA IF EXISTS ansattpersonal2023;
CREATE SCHEMA ansattpersonal2023;

USE ansattpersonal2023;

-- oppretter tabeller, runde (1)
CREATE TABLE Stillingstype
(
Stillingskode CHAR(4),
Stillingsbetegnelse CHAR(20) NOT NULL,
CONSTRAINT StillingstypePK PRIMARY KEY(Stillingskode)
);

CREATE TABLE Avdeling
(
Avdelingsnr CHAR(4),
Avdelingsnavn CHAR(20) NOT NULL,
CONSTRAINT AvdelingPK PRIMARY KEY(Avdelingsnr)
);

CREATE TABLE Kurs
(
Kursnr CHAR(4),
Kursnavn CHAR(20) NOT NULL,
CONSTRAINT KursPK PRIMARY KEY(Kursnr)
);

CREATE TABLE Postkatalog
(
Postnr CHAR(4),
Poststed CHAR(20) NOT NULL,
CONSTRAINT PostkatalogPK PRIMARY KEY(Postnr)
);

-- oppretter tabeller, runde (2)
CREATE TABLE Ansatt 
(
Ansattnr CHAR(4),
Fornavn CHAR(15) NOT NULL,
Etternavn CHAR(20) NOT NULL,
Gateadresse CHAR(25),
Telefonnr CHAR(8) NOT NULL,
Stillingskode CHAR(4),
Avdelingsnr CHAR(4),
Postnr CHAR(4),
CONSTRAINT AnsattPK PRIMARY KEY(Ansattnr),
CONSTRAINT AnsattStillingstypeFK FOREIGN KEY(Stillingskode) REFERENCES Stillingstype(Stillingskode),
CONSTRAINT AnsattAvdelingsnrFK FOREIGN KEY(Avdelingsnr) REFERENCES Avdeling(Avdelingsnr),
CONSTRAINT AnsattPostkatalogFK FOREIGN KEY(Postnr) REFERENCES Postkatalog(Postnr)
);

-- oppretter tabeller runde (3)
CREATE TABLE Kursdeltagelse
(
Ansattnr CHAR(4),
Kursnr CHAR(4),
Dato DATE,
Vurdering CHAR(20),
CONSTRAINT KursdeltagelsePK PRIMARY KEY (Ansattnr,Kursnr,Dato),
CONSTRAINT KursdeltagelseFK FOREIGN KEY(Ansattnr) REFERENCES Ansatt(Ansattnr),
CONSTRAINT KursdeltagelseKursFK FOREIGN KEY(Kursnr) REFERENCES Kurs(Kursnr),
CONSTRAINT Vurderingsregel CHECK (Vurdering IN ('Godkjent','Ikke godkjent','Foreldet'))
);

-- Notat pr. 220923: Fiks dette til neste time
-- Legg også inn data fra fil lagt ut 
-- https://usn.instructure.com/courses/29270/pages/forelesning-5

-- med et kolonneutvalg
SELECT Ansattnr, Fornavn, Etternavn, Gateadresse, Ansatt.Postnr, Poststed
FROM Ansatt, Postkatalog
WHERE Ansatt.Postnr=PostKatalog.Postnr;