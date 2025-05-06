-- Poišči naslove vseh filmov z več kot 3 liki (characters).
SELECT m.title, COUNT(c.character_name) AS character_count
FROM movies m
INNER JOIN characters c ON c.movieid=m.movieid
GROUP BY m.title
HAVING character_count > 3;

-- Prikaži vse žanre (genres), kjer je bilo ustvarjenih več kot 5 filmov.
SELECT g.name, count(g.genre_id) AS movies_in_genre
FROM movies m
INNER JOIN genres g ON g.genre_id=m.genre_id
GROUP BY g.genre_id
HAVING count(g.genre_id) > 5;

-- Prikaži vse igralce, ki so igrali v več kot 10 filmih.
SELECT a.name, COUNT(a.name) AS times_in_movie
FROM movies m
INNER JOIN characters c ON c.movieid=m.movieid
INNER JOIN actors a ON c.actorid = a.actorId
GROUP BY a.name
HAVING times_in_movie > 10;

-- Poišči naslove vseh filmov, ki so zaslužili več kot 1 milijon USD (budget < gross).
SELECT title
FROM movies
WHERE gross - budget > 1000000;

-- Izpiši MPAA ocene (rating_value), ki jih ima več kot 20 filmov.
SELECT mp.rating_value, count(mp.rating_value) AS no_of_movies
FROM movies m
INNER JOIN mpaa_ratings mp ON mp.mpaa_rating_id = m.mpaa_rating_id
GROUP BY m.mpaa_rating_id
HAVING no_of_movies > 20;

-- Izpiši vse igralce, ki so igrali v vsaj enem filmu z žanrom "Drama".
SELECT distinct a.name, g.name
FROM movies m
INNER JOIN genres g ON g.genre_id = m.genre_id
INNER JOIN characters c ON c.movieid = m.movieid
INNER JOIN actors a ON a.actorid = c.movieid
HAVING g.name = 'Drama';

-- Prikaži naslove filmov, ki imajo povprečno oceno (rating) več kot 8.0 in več kot 1000 ocen (rating_count).
SELECT title 
FROM movies
WHERE rating > 8 AND rating_count > 1000;

-- Poišči vse filme, katerih dolžina (runtime) je nad povprečno dolžino vseh filmov.
SELECT title
FROM movies
WHERE runtime > (SELECT AVG(runtime) FROM movies);

-- Prikaži vse igralce, ki so višji od povprečne višine vseh igralcev (height_inches).
SELECT name
FROM actors
WHERE height_inches > (SELECT AVG(height_inches) FROM actors);

-- Prikaži naslove vseh filmov, ki so bili izdani po letu 2000 in imajo zaslužek (gross - budget) večji od povprečnega zaslužka vseh filmov.
SELECT title
FROM movies
WHERE YEAR(release_date) > 2000 AND gross-budget > (SELECT AVG(gross-budget) FROM movies);