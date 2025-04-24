-- ZDRUZEVANJE VRSTIC

-- Koliko filmov je bilo izdanih v vsakem žanru po letu 2010?
SELECT genre, COUNT(*) AS stevilo_izdanih_po_2010
FROM movie2
WHERE YEAR(release_date)>'2009'
GROUP BY genre;

-- Koliko filmov je bilo izdanih v vsakem letu?
SELECT YEAR(release_date) AS letnica, COUNT(*) AS stevilo_izdanih_filmov
FROM movie2
GROUP BY letnica
ORDER BY letnica;

-- Za vsak mpaa_rating izpiši povprečno oceno filma.
SELECT mpaa_rating,  AVG(rating) AS povprecna_ocena
FROM movie2
GROUP BY mpaa_rating
ORDER BY povprecna_ocena;

-- Koliko je zaslužil vsak žanr? Uredite od tistega z največjim zaslužkom do tistega z najnižjim.
SELECT genre, SUM(gross) AS total_gross
FROM movie2
GROUP BY genre
ORDER BY total_gross DESC;

-- Kakšna je povprečna dolžina filma po letih?
SELECT YEAR(release_date) AS year_date, AVG(runtime) AS average_runtime
FROM movie2
GROUP BY year_date;

-- Kakšno je bilo skupno število ocen v vsakem žanru?
SELECT genre, SUM(rating_count) AS stevilo_ocen
FROM movie2
GROUP BY genre;

-- Koliko v povprečju trajajo filmi različnih žanrov?
SELECT genre, AVG(runtime) AS avg_runtime
FROM movie2
GROUP BY genre;

-- Koliko je skupnih ocen (rating_count) vsakega žanra?
SELECT genre, COUNT(rating_count) AS stevilo_skupnih_ocen
FROM movie2
GROUP BY genre;