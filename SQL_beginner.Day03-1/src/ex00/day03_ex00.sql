WITH pizza_info AS
	(SELECT
		pizza_name, price, pizzeria_id
	FROM
		menu
	WHERE
	 	price BETWEEN 800 and 1000
	),
	visit_info AS
	(SELECT
		pizzeria_id, visit_date
	FROM
		person_visits
	INNER JOIN
		person ON person_visits.person_id = person.id
	WHERE
	 	person.name = 'Kate')
SELECT
	pizza_name, price, (SELECT
							name AS pizzeria_name
						FROM
							pizzeria
						WHERE
							pizzeria.id = visit_info.pizzeria_id
					   ), visit_date
FROM
	pizza_info
INNER JOIN
	visit_info ON visit_info.pizzeria_id = pizza_info.pizzeria_id
ORDER BY
	pizza_name, price, pizzeria_name;
