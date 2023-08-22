INSERT INTO
	person_visits(id, person_id, pizzeria_id, visit_date)
SELECT
	(SELECT MAX(id) FROM person_visits) + 1,
	(SELECT id FROM person 
	 	WHERE name = 'Dmitriy'),
     (SELECT pizzeria_id FROM menu 
	  	WHERE price < 800 AND pizzeria_id <> (SELECT id FROM pizzeria
											 	WHERE name = 'Papa Johns') LIMIT 1), 
	  '08.01.2022';

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
