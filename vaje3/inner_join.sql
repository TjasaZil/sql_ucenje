-- Izpišite imena karakterjev, ki jih je igral Arnold Schwarzenegger.
SELECT a.name, c.character_name 
FROM actors a
INNER JOIN characters c
ON a.actorid=c.actorid
WHERE a.name='Arnold Schwarzenegger';

SELECT a.name, c.character_name
FROM actors a, characters c
WHERE a.name='Arnold Schwarzenegger' AND a.actorid=c.actorid;

-- Poiščite povprečno oceno vsakega žanra.
SELECT g.name, AVG(m.rating) AS avg_rating
FROM genres g
INNER JOIN movies m ON m.genre_id = g.genre_id
GROUP BY g.name;

SELECT g.name, AVG(m.rating) AS avg_rating
FROM genres g, movies m
WHERE m.genre_id=g.genre_id
GROUP BY g.name;


-- Poiščite povprečen čas trajanja filma vsakega žanra.
SELECT g.name, AVG(m.runtime) AS avg_runtime
FROM genres g
INNER JOIN movies m ON m.genre_id = g.genre_id
GROUP BY g.name;

SELECT g.name, AVG(m.runtime) AS avg_runtime
FROM genres g, movies m
WHERE m.genre_id=g.genre_id
GROUP BY g.name;

-- Koliko filmov je v vsakem mpaa ratingu?
SELECT mp.rating_value, COUNT(m.mpaa_rating_id) AS no_of_movies
FROM movies m
INNER JOIN mpaa_ratings mp
ON m.mpaa_rating_id = mp.mpaa_rating_id
GROUP BY m.mpaa_rating_id;

SELECT mp.rating_value, COUNT(m.mpaa_rating_id) AS no_of_movies
FROM movies m, mpaa_ratings mp
WHERE m.mpaa_rating_id = mp.mpaa_rating_id
GROUP BY m.mpaa_rating_id;

-- Izpišite naslove filmov z ratingom 'R' in oceno večjo od 7.
SELECT m.title, mp.rating_value, m.rating
FROM movies m
INNER JOIN mpaa_ratings mp
ON m.mpaa_rating_id = mp.mpaa_rating_id
WHERE mp.rating_value='R' AND m.rating > 7;

SELECT m.title, mp.rating_value, m.rating
FROM movies m, mpaa_ratings mp
WHERE  m.mpaa_rating_id = mp.mpaa_rating_id AND mp.rating_value='R' AND m.rating > 7;

-- Izpišite naslove filmov v katerih je igral Keanu Reeves.
SELECT m.title, a.name
FROM movies m
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON c.actorid = a.actorId
WHERE a.name = 'Keanu Reeves';

SELECT m.title, a.name
FROM movies m, actors a, characters c
WHERE c.movieid = m.movieid AND c.actorid=a.actorId AND a.name = 'Keanu Reeves';

-- Izpišite imena igralcev, ki so igrali v filmu Titanic.
SELECT m.title, a.name
FROM movies m
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON c.actorid = a.actorId
WHERE m.title = 'Titanic';

SELECT m.title, a.name
FROM movies m, actors a, characters c
WHERE c.movieid = m.movieid AND c.actorid=a.actorId AND m.title = 'Titanic';

-- Izpišite imena igralcev, ki so kdaj igrali v grozljivki (Horror).
SELECT m.title, a.name
FROM movies m
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON c.actorid = a.actorId
INNER JOIN genres g ON g.genre_id = m.genre_id
WHERE g.name='Horror';

SELECT m.title, a.name
FROM movies m, characters c, actors a, genres g
WHERE g.name='Horror' AND c.movieid = m.movieid  AND c.actorid = a.actorId AND g.genre_id = m.genre_id;

-- Kakšna je povprečna ocena filmov v katerih igra Robert De Niro?
SELECT AVG(m.rating) AS avg_rating
FROM movies m
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON c.actorid = a.actorId
WHERE a.name = 'Robert De Niro';

SELECT AVG(m.rating) AS avg_rating
FROM movies m, characters c, actors a
WHERE a.name = 'Robert De Niro' AND c.movieid = m.movieid AND c.actorid = a.actorId;

-- Koliko so zaslužili filmi v katerih je igral Tom Cruise?
SELECT SUM(m.gross-m.budget) AS net_earnings
FROM movies m
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON c.actorid = a.actorId
WHERE a.name = 'Tom Cruise';

SELECT SUM(m.gross-m.budget) AS net_earnings
FROM movies m, characters c, actors a
WHERE a.name = 'Tom Cruise' AND c.actorid = a.actorId AND c.movieid = m.movieid;

-- Poišči igralce, ki so igrali v vsaj 3 filmih iz žanra "Drama", kjer so filmi imeli povprečno oceno (rating) več kot 7.5 in skupen zaslužek (gross - budget) več kot 10 milijonov. 
-- Prikaži ime igralca, število teh filmov, povprečno oceno teh filmov ter skupen zaslužek. Rezultate razvrsti po skupnem zaslužku.

SELECT a.name, g.name, m.rating, gross - budget as net
FROM movies m
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON a.actorid = c.actorid
INNER JOIN genres g ON g.genre_id = m.genre_id
GROUP BY a.name, g.name
HAVING g.name = 'Drama' AND COUNT(g.name) > 3 AND m.rating > 7.5 AND net > 10000000
ORDER BY net;

-- mislim da noben tak igralec ne obstaja, zato vrne null