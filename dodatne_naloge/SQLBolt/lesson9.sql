-- List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id;

-- List all movies and their ratings in percent
SELECT title, boxoffice.Rating *10 AS ratings
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id;

-- List all movies that were released on even number years
SELECT *
FROM movies
WHERE year % 2 = 0;