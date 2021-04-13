--actor
SELECT * FROM actor LIMIT 20;
SELECT COUNT(actor_id) FROM actor
	WHERE first_name LIKE 'P%';
--address
SELECT * FROM address LIMIT 20;
SELECT phone FROM address
	WHERE address='259 Ipoh Drive';
SELECT COUNT(DISTINCT district) FROM address;
SELECT DISTINCT(district) FROM address;
--city
SELECT * FROM city LIMIT 20;
--country
SELECT * FROM country LIMIT 20;
--customer
SELECT * FROM customer LIMIT 20;
SELECT email FROM customer
	WHERE first_name= 'Nancy' AND last_name='Thomas';
SELECT first_name, last_name FROM customer
	WHERE first_name LIKE 'E%' AND address_id < 500
	ORDER BY customer_id DESC
	LIMIT 1;
--film
SELECT * FROM film LIMIT 20;
SELECT DISTINCT(rating) FROM film;
SELECT description FROM film
	WHERE title='Outlaw Hanky';
SELECT title FROM film
	ORDER BY length
	LIMIT 5;
SELECT COUNT(title) FROM film
	WHERE length <= 50;
SELECT COUNT(film_id) FROM film
	WHERE (rating = 'R') AND 
		(replacement_cost BETWEEN 5 AND 15);
SELECT COUNT(title) FROM film
	WHERE title LIKE 'J%';
SELECT rating, ROUND(AVG(replacement_cost),3) FROM film
	GROUP BY rating;
SELECT
	SUM(CASE rating
			WHEN 'R' THEN 1 ELSE 0
		END) AS r,
	SUM(CASE rating
			WHEN 'PG' THEN 1 ELSE 0
		END) AS pg,
	SUM(CASE rating
			WHEN 'PG-13' THEN 1 ELSE 0
		END) AS pg13
	FROM film;
--film_actor
SELECT * FROM film_actor LIMIT 20;
--payment
SELECT * FROM payment LIMIT 20;
SELECT customer_id FROM payment
	WHERE amount>0.00
	ORDER BY payment_date
	LIMIT 10;
SELECT COUNT(payment_id) FROM payment
	WHERE amount>5.00;
SELECT staff_id, COUNT(payment_id) FROM payment
	GROUP BY staff_id
	ORDER BY COUNT(payment_id) DESC;
SELECT customer_id, SUM(amount) FROM payment
	GROUP BY customer_id
	ORDER BY SUM(amount) DESC
	LIMIT 5;
SELECT customer_id, COUNT(payment_id) FROM payment
	GROUP BY customer_id
	HAVING COUNT(payment_id) >= 40;
SELECT customer_id, SUM(amount) FROM payment
	WHERE staff_id = 2
	GROUP BY customer_id
	HAVING SUM(amount) > 110;
SELECT DISTINCT (TO_CHAR(payment_date, 'MONTH')) FROM payment;
SELECT COUNT(*) FROM payment
	WHERE TO_CHAR(payment_date, 'DAY') LIKE '%MONDAY%';
SELECT COUNT(*) FROM payment
	WHERE TO_CHAR(payment_date, 'FMDAY') = 'MONDAY';
SELECT EXTRACT(WEEK FROM payment_date) FROM payment;
SELECT COUNT(*) FROM payment
	WHERE EXTRACT(DOW FROM payment_date) = 1;

--Join
--address,customer
SELECT email FROM customer INNER JOIN address
	ON customer.address_id = address.address_id
	WHERE district = 'California';
--actor,film,film_actor
SELECT title,first_name,last_name FROM film INNER JOIN  
	(SELECT * FROM film_actor INNER JOIN actor
	ON film_actor.actor_id = actor.actor_id
	WHERE first_name = 'Nick' and last_name = 'Wahlberg') AS temp1
	ON film.film_id = temp1.film_id;
SELECT title,first_name,last_name FROM film_actor INNER JOIN actor
	ON film_actor.actor_id = actor.actor_id
	INNER JOIN film 
	ON film.film_id = film_actor.film_id
	WHERE first_name = 'Nick' and last_name = 'Wahlberg';

