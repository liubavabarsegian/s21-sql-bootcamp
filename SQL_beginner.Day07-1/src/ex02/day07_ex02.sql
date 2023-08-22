WITH visits AS (SELECT     pizzeria.name, COUNT(*), 'visit' AS action_type
		FROM       person_visits
		INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
		GROUP BY   pizzeria.name
		ORDER BY   count DESC
		LIMIT 3
	       ),
     orders AS (SELECT     pizzeria.name, COUNT(*), 'order' AS action_type
		FROM       person_order
		INNER JOIN menu ON menu.id = person_order.menu_id
		INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
		GROUP BY   pizzeria.name
		ORDER BY   count DESC
		LIMIT 3
	       )
SELECT    *
FROM      visits
UNION ALL 
SELECT    *
FROM      orders
ORDER BY  action_type ASC, count DESC;
