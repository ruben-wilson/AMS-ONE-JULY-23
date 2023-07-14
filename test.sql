SELECT m.title, ROUND(AVG(r.rating), 2) AS average_rating, COUNT(r.rating) AS rating_count
FROM movies AS m
JOIN ratings AS r ON m.id = r.movie_id
GROUP BY m.title
ORDER BY average_rating DESC;
