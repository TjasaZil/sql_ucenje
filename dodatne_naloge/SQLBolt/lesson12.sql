-- Find the number of movies each director has directed
SELECT Director, COUNT(title) AS movies_directed 
FROM movies 
GROUP BY director;

-- Find the total domestic and international sales that can be attributed to each director
SELECT m.director, SUM(domestic_sales + international_sales) AS total_movie_sales 
FROM movies m 
INNER JOIN boxoffice b ON b.movie_id = m.id
GROUP BY m.director;