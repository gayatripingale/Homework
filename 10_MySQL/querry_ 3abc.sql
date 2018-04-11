 
-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type. --

USE Sakila;

ALTER TABLE actor 
ADD middle_name VARCHAR(50) AFTER first_name;

SELECT * FROM actor;

-- 3b. You realize that some of these actors have tremendously long last names. --
-- Change the data type of the middle_name column to blobs.--

ALTER TABLE actor
MODIFY middle_name  BLOB;


-- 3c. Now delete the middle_name column. -- 

ALTER TABLE actor
DROP COLUMN middle_name;

SELECT * FROM actor;