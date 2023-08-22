WITH menus AS
	(SELECT *
	FROM menu
	WHERE menu.id IN (SELECT id
						FROM menu
						EXCEPT
						SELECT menu_id
						FROM person_order
					 )
	)
SELECT
	menus.pizza_name, menus.price, (SELECT name
									FROM pizzeria
									WHERE menus.pizzeria_id = pizzeria.id
								   ) AS pizzeria_name
FROM menus
ORDER BY 1, 2;
