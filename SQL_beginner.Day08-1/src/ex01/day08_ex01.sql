-- SESSION #1
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- SESSION #1
COMMIT;

-- SESSION #2
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
