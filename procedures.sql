####################################################################################################
-- Процедуры, представления, триггеры
####################################################################################################

USE cinema;

-- Создать процедуру, которая рекомендует случайный фильм из того же жанра
	
DROP PROCEDURE IF EXISTS recommend_film;
	
DELIMITER // 
	
CREATE PROCEDURE recommend_film(in targer_genre_id INT)

BEGIN 
		
	SELECT 
		f2.film_name,
		g.genre		
	FROM 
		films f1
	JOIN 
		films f2 ON f1.id = f2.id
	JOIN 
		genres g ON g.id = f2.from_genre_id 
	WHERE 
		f2.from_genre_id = targer_genre_id		
	ORDER BY 
		rand()
	LIMIT 1;
	
END //	

DELIMITER ;

-- запустим процедуру (при каждом запуске будет новый результат)
CALL recommend_film(1)

-- Создать представление, выбирающее фильмографию режиссера

CREATE or replace VIEW v_directors
AS 
  SELECT film_name
  FROM films 
  JOIN directors ON directors.id = films.from_director_id
  
 -- получим список фильмов 
select *
from v_directors;

-- триггер для корректировки даты проката при вставке новых строк

DROP TRIGGER IF EXISTS check_date_before_insert;

DELIMITER //

CREATE TRIGGER check_date_before_insert BEFORE INSERT ON films
FOR EACH ROW
begin
    IF NEW.premier_date > CURRENT_DATE() THEN
        SET NEW.premier_date = CURRENT_DATE();
    END IF;
END//

DELIMITER ;
