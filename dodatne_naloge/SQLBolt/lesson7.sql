-- Find the list of all buildings that have employees
SELECT DISTINCT b.Building_name FROM buildings as b
INNER JOIN employees as a
ON b.Building_name = a.Building;

-- Find the list of all buildings and their capacity
SELECT building_name, capacity
FROM buildings;

-- List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT b.building_name, e.Role
FROM buildings as b
LEFT JOIN employees as e
ON b.Building_name = e.building;