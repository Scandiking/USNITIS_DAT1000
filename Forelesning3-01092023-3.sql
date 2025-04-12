-- Forelesning 1'
-- oppgave 1 kap 2
USE oppgave1kap2;

-- a) 
SELECT *
FROM Film
WHERE År=1988;

-- d)
SELECT Tittel
FROM Film
WHERE Sjanger='Action' OR Sjanger='Western';

-- e)
SELECT DISTINCT Land
FROM Film
ORDER BY Land;


-- Forelesning 2
-- Oppgave 1, 
USE oppgave1kap2;
-- g)
SELECT COUNT(*) AS IkkeTilSalgs
FROM Film
WHERE Pris IS NULL;

-- h) Antall filmer under 100 kr
SELECT COUNT(Pris) AS AntallFilmerUnder100kr
FROM Film
WHERE Pris<100;

-- i) Filmer med tittel som slutter på now
SELECT *
FROM Film
WHERE UPPER(Tittel) LIKE '%NOW';

-- Oppgave 2
-- a)
SELECT Nr,Beskrivelse
FROM Hytte
WHERE (Ukepris<4500)
	AND (AntallSenger>=4);
    
-- e)
SELECT COUNT(*) AS AntallHytter
FROM Hytte
WHERE AvstandAlpin<500;

-- oppgave 3
USE hobbyhusetkap2;
SELECT * 
FROM Vare;

-- gr og <blank> er riktig skrivemåte
-- starter med å plukke ut de som har g som forkortelse for gram
SELECT *
FROM Vare
-- WHERE Betegnelse LIKE '%g%';
WHERE Betegnelse LIKE '%, %g'; 

