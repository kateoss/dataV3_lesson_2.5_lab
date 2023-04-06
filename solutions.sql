USE sakila

-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT * FROM actor
WHERE first_name = "Scarlett";

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?

SELECT COUNT(inventory_id) AS physical_copies, COUNT(DISTINCT film_id) AS movie_titles FROM inventory;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT CONCAT(floor(AVG(length)/60),'h ' ,avg(length)%60,'m') as average_length FROM film;

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) AS dist_last_names from actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_of_operation from rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, MONTH(rental_date) AS month, WEEKDAY(rental_date) AS weekday  FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE
WHEN WEEKDAY(rental_date) IN(1,2,3,4,5) then "workday"
WHEN WEEKDAY(rental_date) IN(6,7) then "weekend"
ELSE 'No status'
END AS 'day_type'
FROM rental;

-- 9. Get release years.

SELECT DISTINCT release_year FROM film;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT title from film
WHERE title LIKE "%ARMAGEDDON%";

-- 11. Get all films which title ends with APOLLO.

SELECT title from film
WHERE title LIKE "%APOLLO";

-- 12. Get 10 the longest films.

SELECT * FROM film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?

SELECT COUNT(film_id) FROM film
WHERE special_features LIKE "%Behind the Scenes%";
