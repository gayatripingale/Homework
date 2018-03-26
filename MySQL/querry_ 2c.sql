 
 -- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order: -- 
 
USE Sakila;

SELECT last_name,first_name

FROM actor

WHERE last_name LIKE '%LI%'

ORDER BY last_name,first_name;


