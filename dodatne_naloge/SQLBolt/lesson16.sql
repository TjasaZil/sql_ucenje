/*Create a new table named Database with the following columns:
– Name A string (text) describing the name of the database
– Version A number (floating point) of the latest version of this database
– Download_count An integer count of the number of times this database was downloaded

This table has no constraints.*/

CREATE TABLE IF NOT EXISTS Database(
Name VARCHAR(50),
Version FLOAT,
Download_count INT
);