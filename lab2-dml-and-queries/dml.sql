-- INSERT
INSERT INTO users (name, email)
VALUES ('Laura', 'laura@test.com');

-- UPDATE
UPDATE workouts
SET duration_minutes = 50
WHERE id = 1;

-- DELETE
DELETE FROM workouts
WHERE duration_minutes < 25;
