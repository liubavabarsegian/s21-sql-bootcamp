SELECT 
    (SELECT name
	FROM person
	WHERE id = person_id) AS NAME
FROM person_order
WHERE menu_id IN (12, 14, 18)
	AND order_date = '2022-01-07';
