USE gruppering2023;
SELECT *
FROM Ansatt;

-- En SELECT med en gruppering som er FEIL
SELECT Stillingskode,Lønnstrinn
FROM Ansatt
GROUP BY Stillingskode;

-- Riktig SELECT for setningen over er 
SELECT Stillingskode,Lønnstrinn
FROM Ansatt
GROUP BY Stillingskode,Lønnstrinn;

-- Dersom vi vil finne antall ansatte i de ulike gruppene utvider vi setningen med en count
SELECT Stillingskode,Lønnstrinn,COUNT(*) AS AntallAnsatte
FROM Ansatt
GROUP BY Stillingskode,Lønnstrinn;

-- Sammenlignet med å ha opptelling i SQL-setningen som er feil!!!!
SELECT Stillingskode,Lønnstrinn,COUNT(*) AS AntallAnsatte
FROM Ansatt
GROUP BY Stillingskode;


-- Oppsummering (det Ståle er strengest på i sensur og det vi får mest av i SQL)
-- Gruppekriteriet: i SELECT-delen og GROUP BY 
-- Gruppebetingelser: HAVING (ikke WHERE)
-- COUNT(*) vs COUNT(kolonnenavn)
-- Ikke tillatt å bruke mengdefunksjoner i WHERE-betingelsen. 



