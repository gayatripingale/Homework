/* 
6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:

6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.

6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.

6d. How many copies of the film Hunchback Impossible exist in the inventory system?

6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:

	![Total amount paid](Images/total_payment.png)
    */
    
USE sakila;

-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address: --


SELECT staff.first_name,staff.last_name, address.address
FROM staff
LEFT JOIN address ON staff.address_id = address.address_id;

-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment. --

SELECT staff.first_name,staff.last_name , SUM(payment.amount)
FROM staff
INNER  JOIN payment 
ON staff.staff_id = payment.staff_id
GROUP BY payment.staff_id;


-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join. --

SELECT title, COUNT(actor_id)
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY title;

-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system? --

SELECT title, COUNT(inventory_id) 
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible";


-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:

-- ![Total amount paid](Images/total_payment.png) --

SELECT last_name, first_name,SUM(amount)
FROM payment p
INNER JOIN customer c
ON  p.customer_id = c.customer_id 
GROUP BY p.customer_id
ORDER BY last_name ASC