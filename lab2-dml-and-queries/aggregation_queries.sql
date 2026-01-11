-- Total de entrenamientos por usuario
SELECT user_id, COUNT(*) AS total_workouts
FROM workouts
GROUP BY user_id
ORDER BY total_workouts DESC;

-- Duración promedio por tipo de entrenamiento
SELECT workout_type_id, AVG(duration_minutes) AS avg_duration
FROM workouts
GROUP BY workout_type_id;

-- Total de distancia recorrida por usuario
SELECT user_id, SUM(distance_km) AS total_distance
FROM workouts
GROUP BY user_id
HAVING SUM(distance_km) > 5;
