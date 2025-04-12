-- Innledende spørringer AnsattPersonal2023

USE ansattpersonal2023;

-- Data i tabellen Ansatt
SELECT * 
FROM Ansatt;

-- Data i tabellen postkatalog:
SELECT * 
FROM
Postkatalog;

-- Kryssproduktet av Postkatalog og Ansatt (kartesisk produkt)
SELECT *
FROM Ansatt, Postkatalog;

SELECT *
FROM Postkatalog, Ansatt;

-- Likekobling, liste over ansatte med postadresser, med WHERE-betingelser
SELECT * 
FROM Ansatt, Postkatalog
WHERE Ansatt.Postnr=Postkatalog.Postnr;

-- INSERT-setningene
-- INSERT into Stillingstype
INSERT INTO Stillingstype VALUES('1000','Avdelingssjef');
INSERT INTO Stillingstype VALUES('2000','Konsulent');
INSERT INTO Stillingstype VALUES('3000','Økonomimedarbeider');
INSERT INTO Stillingstype VALUES('4000','Sekretær');
INSERT INTO Stillingstype VALUES('5000','Trainee');

-- INSERT INTO Avdeling
INSERT INTO Avdeling VALUES('1000','IT');
INSERT INTO AVdeling VALUES('2000','Administrasjon');
INSERT INTO Avdeling VALUES('3000','Økonomi');
INSERT INTO Avdeling VALUES('4000','Personal');
INSERT INTO Avdeling VALUES('5000','Vedlikehold');

-- INSERT INTO Kurs
INSERT INTO Kurs VALUES('1000','HMS');
INSERT INTO Kurs VALUES('2000','Brannvakt');
INSERT INTO Kurs VALUES('3000','Førstehjelp');
INSERT INTO Kurs VALUES('4000','Sistehjelp');

-- INSERT INTO Postkatalog
INSERT INTO Postkatalog VALUES('1000','Storby');
INSERT INTO Postkatalog VALUES('1500','Lilleby');
INSERT INTO Postkatalog VALUES('2000','Mellomby');
INSERT INTO Postkatalog VALUES('2500','Storbygd');
INSERT INTO Postkatalog VALUES('3000','Mellombygd');
INSERT INTO Postkatalog VALUES('3500','Lillebygd');

-- INSERT INTO Ansatt
INSERT INTO Ansatt VALUES('1000','Ole','Olsen','Oleveien 1','11111111','1000','1000','1000');
INSERT INTO Ansatt VALUES('2000','Hans','Hansen','Hansaveien 3','22222222','2000','2000','1500');
INSERT INTO Ansatt VALUES('3000','Jens','Jensen','Jenseveien 5','33333333','3000','3000','2000');
INSERT INTO Ansatt VALUES('4000','Trine','Trinesen','Tryneveien 7','44444444','4000','4000','2500');
INSERT INTO Ansatt VALUES('5000','Kari','Karisen','Kariveien 9','55555555','5000','5000','3000');

-- INSERT INTO Kursdeltagelse
INSERT INTO Kursdeltagelse VALUES('1000','50','DATE','Ikke bestått');
INSERT INTO Kursdeltagelse VALUES('2000','50','DATE','Ikke bestått');
INSERT INTO Kursdeltagelse VALUES('3000','60','DATE','Foreldet');
INSERT INTO Kursdeltagelse VALUES('4000','60','DATE','Bestått');
INSERT INTO Kursdeltagelse VALUES('5000','70','DATE','Bestått');
