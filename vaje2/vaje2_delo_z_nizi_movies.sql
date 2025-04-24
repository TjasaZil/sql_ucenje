-- DELO Z NIZI

-- Izpišite dolžino najdaljšega naslova akcijskih filmov.
SELECT  genre, MAX(LENGTH(title)) AS najdaljsi_akcijski_film
FROM movie2
GROUP BY  genre
HAVING genre = 'Action';

-- Izpišite naslov, budget in trajanje vseh filmov pri čemer stolpcu budget dodajte znak '$' pred zneskom, stolpcu trajanje pa na konec dodajte ' min'.
SELECT title, CONCAT('$',budget) AS budget, CONCAT(runtime, ' min') AS runtime
FROM movie2;

-- Izpišite naslove in žanre vseh filmov, ki imajo rating 'PG-13' pri čemer namesto žanra Science Fiction izpišite 'SF'.
SELECT title, 
 CASE
    WHEN genre = 'Science Fiction' THEN 'SF'
    ELSE genre
  END AS genre
FROM movie2
WHERE mpaa_rating = 'PG-13';

-- Izpišite naslov filma, združen z žanrom, npr. Look Who's Talking (Romance)
SELECT CONCAT(title, ' ', '(' , genre, ')') AS conc
FROM movie2;

-- Izpišite naslov filma, združen z žanrom in letnico, npr. Look Who's Talking (1998) - Romance 
SELECT CONCAT(title, ' ', '(' , YEAR(release_date), ')', ' ',  '-', ' ', genre) AS conc
FROM movie2;