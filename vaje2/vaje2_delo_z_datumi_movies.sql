-- DELO Z DATUMI
-- Kdaj je bil izdan najstarejši film?
SELECT release_date 
FROM movie2
ORDER BY release_date asc
LIMIT 1;

-- Koliko filmov je bilo posnetih leta 1990?
SELECT COUNT(*) AS stevilo_filmov_izdanih_1990
FROM movie2
WHERE YEAR(release_date)='1990';

-- Kateri (naslovi) filmi so bili izdani novembra ali decembra?
SELECT title, release_date
FROM movie2
WHERE MONTH(release_date)='11' OR  MONTH(release_date)='12';