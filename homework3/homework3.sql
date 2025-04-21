--Find all genres that have more than 3 movies with a rating of 'R'
SELECT * FROM movies;
SELECT * FROM genres;
SELECT 
	rating,
	COUNT (*) AS genre
FROM movies 
WHERE rating = 'R'
GROUP BY rating
HAVING COUNT (*) > 3;

--Find directors who have made movies with total revenue over 500 million and have directed at least 2 movies
SELECT * FROM directors;
SELECT * FROM movie_revenues;
SELECT 
	d.first_name,
	d.last_name
FROM directors d
JOIN movies m ON d.director_id = m.director_id
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
GROUP BY d.first_name, d.last_name
HAVING SUM (mr.domestic_revenue + mr.international_revenue) > 500000000
AND COUNT(m.movie_id) > 2;

--Find actors who have appeared in more than 2 different genres and have won at least 1 award
SELECT * FROM actors;
SELECT * FROM cast_members;
SELECT * FROM movie_genres;
SELECT * FROM actor_awards;
SELECT 
	a.first_name,
	a.last_name
FROM actors a
JOIN cast_members cm ON a.actor_id = cm.actor_id
JOIN movie_genres mg ON cm.movie_id = mg.movie_id
JOIN actor_awards aa ON a.actor_id = aa.actor_id
GROUP BY a.first_name, a.last_name
HAVING COUNT(DISTINCT mg.genre_id ) > 2 AND COUNT(aa.award_id) > 1;

--Find movies that have received more than 3 reviews with an average rating above 7
SELECT * FROM movies;
SELECT * FROM reviews;
SELECT 
	m.movie_id,
	m.title
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY m.movie_id ,m.title
HAVING COUNT(r.review_id) > 3 AND AVG(r.rating) > 7; 

--Find production companies that have invested more than 100 million in movies released after 2015
SELECT * FROM movie_production_companies;
SELECT * FROM production_companies;
SELECT * FROM movies;
SELECT 
	pc.company_id,
	pc.name
FROM production_companies pc
JOIN movie_production_companies mpc ON pc.company_id = mpc.company_id
JOIN movies m ON m.movie_id = mpc.movie_id
WHERE m.release_date = '2015-12-31'
GROUP BY pc.company_id, pc.name
HAVING SUM (mpc.investment_amount) > 100000000;

--Find countries where more than 2 movies were filmed with a total budget exceeding 150 million
SELECT ml.country
FROM movie_locations ml
JOIN movies m ON ml.movie_id = m.movie_id
WHERE m.budget > 0 
GROUP BY ml.country
HAVING COUNT(DISTINCT m.movie_id) > 2 AND SUM(m.budget) > 150000000;

--Find genres where the average movie duration is over 120 minutes and at least one movie has won an Oscar
SELECT 
	g.genre_id, g.name
FROM genres g
JOIN  movie_genres mg ON g.genre_id = mg.genre_id
JOIN  movies m ON mg.movie_id = m.movie_id
JOIN  movie_awards ma ON m.movie_id = ma.movie_id
JOIN  awards a ON ma.award_id = a.award_id
WHERE 
	a.award_type = 'Oscar'
GROUP BY 
	g.genre_id, g.name
HAVING AVG(m.duration_minutes) > 120;

--Find years where more than 3 movies were released with an average budget over 50 million
SELECT EXTRACT(YEAR FROM m.release_date) AS release_year
FROM movies m 
WHERE m.budget > 0 
GROUP BY release_year
HAVING COUNT(m.movie_id) > 3 AND AVG(m.budget) > 50000000;

--Find actors who have played lead roles in more than 2 movies with a total revenue exceeding 200 million
SELECT * FROM actors;
SELECT * FROM cast_members;
SELECT a.actor_id, a.first_name, a.last_name
FROM actors a
JOIN cast_members cm ON a.actor_id = cm.actor_id
JOIN movies m ON cm.movie_id = m.movie_id
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
WHERE cm.is_lead_role = true
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(DISTINCT m.movie_id) > 2 AND SUM(mr.domestic_revenue + mr.international_revenue) > 200000000;



--VIEW-------------------
--Create a view that shows top-rated movies. Include: movie title, average rating, review count, director name
CREATE VIEW top_rated_movies AS
SELECT 
    m.title AS movie_title,
    AVG(r.rating) AS average_rating,
    COUNT(r.review_id) AS review_count,
    CONCAT(d.first_name, ' ', d.last_name) AS director_name
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
JOIN directors d ON m.director_id = d.director_id
GROUP BY m.movie_id, m.title, d.director_id, d.first_name, d.last_name
HAVING AVG(r.rating) > 7
--Create a view for movie financial performance. Include: movie title, budget, total revenue, profit, ROI
SELECT * FROM movies;
CREATE VIEW movie_financial_performance AS
SELECT 
    m.title AS movie_title,
    m.budget,
    (mr.domestic_revenue + mr.international_revenue) AS total_revenue,
    ((mr.domestic_revenue + mr.international_revenue) - m.budget) AS profit,
    (((mr.domestic_revenue + mr.international_revenue) - m.budget) / NULLIF(m.budget, 0)) * 100 AS ROI -- Return on Investment as a percentage
FROM movies m
JOIN movie_revenues mr ON m.movie_id = mr.movie_id;
--Create a view for actor filmography. Include: actor name, movie count, genre list, total revenue
SELECT * FROM actors;
SELECT * FROM cast_members;
CREATE VIEW actor_filmography AS
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(DISTINCT cm.movie_id) AS movie_count,
    STRING_AGG(DISTINCT g.name, ', ') AS genre_list, -- Aggregates genre names into a comma-separated list
    SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM actors a
JOIN cast_members cm ON a.actor_id = cm.actor_id
JOIN movie_genres mg ON cm.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
JOIN movies m ON cm.movie_id = m.movie_id
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
GROUP BY a.actor_id, a.first_name, a.last_name;

--Create a view for genre statistics. Include: genre name, movie count, average rating, total revenue
CREATE VIEW genre_statistics AS
SELECT 
    g.name AS genre_name,
    COUNT(DISTINCT mg.movie_id) AS movie_count,
    AVG(r.rating) AS average_rating,
    SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM genres g
JOIN movie_genres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
JOIN reviews r ON m.movie_id = r.movie_id
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
GROUP BY g.genre_id, g.name;

--Create a view for production company performance. Include: company name, movie count, total investment, total revenue
SELECT * FROM movie_production_companies;
CREATE VIEW production_company_performance AS
SELECT 
    pc.name AS company_name,
    COUNT(DISTINCT mpc.movie_id) AS movie_count,
    SUM(mpc.investment_amount) AS total_investment,
    SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM production_companies pc
JOIN movie_production_companies mpc ON pc.company_id = mpc.company_id
JOIN movies m ON mpc.movie_id = m.movie_id
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
GROUP BY pc.company_id, pc.name;