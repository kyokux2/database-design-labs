-- Usuarios activos
DROP VIEW IF EXISTS user_activity;
CREATE VIEW user_activity AS
SELECT
  u.id,
  u.name,
  COUNT(w.id) AS total_workouts,
  MAX(w.workout_date) AS last_workout
FROM users u
LEFT JOIN workouts w ON u.id = w.user_id
GROUP BY u.id, u.name;

-- Resumen por tipo de entrenamiento
DROP VIEW IF EXISTS workout_type_summary;
CREATE VIEW workout_type_summary AS
SELECT
  wt.name,
  COUNT(w.id) AS workouts_count,
  AVG(w.duration_minutes) AS avg_duration
FROM workout_types wt
LEFT JOIN workouts w ON wt.id = w.workout_type_id
GROUP BY wt.name;
