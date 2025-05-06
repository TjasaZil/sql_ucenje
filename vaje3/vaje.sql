-- Izpišimo vse naslove filmov in njihove pripadajoče mpaa_ratinge
SELECT m.title, mr.rating_value
FROM movies m
INNER JOIN mpaa_ratings mr 
ON m.mpaa_rating_id = mr.mpaa_rating_id;

-- Izpišite vse naslove filmov in njihove pripadajoče žanre.
SELECT m.title, g.name
FROM movies m 
INNER JOIN genres g
ON g.genre_id = m.genre_id;

-- Izpišite vse naslove filmov in njihove pripadajoče žanre IN njihove pripadajoče mpaa_ratinge.
SELECT m.title, g.name, mr.rating_value
FROM movies m, genres g, mpaa_ratings mr  
WHERE g.genre_id = m.genre_id AND m.mpaa_rating_id = mr.mpaa_rating_id;
