####################################################################################################
-- Сложные запросы
####################################################################################################

USE cinema;

-- Отобрать фильмы американского производства. Упорядочить их по убыванию прибыли. Указать режиссера.

SELECT 
	film_name,
	CONCAT(directors.first_name, ' ', directors.last_name) AS director,
	(earnings - budget) AS profit
FROM 
	films
JOIN
	directors ON directors.id = films.from_director_id 
JOIN 
	countries ON countries.id = films.from_country_id
WHERE 
	countries.id = 1
ORDER BY 
	profit DESC;
	
-- Найти самый успешный фильм французского производства по рейтингу. Указать главного актера.
	
SELECT
	film_name,
	CONCAT(actors.first_name, ' ', actors.last_name) AS main_actor,
	ratio
FROM 
	films 
JOIN 
	films_actors ON films.id = films_actors.from_films_id 
JOIN 
	actors ON actors.id = films_actors.from_actors_id 
JOIN
	countries ON countries.id = films.from_country_id
WHERE 
	countries.id = 4
ORDER BY 
	ratio DESC 
LIMIT 1;

-- Отобрать всех актеров, которые снялись более чем в одном фильме подборки. Посчитать количество фильмов.

SELECT 
	CONCAT(actors.first_name, ' ', actors.last_name) AS main_actor,
		count(*) AS cnt
FROM 
	films_actors
JOIN 
	films ON films.id = films_actors.from_films_id 
JOIN 
	actors ON actors.id = films_actors.from_actors_id
GROUP BY 
	actors.id 
HAVING 
	cnt > 1
ORDER BY 
	cnt DESC;

-- Отобрать фильмы по жанрам, которые вышли в прокат позже остальных

SELECT 
	film_name,
	genre,
	premier_date 
FROM 
	films JOIN genres ON films.from_genre_id = genres.id 
WHERE 
	premier_date IN (
	SELECT max(premier_date)
	FROM films JOIN genres ON films.from_genre_id = genres.id
	GROUP BY genre
	)
GROUP BY 
	genre

-- Отобрать страны, фильмы которых не представлены в подборке
	
SELECT 
	c.country 
FROM 
	countries c
WHERE 
	c.country NOT IN (
	SELECT c1.country
	FROM countries c1 JOIN films f ON f.from_country_id = c1.id
	)

	
####################################################################################################
-- Оконные функции
####################################################################################################

-- Отобрать фильмы по жанрам и пронумеровать выдачу внутри жанра. Упорядочить группы по росту бюджета
	
SELECT
	ROW_NUMBER () OVER(PARTITION BY genre ORDER BY from_genre_id) row_num,
	film_name,
	genre,
	budget	
FROM 
	films
JOIN 
	genres ON genres.id = films.from_genre_id 