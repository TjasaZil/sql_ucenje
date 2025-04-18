-- Izdelajte tabelo vozilo, ki naj ima naslednje atribute:
-- znamka, tip, število prevoženih kilometrov, povprečna poraba, cena, datum prve registracije, status, ki je lahko: novo, rabljeno, poškodovano.
-- Razmislite o najbolj primernih podatkovnih tipih atributov in jih uporabite.
-- V tabelo vozilo dodajte najmanj 5 vozil in sestavite vsaj 10 smiselnih SQL poizvedb.

CREATE TABLE IF NOT EXISTS vozilo(
znamka VARCHAR(20),
tip VARCHAR(20),
prevozeni_kilometri INT,
povprecna_poraba FLOAT,
cena INT,
datum_prve_registracije DATE,
avto_status ENUM('novo', 'rabljeno', 'poškodovano'),
-- teli so dodatni
gorivo ENUM('bencin', 'diesel', 'hibrid', 'elektrika', 'plin'),
menjalnik ENUM('ročni', 'avtomatski'),
vin CHAR(17) PRIMARY KEY NOT NULL UNIQUE
);

INSERT INTO vozilo(znamka,tip,prevozeni_kilometri,povprecna_poraba,cena,datum_prve_registracije,avto_status,gorivo,menjalnik,vin) VALUES
('Mercedes','C200',50000,7.5,25000,'2019-05-20','rabljeno','bencin','avtomatski','WDBLTHHX9KN910724'),
('Mercedes','E300',80000,5.8,30000,'2018-07-12','rabljeno','diesel','avtomatski','WDBPWJLB6YT467268'),
('Volkswagen','Passat',120000,6.2,15000,'2017-03-05','rabljeno','diesel','ročni','3VW9DC9P0JY812254'),
('Land Rover','Discovery Sport',60000,9.8,35000,'2020-02-25','rabljeno','bencin','avtomatski','SAL51R245SF247112'),
('Honda','Civic',40000,6.0,18000,'2019-08-30','rabljeno','bencin','ročni','JHMGA2SL8HT026661'),
('Volkswagen','Golf',30000,5.5,22000,'2022-06-15','rabljeno','bencin','ročni','3VW9D8YK6NC662740'),
('Renault','Clio',70000,5.9,13000,'2016-11-10','rabljeno','bencin','ročni','VF1C5VTG5GY048320'),
('Honda','Accord',25000,4.2,27000,'2021-09-01','rabljeno','hibrid','avtomatski','1HG21D6M6NS525536'),
('Honda','Jazz',50000,5.2,16000,'2018-04-18','rabljeno','bencin','ročni','JHMAD5276JX358596'),
('Mercedes','EQC',0,22.5,60000,'2025-02-20','novo','elektrika','avtomatski','WDBWVGYF2HM519356'),
('BMW','320i',114128,7.0,23824,'2018-10-01','rabljeno','bencin','ročni','KNMGU1BZ7JX492118'),
('Audi','A4',115153,8.6,31395,'2018-04-01','rabljeno','bencin','ročni','WF0ZFG1H3JT222015'),
('Toyota','Corolla',78530,4.8,33945,'2019-04-01','rabljeno','hibrid','avtomatski','1HGW5P1M8KK474745'),
('Ford','Focus',90173,9.4,20539,'2019-11-01','rabljeno','bencin','ročni','VF12CFCT2KB543056'),
('Peugeot','308',0,6.9,20251,'2025-11-01','novo','bencin','ročni','1C43HWNZ8SR254909'),
('Skoda','Octavia',0,8.2,28179,'2025-06-01','novo','bencin','ročni','NLV1ZLAU0SZ766083'),
('Nissan','Qashqai',88503,3.8,30491,'2022-12-01','rabljeno','hibrid','avtomatski','2G1ZMX7T2NC902811'),
('Opel','Astra',79473,6.0,28307,'2022-07-01','rabljeno','diesel','avtomatski','WDBC3SNS0NE179496'),
('Mazda','3',20920,5.1,29579,'2023-08-01','rabljeno','diesel','ročni','WAUZ77NF7PD875018'),
('Fiat','500',29291,4.9,12014,'2017-11-01','rabljeno','diesel','ročni','TMBZBGEH0HG477281'),
('Kia','Sportage',109871,9.9,27135,'2021-09-01','rabljeno','bencin','avtomatski','3VWXU4383MU168324'),
('Hyundai','i30',38764,4.4,23556,'2022-07-01','rabljeno','hibrid','ročni','WF0GTRKHXNG317177'),
('Tesla','Model 3',134013,21.4,26316,'2017-05-01','rabljeno','elektrika','avtomatski','1HGB25C59HY533874'),
('Volkswagen','Polo',97255,9.4,15300,'2019-01-01','rabljeno','plin','avtomatski','1C4EUV384KU712709'),
('Renault','Megane',118234,3.6,19508,'2019-10-01','rabljeno','hibrid','avtomatski','YS3M10RZ4KB848494'),
('Volvo','XC60',93460,9.2,10702,'2017-04-01','rabljeno','bencin','ročni','WDBHSVUNXHP294752'),
('Seat','Leon',0,8.5,21543,'2025-08-01','novo','bencin','avtomatski','NLVE70NB5SJ740351'),
('Citroen','C3',40363,4.2,18864,'2018-04-01','rabljeno','hibrid','avtomatski','1C4AYBGC4JN788407'),
('Mercedes','A180',111094,3.8,32673,'2021-05-01','rabljeno','hibrid','ročni','5YJVKDTB5ML840501'),
('Honda','HR-V',104285,3.7,31578,'2017-01-01','rabljeno','hibrid','ročni','5YJWEPWW9HL111502');

SELECT *
FROM vozilo;

-- POIZVEDBE

-- Prikaži vse rabljene avtomobile
SELECT *
FROM vozilo
WHERE avto_status='rabljeno';

-- Prikaži vozila z gorivom 'diesel'
SELECT *
FROM vozilo
WHERE gorivo ='diesel';

-- Prikaži vseh 5 najdražjih vozil
SELECT *
FROM vozilo
ORDER BY cena DESC
LIMIT 5;

-- Izpiši povprečno porabo po posameznem tipu goriva
SELECT gorivo,  ROUND(AVG(povprecna_poraba),2) AS povprecje
FROM vozilo
GROUP BY gorivo;

-- Preštej število vozil po statusu
SELECT avto_status, COUNT(avto_status) AS stevilo_avtov
FROM vozilo
GROUP BY avto_status;

-- Prikaži vozila registrirana po 2020/01
SELECT *
FROM vozilo
WHERE datum_prve_registracije>'2020-01-01';

-- Izpiši VIN, znamko in tip vozila s prevoženimi kilometri > 100000
SELECT vin, znamka, tip, prevozeni_kilometri
FROM vozilo
WHERE prevozeni_kilometri > 100000;

-- Prikaži povprečno ceno po znamki
SELECT znamka, ROUND(AVG(cena),2) AS povpr_cena
FROM vozilo
GROUP BY znamka;

-- Najdi najcenejše vozilo
SELECT *
FROM vozilo
ORDER BY cena ASC
LIMIT 1;

-- Prikaži vse avtomobile z menjalnikom 'avtomatski'
SELECT *
FROM vozilo
WHERE menjalnik = 'avtomatski';

-- Prikaži vozila z porabo med 5 in 8 L/100km
SELECT *
FROM vozilo
WHERE povprecna_poraba BETWEEN 5 AND 8;

-- Izpiši TOP 3 znamke z največ vozili
SELECT znamka, COUNT(znamka) AS stevilo_modelov
FROM vozilo
GROUP BY znamka
ORDER BY stevilo_modelov DESC;

-- Prikaži vozila urejena po datumu prve registracije (najnovejša prva)
SELECT *
FROM vozilo
ORDER BY datum_prve_registracije DESC;

-- Prikaži znamke in število vozil, kjer je gorivo 'hibrid'
SELECT znamka, gorivo, COUNT(znamka) AS stevilo
FROM vozilo
WHERE gorivo='hibrid'
group by znamka;

