-- Correcto
SELECT add_workout_safe(1, 1, 40, 5.0, CURRENT_DATE);

-- Error FK
SELECT add_workout_safe(999, 1, 30, 4.0, CURRENT_DATE);

-- Error trigger (duración negativa)
SELECT add_workout_safe(1, 1, -10, 3.0, CURRENT_DATE);

-- Uso de funciones
SELECT get_user_workout_count(1);
SELECT get_user_total_distance(1);


