USE ansattpersonal2023;

-- Likekobling, liste over asnatte med postadresser, med WHERE-betingelse, jfr 22092023
SELECT *
FROM Ansatt,Postkatalog
WHERE Ansatt.Postnr=Postkatalog.Postnr;

-- Likekobling, liste over ansatte med postadresser, med INNER JOIN, --> jfr s 100
SELECT Ansattnr, Fornavn, Etternavn, Gateadresse, Ansatt.Postnr, Poststed
FROM Ansatt INNER JOIN Postkatalog
	ON Ansatt.Postnr=Postkatalog.Postnr;
    
-- Likekobling 3 tabeller, liste over ansatte med stilling og avdeling, med WHERE-betingelse
SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Ansatt, Stillingstype, Avdeling
WHERE Ansatt.Stillingskode=Stillingstype.Stillingskode
	AND Ansatt.Avdelingsnr=Avdeling.Avdelingsnr;
    
-- Ved bruk av INNER JOIN
SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Stillingstype INNER JOIN
	(Ansatt INNER JOIN Avdeling
		ON Ansatt.Avdelingsnr=Avdeling.Avdelingsnr)
	ON Stillingstype.Stillingskode=Ansatt.Stillingskode;

-- Alternativ ved INNER JOIN
SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Avdeling INNER JOIN 
	(Ansatt INNER JOIN Stillingstype
		ON Ansatt.Stillingskode=Stillingstype.Stillingskode)
	ON Avdeling.Avdelingsnr=Ansatt.Avdelingsnr;
    
-- View/utsnitt
DROP VIEW IF EXISTS Ansattliste;

CREATE VIEW Ansattliste (Etternavn, Fornavn, Stillingstype, Avdeling) AS 
(SELECT Etternavn, Fornavn, Stillingsbetegnelse, Avdelingsnavn
FROM Ansatt, Stillingstype, Avdeling
WHERE Ansatt.Stillingskode=Stillingstype.Stillingskode
	AND Ansatt.Avdelingsnr=Avdeling.Avdelingsnr);

-- Kan så kjøre spørringer mot view-et
SELECT *
FROM Ansattliste;


