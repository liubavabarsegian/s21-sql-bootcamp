SET ENABLE_SEQSCAN TO OFF; --отключает использование планировщиком планов последовательного сканирования

EXPLAIN ANALYZE SELECT
	menu.pizza_name, pizzeria.name AS pizzeria_name
FROM
	menu
INNER JOIN
	pizzeria ON pizzeria.id = menu.pizzeria_id;
