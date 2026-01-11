-- Query 1: range search WITHOUT index
EXPLAIN ANALYZE
SELECT *
FROM workouts
WHERE workout_date BETWEEN '2025-01-01' AND '2025-01-31';

-- Result (before index):
-- Seq Scan on workouts
-- Execution time ~ X ms

-- Query 1: range search WITH index idx_workouts_date
EXPLAIN ANALYZE
SELECT *
FROM workouts
WHERE workout_date BETWEEN '2025-01-01' AND '2025-01-31';

-- Result (after index):
-- Index Scan using idx_workouts_date
-- Execution time reduced
