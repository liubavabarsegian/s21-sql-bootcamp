WITH visits AS
		(SELECT DISTINCT pizzeria.name
			FROM person_visits
			INNER JOIN
		 		person ON person_visits.person_id = person.id
		 	INNER JOIN
		 		pizzeria ON person_visits.pizzeria_id = pizzeria.id
		 	WHERE
		 		person.name = 'Andrey'
		),
	orders AS
		(SELECT DISTINCT pizzeria.name
			FROM person_order
		 	INNER JOIN
		 		person ON person.id = person_order.person_id
		 	INNER JOIN
		 		menu ON menu.id = person_order.menu_id
		 	INNER JOIN
		 		pizzeria ON pizzeria.id = menu.pizzeria_id
		 	WHERE
		 		person.name = 'Andrey'
		)
SELECT visits.name
FROM visits
EXCEPT (SELECT orders.name
	   FROM orders);
