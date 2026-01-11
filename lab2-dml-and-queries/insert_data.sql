INSERT INTO users (name, email) VALUES
('Daniel', 'daniel@test.com'),
('Ana', 'ana@test.com'),
('Carlos', 'carlos@test.com');

INSERT INTO workout_types (name) VALUES
('running'),
('walking'),
('strength');

INSERT INTO goals (user_id, goal_type, target_value, start_date)
VALUES
(1, 'distance', 100, '2025-01-01'),
(2, 'sessions', 20, '2025-01-10');

INSERT INTO workouts (user_id, workout_type_id, duration_minutes, distance_km, workout_date)
VALUES
(1, 1, 45, 6.5, '2025-01-05'),
(1, 1, 30, 4.2, '2025-01-07'),
(2, 3, 60, NULL, '2025-01-06'),
(3, 2, 20, 2.0, '2025-01-08');