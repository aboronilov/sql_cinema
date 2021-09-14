####################################################################################################
-- Создание базы данных о кино и наполнение её сведениями
####################################################################################################

DROP DATABASE IF EXISTS cinema;
CREATE DATABASE cinema;
USE cinema;

DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
	id SERIAL,
	genre VARCHAR(200)	
) COMMENT 'жанры';

INSERT INTO genres (genre) 
VALUES ('Action'), ('Thriller'), ('Detective story'), ('Fantastics'), ('Comedy'), ('Horror');

DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
	id SERIAL,
	country VARCHAR(200)	
) COMMENT 'страны';

INSERT INTO countries (country) 
VALUES ('USA'), ('Germany'), ('UK'), ('France'), ('Canada'), ('Iran'), ('Japan'), ('Poland'), ('Spain'), ('Italy');

DROP TABLE IF EXISTS actors;
CREATE TABLE actors(
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	from_country_id BIGINT UNSIGNED NOT NULL,
	birthday_at DATE NOT NULL,
	
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE,
	INDEX idx_actors_name (first_name, last_name)
) COMMENT 'актеры';

INSERT INTO 
	actors (first_name, last_name, from_country_id, birthday_at) 
VALUES 
	('Jodie', 'Foster', '1', '1962-11-19'),
	('Francois', 'Cluzet', '4', '1955-09-21'),
	('Marlon', 'Brando', '1', '1924-04-03'),
	('Jean', 'Reno', '4', '1948-07-03'),
	('Leonardo', 'DiCaprio', '1', '1974-11-11'),
	('Brad', 'Pitt', '1', '1963-12-18'),
	('Martin', 'Sheen', '1', '1940-08-03'),
	('Matt', 'Damon', '1', '1970-10-08'),
	('Morgan', 'Freeman', '1', '1937-07-01'),
	('Tom', 'Hanks', '1', '1956-07-09');

DROP TABLE IF EXISTS directors;
CREATE TABLE directors(
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	from_country_id BIGINT UNSIGNED NOT NULL,
	birthday_at DATE NOT NULL,
	
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'режиссеры';

INSERT INTO 
	directors (first_name, last_name, from_country_id, birthday_at) 
VALUES 
	('Jonathan', 'Demme', '1', '1944-02-22'), 
	('Olivier', 'Nakache', '4', '1973-04-15'),
	('Francis', 'Ford Coppola', '1', '1939-04-07'),
	('Luc', 'Besson', '4', '1959-03-18'),
	('Christopher', 'Nolan', '1', '1970-07-30'),
	('Guy', 'Ritchie', '1', '1968-09-10'),
	('Steven', 'Spielberg', '1', '1946-12-18'),
	('Martin', 'Scorsese', '1', '1942-11-17'),
	('David', 'Fincher', '1', '1962-08-28'),
	('Morgan', 'Freeman', '1', '1937-07-01');

DROP TABLE IF EXISTS producers;
CREATE TABLE producers(
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	from_country_id BIGINT UNSIGNED NOT NULL,
	birthday_at DATE NOT NULL,
	
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'продюссеры';

INSERT INTO 
	producers (first_name, last_name, from_country_id, birthday_at) 
VALUES 
	('Gary', 'Goetzman', '1', '1952-11-06'), 
	('Nicolas', 'Duval Adassovsky', '4', '1958-01-26'),
	('Anna', 'Hill Johnstone', '1', '1913-04-07'),
	('Magali', 'Guidasci', '4', '1959-03-18'),
	('Emma', 'Thomas', '3', '1970-11-30'),
	('Matthew', 'Vaughn', '3', '1971-03-07'),
	('Walter', 'Parkes', '1', '1951-04-15'),
	('Brad', 'Grey', '1', '1957-12-29'),
	('Arnold', 'Kopelson', '1', '1935-02-14'),
	('Ian', 'Bryce', '1', '1956-07-01');

DROP TABLE IF EXISTS composers;
CREATE TABLE composers(
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	from_country_id BIGINT UNSIGNED NOT NULL,
	birthday_at DATE NOT NULL,
	
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'композиторы';

INSERT INTO 
	composers (first_name, last_name, from_country_id, birthday_at) 
VALUES 
	('Howard', 'Shore', '5', '1946-10-18'), 
	('Ludovico', 'Einaudi', '10', '1955-11-23'),
	('Nino', 'Rota', '10', '1911-12-03'),
	('Eric', 'Serra', '4', '1959-11-09'),
	('Hans', 'Zimmer', '2', '1957-09-12'),
	('John', 'Murphy', '3', '1965-03-04'),
	('John', 'Williams', '1', '1932-02-08');

DROP TABLE IF EXISTS screenwriters;
CREATE TABLE screenwriters(
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	from_country_id BIGINT UNSIGNED NOT NULL,
	birthday_at DATE NOT NULL,
	
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'сценаристы';

INSERT INTO 
	screenwriters (first_name, last_name, from_country_id, birthday_at) 
VALUES 
	('Ted', 'Tally', '1', '1952-04-09'), 
	('Olivier', 'Nakache', '4', '1973-04-15'),
	('Mario', 'Puzo', '1', '1920-10-15'),
	('Luc', 'Besson', '4', '1959-03-18'),
	('Christopher', 'Nolan', '1', '1970-07-30'),
	('Guy', 'Ritchie', '1', '1968-09-10'), 
	('Jeff', 'Nathanson', '1', '1965-10-12'),
	('William', 'Monahan', '1', '1960-11-03'),
	('Andrew', 'Kevin Walker', '1', '1964-08-14'),
	('Robert', 'Rodat', '1', '1953-04-02');

DROP TABLE IF EXISTS directors_of_photography;
CREATE TABLE directors_of_photography(
	id SERIAL,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	from_country_id BIGINT UNSIGNED NOT NULL,
	birthday_at DATE NOT NULL,
	
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE	
) COMMENT 'операторы';

INSERT INTO 
	directors_of_photography (first_name, last_name, from_country_id, birthday_at) 
VALUES 
	('Tak', 'Fujimoto', '1', '1939-07-12'), 
	('Mathieu', 'Vadepied', '4', '1973-02-12'),
	('Gordon', 'Willis', '1', '1931-05-28'),
	('Thierry', 'Arbogast', '4', '1958-04-28'),
	('Wally', 'Pfister', '1', '1961-07-08'),
	('Tim', 'Maurice-Jones', '1', '1958-05-12'), 
	('Janusz', 'Kaminski', '8', '1959-07-27'),
	('Michael', 'Ballhaus', '2', '1935-08-05'),
	('Darius', 'Khondji', '6', '1955-10-21');


DROP TABLE IF EXISTS films;
CREATE TABLE films(
	id SERIAL,
	film_name VARCHAR(200),   
	from_genre_id BIGINT UNSIGNED,
	from_director_id BIGINT UNSIGNED,
	from_producer_id BIGINT UNSIGNED,
	from_composers_id BIGINT UNSIGNED,
	from_screenwriters_id BIGINT UNSIGNED,
	from_directors_of_photography_id BIGINT UNSIGNED,
	from_country_id BIGINT UNSIGNED,
	budget BIGINT UNSIGNED NOT NULL,
	earnings BIGINT UNSIGNED NOT NULL,
	watches BIGINT UNSIGNED NOT NULL,
	ratio REAL UNSIGNED,
	premier_date DATE NOT NULL,
	
	FOREIGN KEY (from_genre_id) REFERENCES genres(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_director_id) REFERENCES directors(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_producer_id) REFERENCES producers(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_composers_id) REFERENCES composers(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_directors_of_photography_id) REFERENCES directors_of_photography(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE,
	INDEX idx_film_name (film_name)
) COMMENT 'фильмы';

INSERT INTO 
	films (film_name, from_genre_id, from_director_id, from_producer_id, from_composers_id, from_screenwriters_id, from_directors_of_photography_id, from_country_id, budget, earnings, watches, ratio, premier_date)
VALUES 
	('The Silence of the Lambs', '2', '1', '1', '1', '1', '1', '1', '19000000', '272742922' , '31100000' , '8.3', '1991-01-30'),
	('1+1', '5', '2', '2', '2', '2', '2', '4', '9500000', '426588510' , '19400000' , '8.8', '2011-09-23'),
	('The Godfather', '3', '3', '3', '3', '3', '3', '1', '6000000', '243862778' , '78900000' , '8.7', '1972-03-14'),
	('Leon', '1', '4', '4', '4', '4', '4', '4', '5000000', '19552639' , '47000000' , '8.7', '1994-09-14'),
	('Inception', '4', '5', '5', '5', '5', '5', '1', '160000000', '828332032' , '37100000' , '8.7', '2010-07-06'),
	('Snatch', '5', '6', '6', '6', '6', '6', '1', '10000000', '83557872' , '5600000' , '8.5', '2000-08-20'),
	('Catch Me If You Can', '5', '7', '7', '7', '7', '7', '1', '52000000', '352114312' , '27900000' , '8.5', '2002-12-16'),	
	('The Departed', '3', '8', '8', '1', '8', '8', '1', '90000000', '291465034' , '20100000' , '8.5', '2006-09-26'),
	('Se7en', '3', '9', '9', '1', '9', '9', '1', '33000000', '327311850' , '23000000' , '8.3', '1995-09-15'),
	('Saving Private Ryan', '1', '7', '10', '7', '10', '7', '1', '70000000', '481840909' , '23000000' , '8.2', '1998-07-21');


DROP TABLE IF EXISTS films_actors;
CREATE TABLE films_actors(
	id SERIAL,
	from_actors_id BIGINT UNSIGNED,
	from_films_id BIGINT UNSIGNED,
	
	FOREIGN KEY (from_actors_id) REFERENCES actors(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_films_id) REFERENCES films(id) ON UPDATE CASCADE ON DELETE CASCADE	
) COMMENT 'Вспомогательная таблица';

INSERT INTO
	films_actors (from_actors_id, from_films_id)
VALUES
	('1','1'),
	('2','2'),
	('3','3'),
	('4','4'),
	('5','5'),
	('6','6'),
	('5','7'),
	('7','7'),
	('10','7'),
	('5','8'),
	('7','8'),
	('8','8'),
	('6','9'),
	('9','9'),
	('8','10'),
	('10','10');

####################################################################################################
-- Сложные запросы
####################################################################################################

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

	
	
	

