DROP SCHEMA IF EXISTS testdatabase;
CREATE SCHEMA testdatabase;

USE testdatabase;

-- test av ulike datatyper
-- oppretter tabellen Datatyper
CREATE TABLE Datatyper
(
Postnr1 INTEGER,
Postnr2 CHAR(4),
Dato1 DATE,
Dato2 DATE
); 

INSERT INTO Datatyper VALUES(0304,'0304','2023-10-13',20231013);

SELECT *
FROM Datatyper;


-- endring av tabellstruktur
CREATE TABLE Telefonliste
(
Mobilnr CHAR(8) PRIMARY KEY,
Fornavn CHAR(15)
);

INSERT INTO Telefonliste VALUES('93031376','Ståle');

SELECT *
FROM Telefonliste

-- Legge til en ny kolonne e-postadresse
ALTER TABLE Telefonliste ADD COLUMN epost CHAR(30);

SELECT *
FROM Telefonliste;

-- Oppdatere registrert person med e-postadresse
UPDATE Telefonliste
SET epost='stale.vikhagen@usn.no'
WHERE Mobilnr='93031376';

UPDATE Telefonliste
SET fornavn='Ståle'
WHERE Mobilnr='93031376';

-- Oppretter ny tabell postkatalog
CREATE TABLE Postkatalog
(
Postnr CHAR(4) PRIMARY KEY,
Poststed CHAR(20) NOT NULL
);

-- Legge til kolonne Postnr, som fremmednøkkel mot Postkatalog, i Telefonliste
ALTER TABLE Telefonliste ADD COLUMN Postnr CHAR(4);
ALTER TABLE Telefonliste ADD CONSTRAINT TelefonlistePostkatalogFK FOREIGN KEY (Postnr) REFERENCES Postkatalog(Postnr);

-- Legge til data i Postkatalog
INSERT INTO Postkatalog VALUES('3470','Slemmestad');
INSERT INTO Postkatalog VALUES('6400','Molde');

-- Legger til postnr for registrert person
UPDATE Telefonliste
SET Postnr='3470'
WHERE Mobilnr='93031376';

SELECT *
FROM Telefonliste

-- Prøv selv
-- Legge til 99999999, Jens, på postnr 6400, ok eller ikke? Ikke ok.
-- Legge til 44444444, Kari på postnr 7800, ok eller ikke? Ikke ok. Det er jun fylt ut tre av fire felt, og datatyper stemmer ikke overens.
-- For begge situasjonene:
-- Hva blir SQL-setningen?

INSERT INTO Telefonliste VALUES('99999999','Jens',6400);
INSERT INTO Telefonliste VALUES('44444444','Kari',7800);

