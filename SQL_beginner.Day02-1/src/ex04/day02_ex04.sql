WITH pizzas AS
	(SELECT
		pizza_name, price, pizzeria_id
	FROM
		menu
	WHERE
	 	pizza_name IN ('mushroom pizza', 'pepperoni pizza')
	), pizzerias AS
	(SELECT
		id, name
	FROM
		pizzeria
	)
SELECT
	pizzas.pizza_name, pizzerias.name, pizzas.price
FROM
	pizzas
INNER JOIN
	pizzerias ON pizzerias.id = pizzas.pizzeria_id
ORDER BY 1, 2;
