USE hobbyhusetkap2;

SELECT *
FROM Vare;

-- Operatorpresedens, AND/OR
-- Varer som koster under 100 kr i kategoriene bøker og keramikk
-- feil løsning

SELECT *
FROM Vare
WHERE (Pris<100)
	AND (Kategori='Bøker') OR (Kategori='Keramikk');
    
-- Spørringen tolkes som, operatorpresedens/operatorprioritet
SELECT *
FROM Vare
WHERE ((Pris<100) AND (Kategori='Bøker')
	OR (Kategori='Keramikk'));
    
-- mens den riktige spørringen er 
SELECT *
FROM Vare
WHERE (Pris<100)
	AND ((Kategori='Bøker') OR (Kategori='Keramikk'));
    
-- avledet informasjon/'ny kolonne' med navngiving og avrunding, beskrivende navn
SELECT VNr,Betegnelse,Pris,ROUND(Pris*1.25,2) AS PrisInklMva
FROM Vare;

-- fortolkning
-- bokstaven i hylle viser hylleseksjon, bruker LEFT
-- til å trekke ut et gitt antall tegn fra venstre
-- og fjerner ev varer som ikke er hylleplasserte
SELECT VNr,Betegnelse,LEFT(Hylle,1) AS Hylleseksjon
FROM Vare
WHERE Hylle IS NOT NULL;

-- intervallsøk, flere ulikheter med AND(/OR) eller bruk av BETWEEN
SELECT *
FROM Vare
WHERE (Pris>=57) AND (Pris<=75.50);

SELECT * 
From Vare
WHERE Pris BETWEEN 57 AND 75.50;

-- Mønstersammenlikning/Jokernotasjon
-- Varer som begynner på M

SELECT *
From Vare
WHERE UPPER(Betegnelse) LIKE 'M%';

-- varer som begynner på M
-- uten mønstersammenligning/dvs test på likhet
SELECT *
FROM Vare
WHERE UCASE(LEFT(Betegnelse,1))='M';

-- varer som inneholder 'marsipan' i navnet
SELECT *
FROM Vare
WHERE UPPER(Betegnelse) LIKE '%MARSIPAN%';

-- Sorterting
-- ASC/stigende, DESC/synkende
SELECT *
FROM Vare
ORDER BY Kategori ASC, PRIS DESC;

-- mengdefunksjoner
-- gjennomsnitt
SELECT ROUND(AVG(Pris),2) AS GjennomsnittPrisFiske
FROM Vare 
WHERE UCASE(Kategori)='FISKE';

-- gjennomsnittspris pr kategori
-- utvidet med høyeste og laveste pris i hver kategori
SELECT Kategori, ROUND(AVG(Pris),2) AS GjennomsnittsPrisKategori,
	MIN(Pris) AS Billigste, 
    MAX(Pris) AS Dyreste
FROM Vare 
GROUP BY Kategori; 

-- Opptelling, antall varer i kategoriene 'Blomsterfrø' og 'Blomsterløker'
SELECT COUNT(*) AS AntallBlomsterVarer
FROM Vare
WHERE Kategori='Blomsterfrø' OR Kategori='Blomsterløker';

SELECT COUNT(*) AS AntallBlomsterVarer
FROM Vare
WHERE UPPER(Kategori) LIKE 'BLOMSTER%';

-- Gruppebetingelser
SELECT kategori, COUNT(*) AS AntallVarer
FROM Vare
GROUP BY Kategori
HAVING AntallVarer>1;

SELECT Kategori, COUNT(*) AS AntallVarer
FROM Vare
GROUP BY Kategori
HAVING COUNT(*)>1;