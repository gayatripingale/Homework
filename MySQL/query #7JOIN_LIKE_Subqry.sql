-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
-- As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
-- Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

USE sakila;

SELECT title FROM film
WHERE language_id IN
	(SELECT language_id  FROM language 
	WHERE name = 'English' )
AND (title LIKE "Q%" ) OR (title LIKE  "K%");

-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.

/* table "film" has:  film_id and title.

/* table "film_actor" has :  actor_id and film_id.

/* table "actor" has: actor_id, first_name, last_name */

SELECT first_name,last_name  from actor

WHERE actor_id IN 
	(SELECT actor_id FROM film_actor 
	WHERE film_id IN
		(SELECT film_id FROM film
			WHERE title = 'Alone Trip'));
            
            

-- 7c. You want to run an email marketing campaign in Canada, 
-- for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.

/* Table "customer" has: fist_name, last_name, email, customer_id
    Table "country" has: country_id, country 
    Table "city" has: country_id, city_id  */
    
SELECT country, first_name,last_name,email 
FROM  customer cu
RIGHT JOIN country c
ON cu.customer_id = c.country_id 
WHERE country = 'Canada';


/* 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
Identify all movies categorized as famiy films. 

   Table  "film_category" has: category_id, film_id

	Table " category" has: category_id, name
     
    Table "film" has: film_id, title */
USE sakila;

SELECT title, name FROM  film 
LEFT JOIN category ON film.film_id = category.category_id
WHERE name = 'Family';


-- 7e. Display the most frequently rented movies in descending order.--

 /* tabes needed  rental, inventory, film
 
 rental: inventory_id,film_id
 
 inventory: inventory_id, film_id
 
 film_text: film_id, title
 */
 
 
SELECT i.film_id, f.title, COUNT(r.inventory_id)
FROM inventory i
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN film_text f 
ON i.film_id = f.film_id
GROUP BY r.inventory_id
ORDER BY COUNT(r.inventory_id) DESC;


-- 7f. Write a query to display how much business, in dollars, each store brought in.

SELECT store.store_id, SUM(amount)
FROM store
INNER JOIN staff
ON store.store_id = staff.store_id
INNER JOIN payment p 
ON p.staff_id = staff.staff_id
GROUP BY store.store_id
ORDER BY SUM(amount);

-- 7g. Write a query to display for each store its store ID, city, and country. -- 


SELECT s.store_id, city, country
FROM store s
INNER JOIN customer cu
ON s.store_id = cu.store_id
INNER JOIN staff st
ON s.store_id = st.store_id
INNER JOIN address a
ON cu.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
INNER JOIN country coun
ON ci.country_id = coun.country_id


-- 7h. List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
USE sakila;
 
SELECT name, SUM (p.amount)
FROM category c
INNER JOIN film_category fc
INNER JOIN inventory i
ON i.film_id = fc.film_id
INNER JOIN rental r
ON r.inventory_id = i.inventory_id
INNER JOIN payment p
GROUP BY name
LIMIT 5;



    





