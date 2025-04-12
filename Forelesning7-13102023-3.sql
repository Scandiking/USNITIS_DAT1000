-- Avsluttende spørringer ansattpersonale2023

USE ansattpersonal2023;

DROP TABLE kategori;

-- fra forelesning 6, 29.09.23
-- likekobling, tre tabeller
-- med WHERE-betingelse
SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Ansatt, Stillingstype, Avdeling
WHERE Ansatt.Stillingskode=Stillingstype.Stillingskode
	AND Ansatt.Avdelingsnr=Avdeling.Avdelingsnr;
    
-- ved INNER JOIN
-- bygge opp "steg for steg" 
-- først Ansatt mot Avdeling (innerste JOIN)
-- Stillingstype kobles mot mellomresultatet av innerste JOIN

SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Stillingstype INNER JOIN 
	(Ansatt INNER JOIN Avdeling
		ON Ansatt.Avdelingsnr=Avdeling.Avdelingsnr)
	ON Stillingstype.Stillingskode=Ansatt.Stillingskode;
    
-- og ved bruk av view
SELECT *
FROM Ansattliste
ORDER BY Etternavn;

-- Nytt forelesning 7ansatt
-- kryssprodukt ved bruk av INNER JOIN (uten ON)
SELECT *
FROM Ansatt INNER JOIN Postkatalog;

-- Kryssprodukt ved fjerning av nøkkelordet INNER (dvs JOIN er en INNER JOIN)
SELECT *
FROM Ansatt JOIN Postkatalog;

-- Likekobling
-- Liste over ansatte med postadresser, med INNER JOIN og fjerning av nøkkelordet INNER (dvs JOIN er en INNER JOIN)
SELECT Ansattnr, Fornavn, Etternavn, Gateadresse, Ansatt.Postnr, Poststed
FROM Ansatt JOIN Postkatalog
	ON Ansatt.Postnr=Postkatalog.Postnr;

-- og videre med kortvarianten USING
SELECT Ansattnr, Fornavn, Etternavn, Gateadresse, Ansatt.Postnr, Poststed
FROM Ansatt JOIN Postkatalog
	USING(Postnr);
    
-- og med tre tabeller får vi (JOIN og USING)
SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Stillingstype JOIN
	(Ansatt JOIN Avdeling
		USING(Avdelingsnr))
	USING(Stillingskode);
    
-- Ytre koblinger, LEFT OUTER JOIN eller RIGHT OUTER JOIN, nøkkelordet OUTER kan fjernes
SELECT *
FROM Stillingstype LEFT JOIN Ansatt
	ON Stillingstype.Stillingskode=Ansatt.Stillingskode;
    
-- Prøv selv: med RIGHT OUTER JOIN
SELECT *
FROM Stillingstype RIGHT JOIN Ansatt
	ON Stillingstype.Stillingskode=Ansatt.Stillingskode;
    
-- og ved bruk av USING på betingelksen/kobllingen får vi
SELECT *
FROM Stillingstype LEFT JOIN Ansatt
	USING(Stillingskode);

USE hobbyhuset;
-- Algoritmeforklaringer
SELECT Ordre.*, Fornavn, Etternavn, Poststed
FROM Ordre, Kunde, Poststed
WHERE Ordre.KNr=Kunde.Knr
	AND Kunde.Postnr=Poststed.Postnr;
    
-- 

SELECT Kunde.KNr,Etternavn,COUNT(*) AS AntallOrdre
FROM Kunde, Ordre
WHERE Kunde.KNr=Ordre.KNr
GROUP BY Kunde.KNr,Etternavn;

-- utvidet med gruppebetingelse, kun de kundene med 10 ordre eller flere
SELECT Kunde.KNr,Etternavn,COUNT(*) AS AntallOrdre
FROM Kunde, Ordre
WHERE Kunde.KNr=Ordre.KNr
GROUP BY Kunde.KNr,Etternavn
HAVING AntallOrdre>=10;

-- Introduksjon til delspørringer, delspørringer i betingelser
SELECT *
FROM Kunde;

-- hvem har "bestilt varer"? dvs minst en ordre.
SELECT *
FROM Kunde
WHERE KNr IN (SELECT KNr FROM Ordre);



-- Kunder som aldri har bestilt, ikke bestilt noe noen gang
SELECT *
FROM Kunde
WHERE KNr NOT IN (SELECT KNr FROM Ordre);

-- view'et GodeKunder
CREATE VIEW GodeKunder AS (
SELECT *
FROM Kunde
WHERE KNr IN
	(SELECT KNr FROM Ordre)
);

-- Spørre mot viewet i stedet
SELECT *
FROM GodeKunder;

-- Forberedelser forelesning 8
-- Gullklubben, spørring og senere view for å plukke ut kunder med 10 eller flere bestillinger)
-- Gullklubblista, "liste til sjefen" med informasjon om alle kunder i gullklubben