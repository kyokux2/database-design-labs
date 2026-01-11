CREATE OR REPLACE FUNCTION check_workout_duration()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.duration_minutes <= 0 THEN
        RAISE EXCEPTION 'Workout duration must be positive';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_duration
BEFORE INSERT ON workouts
FOR EACH ROW
EXECUTE FUNCTION check_workout_duration();

CREATE OR REPLACE FUNCTION check_workout_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.workout_date > CURRENT_DATE THEN
        RAISE EXCEPTION 'Workout date cannot be in the future';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_date
BEFORE INSERT ON workouts
FOR EACH ROW
EXECUTE FUNCTION check_workout_date();
