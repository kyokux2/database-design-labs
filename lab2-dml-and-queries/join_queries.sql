-- Entrenamientos 
SELECT u.name, wt.name AS workout_type, w.duration_minutes
FROM workouts w
INNER JOIN users u ON w.user_id = u.id
INNER JOIN workout_types wt ON w.workout_type_id = wt.id;

-- Usuarios y sus entrenamientos 
SELECT u.name, w.workout_date
FROM users u
LEFT JOIN workouts w ON u.id = w.user_id;
