--Find average rating per movie
SELECT * FROM movies
SELECT * FROM reviews;
SELECT 
	m.title,
	AVG(r.rating) AS average_rating
FROM 
	movies m
JOIN 
	reviews r ON m.movie_id = r.movie_id
GROUP BY 
	m.title
ORDER BY 
	 average_rating DESC;

--Create and query a temp table with movies where total revenue (domestic plus international) is greated than 100000000-- Create a temporary table
CREATE TEMP TABLE high_revenue_movies AS
SELECT 
    m.movie_id,
    m.title,
    mr.domestic_revenue,
    mr.international_revenue,
    (mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM 
    movies m
JOIN 
    movie_revenues mr ON m.movie_id = mr.movie_id
WHERE 
    (mr.domestic_revenue + mr.international_revenue) > 100000000;

--Create a function to get average rating of a movie by title
CREATE OR REPLACE FUNCTION get_average_rating(movie_title VARCHAR)
RETURNS NUMERIC AS $$
DECLARE avg_rating NUMERIC;
BEGIN
    SELECT AVG(r.rating) INTO avg_rating
    FROM reviews r
    JOIN movies m ON r.movie_id = m.movie_id
    WHERE m.title = movie_title;

    RETURN avg_rating;
END;
$$ LANGUAGE plpgsql;

--Find the top 5 actors with most movie appearances
SELECT 
	a.first_name,
	a.last_name,
	COUNT(cm.movie_id) AS total_movies
FROM 
	actors a
JOIN 
	cast_members cm ON a.actor_id = cm.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY total_movies DESC
LIMIT 5;

--Show all user emails in lowercase
SELECT LOWER(email) AS email_lowercase
FROM users;

--Show year of release for each movie
SELECT 
    title, 
    EXTRACT(YEAR FROM release_date) AS release_year
FROM movies;

--Round domestic revenue to nearest dollar
SELECT * FROM movie_revenues;
SELECT 
    mr.movie_id,
    ROUND(domestic_revenue) AS rounded_domestic_revenue
FROM 
    movie_revenues mr
JOIN 
    movies m ON mr.movie_id = m.movie_id;

--Count how many reviews each movie has
SELECT 
    m.title,
    COUNT(r.review_id) AS review_count
FROM 
    movies m
LEFT JOIN 
    reviews r ON m.movie_id = r.movie_id
GROUP BY 
    m.title
ORDER BY 
    review_count DESC;

--Show full name of all actors (first + last name)
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM 
    actors;

--Get total number of movies directed by a specific director CREATE OR REPLACE FUNCTION count_movies_by_director(director_name TEXT) (Custom Function That Returns a Single Value)
CREATE OR REPLACE FUNCTION count_movies_by_director(director_name TEXT)
RETURNS INTEGER AS $$
DECLARE total_movies INTEGER;
BEGIN
    SELECT COUNT(m.movie_id) INTO total_movies
    FROM movies m
    JOIN directors d ON m.director_id = d.director_id
    WHERE CONCAT(d.first_name, ' ', d.last_name) = director_name;

    RETURN total_movies;
END;
$$ LANGUAGE plpgsql;

--Get all movies with rating above a certain number (Custom Function That Returns a Table)
CREATE OR REPLACE FUNCTION get_high_rated_movies(min_rating INTEGER)
RETURNS TABLE (
    movie_id INTEGER,
    title VARCHAR,
    rating INTEGER
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        m.movie_id, 
        m.title, 
        r.rating
    FROM 
        movies m
    JOIN 
        reviews r ON m.movie_id = r.movie_id
    WHERE 
        r.rating > min_rating
    ORDER BY 
        r.rating DESC;
END;
$$ LANGUAGE plpgsql;
