-- Find the number of Artists in the studio (without a HAVING clause)
SELECT count(*) as no_of_artists FROM employees WHERE Role = 'Artist';

-- Find the number of Employees of each role in the studio
SELECT Role, COUNT(*) FROM employees GROUP BY role;

-- Find the total number of years employed by all Engineers
SELECT role, SUM(years_employed) AS total_years_worked FROM employees WHERE role = 'Engineer';