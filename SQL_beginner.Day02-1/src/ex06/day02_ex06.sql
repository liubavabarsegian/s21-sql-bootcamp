SELECT
	menu.pizza_name, pizzeria.name AS pizzeria_name
FROM
	person_order
INNER JOIN
	menu ON menu.id = person_order.menu_id
INNER JOIN
	pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN
	person ON person_order.person_id = person.id
WHERE
	person.name IN ('Denis', 'Anna')
ORDER BY
	menu.pizza_name;
