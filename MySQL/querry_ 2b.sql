
 -- 2b. Find all actors whose last name contain the letters GEN: -- 
 
USE Sakila;

SELECT last_name

FROM actor

WHERE last_name LIKE '%GEN%';

