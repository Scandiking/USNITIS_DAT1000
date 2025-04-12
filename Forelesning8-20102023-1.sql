-- repetisjon ytre koblinger, fullstendig syntaks (uten kortform)
-- ansatte med stillingsbetegnelser, også stillingsbetegnelser som ikke er i bruk

USE ansattpersonal2023;
SELECT *
FROM Ansatt RIGHT OUTER JOIN Stillingstype
	ON Ansatt.Stillingskode=Stillingstype.Stillingskode;
    
-- ønsker også avdelinger som ingen er tilknyttet pt
SELECT *
FROM Avdeling LEFT OUTER JOIN Ansatt
	ON Avdeling.Avdelingsnr=Ansatt.Avdelingsnr;

-- kortnavn/alias
USE hobbyhuset;
SELECT K.KNr, Etternavn, COUNT(*) AS AntallOrdre
FROM Kunde AS K, Ordre AS O
WHERE K.KNr=O.KNr
GROUP BY K.Knr, Etternavn
HAVING AntallOrdre>=10;



-- grunnstruktur SELECT
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- 		HAVING
-- ORDER BY

-- Lekse fra forelesning 7
USE hobbyhuset;
-- Gullklubben og gullklubblista
SELECT KNr, COUNT(*) AS AntallOrdrer
FROM Ordre 
GROUP BY KNr
HAVING AntallOrdrer>=10;

-- som view
CREATE VIEW Gullklubben AS
(
SELECT KNr, COUNT(*) AS AntallOrdrer
FROM Ordre 
GROUP BY KNr
HAVING AntallOrdrer>=10
);

-- spørre mot viewet
SELECT *
FROM Gullklubben;

-- med det mest kjøpende/"VIP"-ene først... alter table
SELECT * 
FROM Gullklubblista
ORDER BY AntallOrdrer DESC

-- Gullklubblista
SELECT Gullklubben.KNr, Fornavn, Etternavn, Adresse, Kunde.Postnr, Poststed, AntallOrdrer
FROM Gullklubben, Kunde, Poststed
WHERE Gullklubben.KNr=Kunde.KNr
	AND Kunde.Postnr=Poststed.Postnr;
    
-- som view
CREATE VIEW Gullklubblista AS
(
SELECT Gullklubben.KNr, Fornavn, Etternavn, Adresse, Kunde.Postnr, Poststed, AntallOrdrer
FROM Gullklubben, Kunde, Poststed
WHERE Gullklubben.KNr=Kunde.KNr
	AND Kunde.Postnr=Poststed.Postnr
);

-- spørre mot viewet
SELECT *
FROM Gullklubblista;

-- Oppgave:
-- Gullklubblista som en spørring uten bruk av View
-- tips: pass på gruppekriteriet



-- Egenkobling 
-- Du kan lage databasen på følgende måte
-- 1) Kopier tabelldefinisjonen Ansatt fra  Hobbyhuset
-- og legg til kolonnen Leder, smallint(6)
-- fjern definisjonen av fremmednøkkelen på postnr
-- legg til fremmednøkkel leder som refererer til til Ansatt(Ansattnr)
-- men da må du gjøre om på inndatarekkefølgen slik at sjefene er registrert før de de leder
-- 2) Kopier inndatasetningene fra Hobbyhuset
-- Legg inn leder for hver ansatt tilsvarende figur 4.6 s. 104 ("endre hver inndatasetning")

USE egenkobling;
SELECT AnsNr, Fornavn, Etternavn, Leder
FROM Ansatt;

-- for å finne navnet på lederen til alle ansatte kan vi koble tabellen ansatt med seg selv
-- Da MÅ vi bruke kortnavn/alias på tabellene 
-- alle ansatte med navn på leder
SELECT Ansatt.AnsNr, Ansatt, Ansatte.Etternavn, Ansatte.Fornavn, Lederen.Etternavn AS HarSomLeder
FROM Ansatt AS Ansatte, Ansatt AS Lederen
WHERE Ansatte.Leder=Lederen.AnsNr
ORDER BY HarSomLeder, Ansatte.Etternavn, Ansatte.Fornavn;

-- oppgave:
-- lag SQL-setningen slik at du også får med de ansatte som ikke har leder


-- view for produksjon av salgsrapporter
USE hobbyhuset;
CREATE VIEW Salg AS 
(
SELECT OL.*, V.Betegnelse, K.Navn AS Kategori, O.OrdreDato, O.KNr
FROM Ordrelinje AS OL, Vare AS V, Kunde AS K, Ordre AS O
WHERE OL.OrdreNr=O.OrdreNr
	AND OL.VNr=V.VNr
    AND V.KatNr=K.KatNr
);

SELECT *
FROM Salg

-- oppgave
-- lag ulike salgsrapporter selv

-- Kunder uten bestillinger ved brruk av NOT EXISTS
SELECT *
FROM Kunde
WHERE NOT EXISTS 
	(SELECT KNr FROM Ordre
		WHERE Kunde.KNr=Ordre.KNr);
        
-- Kunder med bestillinger ved bruk av EXISTS
SELECT *
FROM Kunde
WHERE EXISTS
	(SELECT KNr FROM Ordre
    WHERE Kunde.KNr=Ordre.KNr);
    
-- varer billigere enn gjennomsnittet
SELECT VNr, Betegnelse, Pris
FROM Vare
WHERE Pris<(SELECT AVG(Pris) FROM Vare);

-- vekselvirkende delspørringer
-- billigste vare i hver kategori, alt 1
SELECT Vare1.VNr, Vare1.Betegnelse, Vare1.KatNr, Vare1.Pris
FROM Vare AS Vare1
WHERE Vare1.Pris=
	(SELECT MIN(Vare2.Pris)
    FROM Vare AS Vare2
		WHERE Vare1.KatNr=Vare2.KatNr);
        
-- kontroll: finn antall kategorier
-- pseudo:
-- select distinct kat

-- oppgave:
-- 1) Løsning ved bruk av view (alternativ 2)
-- View for BilligsteIKategori

-- 2) Billigste i kategori som navngitt spørring og spørring i FROM-delen (alternativ 3)



