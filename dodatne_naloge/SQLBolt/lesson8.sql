-- Find the name and role of all employees who have not been assigned to a building
SELECT * FROM employees
WHERE Building IS NULL;

-- Find the names of the buildings that hold no employees
SELECT * FROM buildings AS b 
LEFT JOIN employees AS e 
ON b.building_name = e.building
WHERE e.name IS NULL;