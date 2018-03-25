-- 1b Display the first and last names of all actors from the table actor--

USE sakila;
 
SELECT CONCAT(first_name, " ", last_name) AS 'Actor_Name' FROM actor;
