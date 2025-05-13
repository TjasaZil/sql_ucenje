-- Find the longest time that an employee has been at the studio
SELECT name, Max(years_employed) as years FROM employees;

-- For each role, find the average number of years employed by employees in that role
SELECT role, name, building, avg(years_employed) as avg_years FROM employees group by role;

-- Find the total number of employee years worked in each building
SELECT role, name, building, sum(years_employed) as total_years FROM employees group by building;