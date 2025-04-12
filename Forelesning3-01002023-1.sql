DROP SCHEMA IF EXISTS gruppering2023;
CREATE SCHEMA gruppering2023;

USE gruppering2023;

CREATE TABLE Ansatt
(
Ansattnr CHAR(4),
Fornavn CHAR(15) NOT NULL,
Stillingskode CHAR(4),
Lønnstrinn CHAR(2),
Avdelingsnr CHAR(4),
CONSTRAINT AnsattPK PRIMARY KEY (Ansattnr)
);

INSERT INTO Ansatt VALUES ('01','Brit','1008','66','3');
INSERT INTO Ansatt VALUES ('02','Karen','1009','66','1');
INSERT INTO Ansatt VALUES ('03','Sirin','1009','66','1');
INSERT INTO Ansatt VALUES ('04','Arnljot','1007','68','1');
INSERT INTO Ansatt VALUES ('05','Lillian','1009','67','1');
INSERT INTO Ansatt VALUES ('09','Kitty','1007','67','3');
INSERT INTO Ansatt VALUES ('06','Gudleik','1005','68','1');
INSERT INTO Ansatt VALUES ('07','Bjørnhild','1002','67','2');
INSERT INTO Ansatt VALUES ('11','Kolbein','1005','68','3');
INSERT INTO Ansatt VALUES ('10','Ramapatrikuna','1004','68','1');
INSERT INTO Ansatt VALUES ('08','Elif','1003','67','4');
INSERT INTO Ansatt VALUES ('12','Åsleif','1008','67','3');
INSERT INTO Ansatt VALUES ('13','Odd-Even','1008','66','1');
INSERT INTO Ansatt VALUES ('14','Odd-Magne','1009','66','1');
INSERT INTO Ansatt VALUES ('15','Karianne','1009','66','1');
INSERT INTO Ansatt VALUES ('16','Marianne','1009','66','1');
INSERT INTO Ansatt VALUES ('17','Anette','1009','68','1');
INSERT INTO Ansatt VALUES ('18','Lisbeth','1009','67','2');
INSERT INTO Ansatt VALUES ('19','Svanhild','1009','68','2');
INSERT INTO Ansatt VALUES ('20','Magnhild','1009','68','2');

-- Gruppere på stillingskode
SELECT Stillingskode
FROM Ansatt
GROUP BY Stillingskode
ORDER BY Stillingskode ASC; 

-- Gruppere og telle opp på stillingskode
SELECT Stillingskode, COUNT(*) AS Antall_på_stillingskode
FROM Ansatt
GROUP BY Stillingskode
ORDER BY Stillingskode;

-- Gruppere og telle opp på stillingskode og lønnstrinn
SELECT Stillingskode, COUNT(*) AS Antall_i_samme_stilling
FROM Ansatt
GROUP BY Stillingskode
ORDER BY Stillingskode;

-- Gruppere og telle opp på stillingskode og lønnstrinn, med assistanse
SELECT Stillingskode, Lønnstrinn, COUNT(*) AS Antall
FROM Ansatt
GROUP BY Stillingskode, Lønnstrinn
ORDER BY Stillingskode, Lønnstrinn;

-- Gruppere og telle opp på stillingskode og lønnstrinn, med bakgrunn i forrige assistanse
SELECT Stillingskode, Lønnstrinn, Avdelingsnr, COUNT(*) AS Antall_med_samme_stillingskode_lønnstrinn_og_avdelingsnr
FROM Ansatt
GROUP BY Stillingskode, Lønnstrinn, Avdelingsnr
ORDER BY Stillingskode, Lønnstrinn, Avdelingsnr;



-- Resten fyller du ut
-- flere ansatte på samme/forskjellige lønnstrinn på samme/forskjellige stillingskoder
-- på samme/forskjellige avdelinger