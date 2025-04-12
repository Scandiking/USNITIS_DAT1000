-- Gullklubblista som en spørring
USE hobbyhuset;
-- spørre mot View'et
SELECT *
FROM Gullklubblista;

-- med de mestkjøpende/"VIP-ene" først...først
SELECT *
FROM Gullklubblista
ORDER BY AntallOrdrer DESC;

-- lekse fra forelesning 8
-- som en spørring
SELECT Ordre.KNr, Fornavn, Etternavn, Adresse, Kunde.Postnr, Poststed, COUNT(Ordre.KNr) AS AntallOrdrer
FROM Ordre, Kunde, Poststed
WHERE (Ordre.KNr=Kunde.KNr
	AND Kunde.Postnr=Poststed.Postnr)
GROUP BY Ordre.KNr, Fornavn, Etternavn, Adresse, Kunde.Postnr, Poststed
HAVING AntallOrdrer>=10
ORDER BY AntallOrdrer DESC

-- CREATE VIEW (Lekse: lag som view Gullklubblista 2 (linje 14-19)
CREATE VIEW
SELECT Ordre.KNr, Fornavn, Etternavn, Adresse, Kunde.Postnr, Poststed, COUNT(Ordre.KNr) AS AntallOrdrer
FROM Ordre, Kunde, Poststed
WHERE (Ordre.KNr=Kunde.KNr
	AND Kunde.Postnr=Poststed.Postnr)
GROUP BY Ordre.KNr, Fornavn, Etternavn, Adresse, Kunde.Postnr, Poststed
HAVING AntallOrdrer>=10
ORDER BY AntallOrdrer DESC

-- Lekse fra forelesning 8
-- egenkobling, også de ansatte uten leder
USE egenkobling;
SELECT *
FROM Ansatt

SELECT Ansatte.AnsNr, Ansatte.Fornavn, Ansatte.Etternavn, Lederen.Etternavn AS HarSomLeder
FROM Ansatt AS Ansatte, Ansatt AS Lederen
WHERE Ansatte.Leder = Lederen.AnsNr;

-- også de ansatte som ikke har leder
-- ansatte left outer join ledere
-- er det noe som ikke slutte rpå nullmerke så er det en ytre kobling
-- må ha () på navngiving/alias av kopiene i FROM-delen
SELECT Ansatte.AnsNr, Ansatte.Fornavn, Ansatte.Etternavn, Lederen.Etternavn AS HarSomLeder
FROM (Ansatt AS Ansatte) LEFT OUTER JOIN (Ansatt AS Lederen)
ON Ansatte.Leder=Lederen.AnsNr
-- ORDER BY HarSomLeder, Ansatte.Etternavn, Ansatte.Fornavn;

-- Vekselvirkende delspørringer
-- billigste vare i hver kategori, alt1
USE hobbyhuset;
SELECT Vare1.VNr, Vare1.Betegnelse, Vare1.KatNr, Vare1.Pris
FROM Vare AS Vare1
	WHERE Vare1.Pris=
    (SELECT MIN(Vare2.Pris)
    FROM Vare AS Vare2
		WHERE Vare1.KatNr=Vare2.KatNr);
        
-- Lekse fra forelesning 8
-- alt 2, view for BilligsteIKategori
CREATE VIEW BilligsteIKategori AS
(
SELECT KatNr,MIN(Pris) AS Billigste
FROM Vare
GROUP BY KatNr
);

SELECT *
FROM BilligsteIKategori;

SELECT VNr, Betegnelse, Pris, Vare.KatNr
FROM Vare, BilligsteIKategori
WHERE Vare.KatNr=BilligsteIKategori.KatNr
	AND Vare.Pris=BilligsteIKategori.Billigste;
    
-- Alternativ 3, BilligsteIKategori som navngitt spørring og spørring i FROM-delen
SELECT VNr, Betegnelse, Pris, Vare.KatNr
FROM Vare, (SELECT KatNr, MIN(Pris) AS Billigste
			FROM Vare
            GROUP BY KatNr) AS BiK
WHERE Vare.KatNr=BiK.KatNr
	AND Vare.Pris=BiK.Billigste;


