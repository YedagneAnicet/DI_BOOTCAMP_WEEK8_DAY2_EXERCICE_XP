-- write a query to select all the columns from the “customer” table.
SELECT *
FROM customer;
-- Write a query to display the names (first_name, last_name) using an alias named “full_name”.
SELECT first_name || ' ' || last_name AS full_name
FROM customer;
-- Write a query to select all the create_date from the “customer” table (there should be no duplicates).
SELECT DISTINCT create_date
FROM customer;
-- Write a query to get all the customer details from the customer table, it should be displayed in descending order by their first name.
SELECT *
FROM customer
ORDER BY first_name DESC;
-- Write a query to get the film ID, title, description, year of release and rental rate in ascending order according to their rental rate.
SELECT film_id,
    title,
    description,
    release_year,
    rental_rate
FROM film
ORDER BY rental_rate ASC;
-- Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.
SELECT address,
    phone
FROM address a
    INNER JOIN customer c ON (a.address_id = c.address_id)
    AND a.district = 'Texas';
-- Write a query to retrieve all movie details where the movie id is either 15 or 150.
SELECT *
FROM film
WHERE film_id IN (15, 150);
-- Write a query which should check if your favorite movie exists in the database. Have your query get the film ID, title, description, length and the rental rate, these details can be found in the “film” table.
SELECT film_id,
    title,
    description,
    length,
    rental_rate
FROM film
WHERE title = 'Kuruko Basket';
-- Write a query to get the film ID, title, description, length and the rental rate of all the movies starting with the two first letters of your favorite movie
SELECT film_id,
    title,
    description,
    length,
    rental_rate
FROM film
WHERE title LIKE 'Ku%';
-- Write a query which will find the 10 cheapest movies.
SELECT DISTINCT film_id,
    title,
    replacement_cost
FROM film
ORDER BY replacement_cost ASC
LIMIT 10;
-- Write a query which will find the next 10 cheapest movies. Bonus: Try to not use LIMIT.
SELECT DISTINCT film_id,
    title,
    replacement_cost
FROM film
ORDER BY replacement_cost ASC OFFSET 10
FETCH FIRST 10 ROWS ONLY;
-- Write a query which will join the data in the customer table and the payment table. 
SELECT c.first_name,
    c.last_name,
    p.payment_date,
    p.amount
FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.customer_id ASC;
-- Write a query to get all the movies which are not in inventory.
SELECT *
FROM film f
    LEFT JOIN inventory i ON (f.film_id = i.film_id)
WHERE i.inventory_id IS NULL;
-- Write a query to find which city is in which country
SELECT ci.city,
    co.country
FROM city ci
    JOIN country co ON ci.country_id = co.country_id;

-- Write a query to get the customer’s id, names (first and last), the amount and the date of payment ordered by the id of the staff member who sold them the dvd.

SELECT c.customer_id, c.first_name, c.last_name, p.amount , p.payment_date 
FROM payment p 
JOIN customer c ON p.customer_id = c.customer_id 
JOIN staff s ON p.staff_id = s.staff_id;