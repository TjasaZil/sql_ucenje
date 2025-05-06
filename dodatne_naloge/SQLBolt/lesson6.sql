-- Find the domestic and international sales for each movie
SELECT * 
FROM movies as a 
INNER JOIN boxoffice as b
ON a.Id = b.Movie_id;

-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT * 
FROM movies as a 
INNER JOIN boxoffice as b
ON a.Id = b.Movie_id
WHERE b.International_sales > b.Domestic_sales;

-- List all the movies by their ratings in descending order
SELECT * 
FROM movies as a 
INNER JOIN boxoffice as b
ON a.Id = b.Movie_id
ORDER BY b.Rating DESC;