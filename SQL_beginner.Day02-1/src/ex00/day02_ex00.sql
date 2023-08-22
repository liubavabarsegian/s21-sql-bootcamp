SELECT
	pizzeria.name, pizzeria.rating
FROM
	pizzeria
LEFT JOIN
	person_visits ON person_visits.pizzeria_id = pizzeria.id
WHERE person_visits.pizzeria_id IS NULL;
