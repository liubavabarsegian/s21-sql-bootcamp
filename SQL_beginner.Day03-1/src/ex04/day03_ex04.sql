WITH people_orders AS
		(SELECT
			person.gender, pizzeria.name
		FROM
			person
		INNER JOIN
			person_order ON person_order.person_id = person.id
		INNER JOIN
		 	menu ON menu.id = person_order.menu_id
		INNER JOIN
			pizzeria ON pizzeria.id = menu.pizzeria_id
		 
		),
	women_orders AS
		(SELECT
		 	name AS pizzeria_name
		 FROM
		 	people_orders
		 WHERE
		 	gender = 'female'
		),
	men_orders AS
		(SELECT
			name AS pizzeria_name
		FROM
			people_orders
		WHERE
			gender = 'male'
		),
	only_women_orders AS
		(SELECT
			pizzeria_name
		FROM
			women_orders
		EXCEPT
			(SELECT
			 	pizzeria_name
			 FROM
			 	men_orders
			)
		),
	only_men_orders AS
		(SELECT
			pizzeria_name
		FROM
			men_orders
		EXCEPT
			(SELECT
			 	pizzeria_name
			 FROM
			 	women_orders
			)
		)
SELECT
	pizzeria_name
FROM
	only_women_orders
UNION
SELECT
	pizzeria_name
FROM
	only_men_orders
ORDER BY 1;
