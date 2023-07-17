# Challenges using the sakila db

## Intro

You will need to use the sakila database to solve these problems.

## Tasks

1. List all actors.
   
   ```sql
   SELECT * FROM actor;
   ```

2. Find the surname of the actor with the forename 'John'.
   
   ```sql
   SELECT last_name 
   FROM actor 
   WHERE first_name = "John";
   ```

3. Find all actors with surname 'Neeson'.
   
   ```sql
    SELECT *
    FROM actor
    WHERE last_name = "Neeson";
   ```

4. Find all actors with ID numbers divisible by 10.
   
   ```sql
   SELECT * 
   FROM actor
   WHERE actor_id % 10 = 0;
   ```

5. What is the description of the movie with an ID of 100?
   
   ```sql
   SELECT description
   FROM film
   WHERE film_id = 100;
   ```

6. Find every R-rated movie.
   
   ```sql
   SELECT *
   FROM film
   WHERE rating = "R";
   ```

7. Find every non-R-rated movie.
   
   ```sql
   SELECT *
   FROM film
   WHERE rating != "R";
   ```

8.  Find the ten shortest movies.
   
   ```sql
   SELECT title, min(length) as min_length
   FROM film
   GROUP BY title
   ORDER BY length
   LIMIT 10;
   ```

9.  Find the movies with the longest runtime, without using LIMIT.
   
   ```sql
   SELECT title, MAX(length) AS max_length
   FROM film
   GROUP BY title
   ORDER BY max_length DESC;
   ```

10. Find all movies that have deleted scenes.
   
   ```sql
   SELECT title, special_features
   FROM film 
   WHERE special_features LIKE '%Deleted Scenes%';
   ```

11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
   
   ```sql
   SELECT last_name, count(*) AS count
   FROM actor
   GROUP BY last_name
   HAVING count = 1
   ORDER BY last_name DESC;
   ```

12. Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
   
   ```sql
   SELECT last_name, count(*) AS count
   FROM actor
   GROUP BY last_name
   HAVING count > 1
   ORDER BY count DESC;
   ```

13. Which actor has appeared in the most films?
   
   ```sql
   SELECT first_name, last_name 
   FROM actor 
   WHERE actor_id = (
    SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    ORDER BY count(*) DESC
    LIMIT 1
   );
   ```

14. When is 'Academy Dinosaur' due?
   
   ```sql
   SELECT rental_duration 
   FROM film
   WHERE title = "Academy Dinosaur"; 
   ```

15. What is the average runtime of all films?
   
   ```sql
   SELECT AVG(length) as average_length
   FROM film;
   ```

16. List the average runtime for every film category.
   
   ```sql
   SELECT category.name, AVG(length) as average_length
   FROM film
   LEFT JOIN film_category
   ON film.film_id = film_category.film_id
   LEFT JOIN category
   ON film_category.category_id = category.category_id
   GROUP BY category.name;
   ```

17. List all movies featuring a robot.
   
   ```sql
   SELECT title, description
   FROM film 
   WHERE description LIKE '%Robot%';
   ```

18. How many movies were released in 2010?
   
   ```sql
   SELECT count(*) AS Count
   FROM film
   WHERE release_year = "2010";
   ```

19. Find the titles of all the horror movies.
   
   ```sql
   SELECT title
   FROM film
   LEFT JOIN film_category
   ON film.film_id = film_category.film_id
   WHERE category_id = (
    SELECT category_id 
    FROM category
    WHERE name = "Horror"
   );
   ```

20. List the full name of the staff member with the ID of 2.
   
   ```sql
   SELECT first_name, last_name
   FROM staff
   WHERE staff_id = 2;
   ```

21. List all the movies that Fred Costner has appeared in.
   
   ```sql
   -- Get the actor ID - 16
   SELECT actor_id
   FROM actor
   WHERE first_name = "Fred" AND last_name = "Costner";
   
   -- Find all film ids based on actor ID
   SELECT film_id
   FROM film_actor
   WHERE actor_id = (
    SELECT actor_id
    FROM actor
    WHERE first_name = "Fred" AND last_name = "Costner"
   );

   -- Make final query - joins or nested
   SELECT film.film_id, title
   FROM film
   LEFT JOIN film_actor 
   ON film.film_id = film_actor.film_id
   LEFT JOIN actor
   ON film_actor.actor_id = actor.actor_id
   WHERE actor.first_name = "Fred" AND last_name = "Costner";
   ```

22. How many distinct countries are there?
   
   ```sql
   SELECT COUNT(*) as Count
   FROM country;
   ```

23. List the name of every language in reverse-alphabetical order.
   
   ```sql
   SELECT name
   FROM language
   ORDER BY name DESC; 
   ```

24. List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
   
   ```sql
   SELECT first_name, last_name
   FROM actor
   WHERE last_name LIKE '%son%'
   ORDER BY first_name;  
   ```

25. Which category contains the most films?
   
   ```sql
   SELECT category.name, count(*) as number_of_films
   FROM film
   LEFT JOIN film_category
   ON film.film_id = film_category.film_id
   LEFT JOIN category
   ON film_category.category_id = category.category_id
   GROUP BY category.name
   ORDER BY number_of_films DESC
   LIMIT 1;
   ```
