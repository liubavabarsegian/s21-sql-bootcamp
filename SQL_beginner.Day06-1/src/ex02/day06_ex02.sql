SELECT
	person.name, menu.pizza_name, menu.price,
	ROUND(price - price * person_discounts.discount / 100), pizzeria.name
FROM
	person_order
INNER JOIN
	person ON person_order.person_id = person.id
INNER JOIN
	menu ON person_order.menu_id = menu.id
INNER JOIN
	person_discounts ON person_order.person_id = person_discounts.person_id
	AND menu.pizzeria_id = person_discounts.pizzeria_id
INNER JOIN
	pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY
	person.name, menu.pizza_name;
