WITH males AS
	(SELECT
		id, name
	FROM
		person
	WHERE
		address IN ('Moscow', 'Samara')
	 	AND gender = 'male'
	),
	orders AS
	(SELECT
		person_id
	FROM
		person_order
	INNER JOIN
		menu ON person_order.menu_id = menu.id
	 WHERE
	 	menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
	)
SELECT
	males.name
FROM
	males
INNER JOIN
	orders ON orders.person_id = males.id
ORDER BY males.name DESC;
