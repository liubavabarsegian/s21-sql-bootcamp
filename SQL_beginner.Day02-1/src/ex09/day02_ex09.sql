WITH females AS
	(SELECT
		id, name
	FROM
		person
	WHERE
		gender = 'female'
	),
	orders AS
	(SELECT
		person_order.person_id
	FROM
		person_order
	INNER JOIN
	 	menu ON menu.id = person_order.menu_id
	 WHERE
	 	menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
	 GROUP BY
	 	person_order.person_id
	 HAVING COUNT(DISTINCT menu.pizza_name) = 2
	)
SELECT
	females.name
FROM
	females
INNER JOIN
	orders ON females.id = orders.person_id
ORDER BY
	females.name;
