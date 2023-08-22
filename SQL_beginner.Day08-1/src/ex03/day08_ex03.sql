-- SESSION #1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- SESSION #2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- SESSION #1
BEGIN;

-- SESSION #2
BEGIN;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- SESSION #2
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- SESSION #1
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

-- SESSION #2
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';
