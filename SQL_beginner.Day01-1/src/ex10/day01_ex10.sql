SELECT
	person.name AS person_name,
	menu.pizza_name,
	pizzeria.name AS pizzeria_name
FROM
	person
INNER JOIN
	person_order ON person_order.person_id = person.id
INNER JOIN
	menu ON menu.id = person_order.menu_id
INNER JOIN
	pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY
	person_name, pizza_name, pizzeria_name;
