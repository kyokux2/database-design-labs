-- NON-REPEATABLE READ

-- T1
BEGIN;
SELECT name FROM users WHERE id = 1;

-- T2
BEGIN;
UPDATE users SET name = 'Daniel Updated' WHERE id = 1;
COMMIT;

-- T1
SELECT name FROM users WHERE id = 1;
-- Result: different value -> non-repeatable read

-- Solution:
-- BEGIN ISOLATION LEVEL REPEATABLE READ;
