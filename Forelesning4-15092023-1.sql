-- Introduksjon SQL, opprette database, opprette tabell, legge inn data

-- Sletter databsen hvis den finnes
DROP SCHEMA IF EXISTS heltnydatabase;
-- Opprette databasen
CREATE SCHEMA IF NOT EXISTS heltnydatabase;

USE heltnydatabase;

-- Oppretter tabellen Vare
-- variant av create-setning, s. 66,
-- forbyr NULL-merker i enkelte kolonner
CREATE TABLE Vare
(
VNr CHAR(5) PRIMARY KEY,
Betegnelse VARCHAR(30) NOT NULL,
Pris DECIMAL(8,2) NOT NULL,
KatNr SMALLINT NOT NULL,
Antall INTEGER NOT NULL,
Hylle CHAR(3)
);

-- legge inn data i tabellen vare, vare nr 1
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('90692','Marsipantang',57.00,4,0,'B17');

-- her legger dere inn vare nr 2 i tabellen
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('44939','Hobbymaling, 6farger',115.00,2,2,'B02');
-- vare nr 3
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('10830','Nisseskjegg, 30cm',57.50,13,42,NULL);

-- her legger dere inn vare nr 4 tom varenr 8 etter samme struktur
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('33044','Blandet blomsterfrø',14.50,15,1080,'E05');
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('15217','Kram tørrfluekorker, 5 stk',32.00,7,213,'B42');
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('90164','Lakrisekstrakt, 100g',75.50,4,104,'B06');
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('15207','Antron garn, hvit',24.50,7,21,'B41');
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('13001','Glasskuler, 100gr',38,00,13,0,'E11');
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('21032','Furuspon, 3 cm',57.50,17,240,'B32');
INSERT INTO Vare(Vnr,Betegnelse,Pris,KatNr,Antall,Hylle) VALUES('33045','Blomkarse',17.50,15,1206,'E05');

-- vare nr 9
-- trenger ikke feltnavnlista hvis data i alle felt/kolonner
INSERT INTO Vare VALUES('21032','Furuspon 3 cm',57.50,17,240,'B32');

-- her legger dere inn vare nr 10 tom 15, kortform

SELECT *
FROM Vare;