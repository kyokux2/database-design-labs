CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE workout_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    goal_type VARCHAR(50) NOT NULL,
    target_value NUMERIC NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

CREATE TABLE workouts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    workout_type_id INT NOT NULL REFERENCES workout_types(id),
    duration_minutes INT NOT NULL CHECK (duration_minutes > 0),
    distance_km NUMERIC CHECK (distance_km >= 0),
    sets INT CHECK (sets >= 0),
    reps INT CHECK (reps >= 0),
    workout_date DATE NOT NULL
);
