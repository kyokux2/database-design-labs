CREATE OR REPLACE FUNCTION get_user_workout_count(p_user_id INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM workouts
    WHERE user_id = p_user_id;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_user_total_distance(p_user_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total_distance NUMERIC;
BEGIN
    SELECT COALESCE(SUM(distance_km), 0)
    INTO total_distance
    FROM workouts
    WHERE user_id = p_user_id;

    RETURN total_distance;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_workout_safe(
    p_user_id INT,
    p_workout_type_id INT,
    p_duration INT,
    p_distance NUMERIC,
    p_date DATE
) RETURNS VOID AS $$
BEGIN
    INSERT INTO workouts (
        user_id, workout_type_id, duration_minutes, distance_km, workout_date
    )
    VALUES (
        p_user_id, p_workout_type_id, p_duration, p_distance, p_date
    );

EXCEPTION
    WHEN foreign_key_violation THEN
        RAISE EXCEPTION 'User or workout type does not exist';
    WHEN others THEN
        RAISE EXCEPTION 'Unexpected error while adding workout';
END;
$$ LANGUAGE plpgsql;
