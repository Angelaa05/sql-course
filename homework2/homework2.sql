SELECT * FROM movies;
SELECT * FROM actors;
SELECT * FROM genres;
SELECT * FROM directors;

--Find all movies released in 2019
SELECT * FROM movies
WHERE EXTRACT(YEAR FROM release_date) = 2019;

--Find all actors from 'British' nationality
SELECT * FROM actors
WHERE nationality = 'British';

--Find all movies with 'PG-13' rating
SELECT * FROM movies
WHERE rating = 'PG-13';

--Find all directors from 'American' nationality
SELECT * FROM directors
WHERE nationality = 'American';

--Find all movies with duration more than 150 minutes
SELECT * FROM movies
WHERE duration_minutes > 150;

--Find all actors with last name 'Pitt'
SELECT * FROM actors
WHERE last_name = 'Pitt';

--Find all movies with budget greater than 100 million
SELECT * FROM movies
WHERE budget > 100000000;

--Find all reviews with rating 5
SELECT * FROM reviews
WHERE review_id = '5';

--Find all movies in English language
SELECT * FROM movies
WHERE language = 'English';

--Find all production companies from 'California'
SELECT * FROM production_companies
WHERE headquarters LIKE '%California';

--Show movies and their directors
SELECT 
	m.title,
	d.first_name
FROM movies AS m 
INNER JOIN directors d
ON m.director_id = d.director_id;

--Show actors and their movies
SELECT 
    a.first_name,
    m.title
FROM 
    cast_members cm
JOIN 
    actors a ON cm.actor_id = a.actor_id
JOIN 
    movies m ON cm.movie_id = m.movie_id;

--Show movies and their genres
SELECT 
	m.title,
	g.name
FROM 
	movie_genres mg
JOIN 
	movies m ON mg.movie_id = m.movie_id
JOIN
	genres g ON mg.genre_id = g.genre_id;

--Show users and their reviews
SELECT * FROM reviews;
SELECT 
	u.username,
	r.review_text
FROM 
	users AS u
INNER JOIN reviews r
ON u.user_id = r.user_id;

--Show movies and their locations
SELECT 
	m.title,
	ml.specific_location 
FROM movies AS m
INNER JOIN movie_locations ml
ON m.movie_id = ml.movie_id;

--Show movies and their production companies
SELECT 
	m.title,
	mpc.company_id
FROM movies AS m
INNER JOIN movie_production_companies mpc
ON m.movie_id = mpc.movie_id;

--Show actors and their award
SELECT 
	a.first_name,
	aw.award_id
FROM actors AS a
INNER JOIN actor_awards aw
ON a.actor_id = aw.actor_id;

--Show movies and their awards
SELECT 
	m.title,
	ma.award_id
FROM movies AS m 
INNER JOIN movie_awards ma
ON m.movie_id = ma.movie_id;

--Show users and their watchlist movies
SELECT 
	u.username,
	uw.movie_id
FROM users AS u
INNER JOIN user_watchlist uw
ON u.user_id = uw.user_id;

--Show movies and their revenues
SELECT
	m.title,
	mr.domestic_revenue
FROM movies AS m
INNER JOIN movie_revenues mr
ON m.movie_id = mr.movie_id;

--Show all R-rated movies and their directors
SELECT 
	m.title,
	d.first_name
FROM movies AS m
INNER JOIN directors d
ON m.director_id = d.director_id
WHERE m.rating = 'R';

--Show all movies from 2019 and their genres
SELECT 
	m.title,
	g.name
FROM 
	movie_genres mg
JOIN 
	movies m ON mg.movie_id = m.movie_id
JOIN
	genres g ON mg.genre_id = g.genre_id
WHERE 
	EXTRACT(YEAR FROM m.release_date) = 2019;

--Show all American actors and their movies
SELECT 
    a.first_name,
    m.title
FROM 
    cast_members cm
JOIN 
    actors a ON cm.actor_id = a.actor_id
JOIN 
    movies m ON cm.movie_id = m.movie_id
WHERE 
	a.nationality = 'American';

--Show all movies with budget over 100M and their production companies
SELECT
	m.title,
	mpc.company_id
FROM movies AS m
INNER JOIN movie_production_companies mpc
ON m.movie_id = mpc.movie_id
WHERE 
	m.budget > 1000000;

--Show all movies filmed in 'London' and their directors
SELECT
	ml.movie_id,
	d.first_name
FROM movie_locations AS ml
INNER JOIN directors d
ON ml.created_at = d.created_at
WHERE ml.city = 'London';

--Show all horror movies and their actors
SELECT
	g.name,
	a.first_name
FROM genres AS g
INNER JOIN actors a
ON g.created_at = a.created_at
WHERE g.name = 'Horror';

--Show all movies with reviews rated 5 and their reviewersSELECT * FROM reviews;
SELECT * FROM users;
SELECT * FROM movies;
SELECT 
	m.title,
	u.username
FROM reviews r
JOIN movies m ON r.movie_id = m.movie_id
JOIN users u ON r.user_id = u.user_id
WHERE r.rating = 5;

--Show all British directors and their movies
SELECT 
	m.title,
	d.first_name
FROM movies AS m 
INNER JOIN directors d
ON m.director_id = d.director_id
WHERE d.nationality = 'British';

--Show all movies longer than 180 minutes and their genres
SELECT 
	m.title,
	g.name
FROM 
	movie_genres mg
JOIN 
	movies m ON mg.movie_id = m.movie_id
JOIN
	genres g ON mg.genre_id = g.genre_id
WHERE  m.duration_minutes > 180;

--Show all Oscar-winning movies and their directors
SELECT
	m.title,
	d.first_name
FROM movie_awards ma
JOIN awards a ON ma.award_id = a.award_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
WHERE a.award_type = 'Oscar';

