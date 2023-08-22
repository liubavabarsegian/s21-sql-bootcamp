-- SESSION #1
BEGIN;

UPDATE pizzeria
SET    rating = 5
WHERE  name = 'Pizza Hut';

SELECT * FROM pizzeria;

-- SESSION #2
SELECT * FROM pizzeria;

-- SESSION #1
COMMIT;

-- SESSION #2
SELECT * FROM pizzeria;
