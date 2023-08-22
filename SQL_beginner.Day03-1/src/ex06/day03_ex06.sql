-- 06
SELECT
	menu1.pizza_name, 	(SELECT name
						 FROM pizzeria
						 WHERE pizzeria.id = menu1.pizzeria_id) AS pizzeria_name_1,
						 (SELECT name
						 FROM pizzeria
						 WHERE pizzeria.id = menu2.pizzeria_id) AS pizzeria_name_2,
						 menu1.price
FROM
	menu AS menu1
INNER JOIN
	menu AS menu2 	ON menu2.price = menu1.price 
					AND menu1.pizza_name = menu2.pizza_name
					AND menu1.pizzeria_id > menu2.pizzeria_id
ORDER BY 1;
