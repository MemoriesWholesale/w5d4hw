CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description VARCHAR, release_year INT, language_id VARCHAR, rental_duration INT, rental_rate numeric, length numeric, replace_cost numeric, rating VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating)
	VALUES (title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating);
END;
$$;

CREATE OR REPLACE FUNCTION films_in_cat(category_id INT)
RETURNS TABLE (
	film_count INT
)
LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY
	SELECT count(film_id)
	FROM film_category fc
	WHERE fc.category_id = category_id;
END;
$$;