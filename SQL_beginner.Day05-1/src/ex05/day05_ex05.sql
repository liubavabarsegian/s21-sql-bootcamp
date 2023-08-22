CREATE UNIQUE INDEX
	idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE
	order_date = '2022-01-01';

EXPLAIN ANALYZE SELECT *
		FROM person_order
		WHERE person_id = 4 AND menu_id = 16 AND order_date = '2022-01-01';
