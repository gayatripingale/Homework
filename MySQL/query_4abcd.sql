
USE Sakila;
SELECT * FROM actor;

-- SELECT * FROM actor WHERE last_name = 'WILLIAMS';

-- 4a. List the last names of actors, as well as how many actors have that last name. --

SELECT last_name, COUNT( last_name) AS 'Actors with same Last name' FROM actor
GROUP BY last_name;



-- 4b. List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors --

SELECT last_name, COUNT(last_name) AS 'Actors with same last naem' FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >=2;


-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS 
-- the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record. --

UPDATE  actor SET first_name = 'HARPO' 
WHERE  first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

SELECT * FROM actor WHERE last_name = 'WILLIAMS';


/* 4d. Perhaps we were too hasty in changing GROUCHO to HARPO.
 It turns out that GROUCHO was the correct name after all! In a single query, 
 if the first name of the actor is currently HARPO, change it to GROUCHO.
 Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
 BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, 
 HOWEVER! (Hint: update the record using a unique identifier.) */
 
 -- This is like IF ..THE..ELSE kind of situation
 UPDATE actor 
 
 SET first_name =
 CASE
 WHEN first_name =' HARPO' THEN 'GROUCHO'
 ELSE 'MUCHO GROUCHO'
 END
 WHERE actor_id = 172;
 
 SELECT * FROM actor WHERE last_name = 'WILLIAMS';