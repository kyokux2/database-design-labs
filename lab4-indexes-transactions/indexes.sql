-- Índice para buscar por rango de fechas
CREATE INDEX idx_workouts_date
ON workouts (workout_date);

-- Indice de flitro y ordenar
CREATE INDEX idx_workouts_user_date
ON workouts (user_id, workout_date);

-- Indice para buscar por texto
CREATE INDEX idx_users_name
ON users (name);
