SELECT
	COALESCE(person.name, '-'), person_visits.visit_date, COALESCE(pizzeria.name, '-')
FROM
	person
FULL OUTER JOIN
	(SELECT *
	FROM
		person_visits
	WHERE
	 	visit_date BETWEEN '2022-01-01' AND '2022-01-03') as person_visits
ON person_visits.person_id = person.id
FULL OUTER JOIN
	pizzeria
ON pizzeria.id = person_visits.pizzeria_id
ORDER BY 1, 2, 3;
