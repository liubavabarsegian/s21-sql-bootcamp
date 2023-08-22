-- SESSION # 1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN;

-- SESSION # 2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN;

-- SESSION # 1
SELECT SUM(rating) FROM pizzeria;

-- SESSION # 2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION # 1
SELECT SUM(rating) FROM pizzeria;

-- SESSION # 1
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- SESSION # 2
SELECT SUM(rating) FROM pizzeria;
