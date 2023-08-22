WITH people_visits AS
		(SELECT
			person.gender, pizzeria.name
		FROM
			person
		INNER JOIN
			person_visits ON person_visits.person_id = person.id
		INNER JOIN
			pizzeria ON pizzeria.id = person_visits.pizzeria_id
		),
	women_visits AS
		(SELECT
		 	name AS pizzeria_name
		 FROM
		 	people_visits
		 WHERE
		 	gender = 'female'
		),
	men_visits AS
		(SELECT
			name AS pizzeria_name
		FROM
			people_visits
		WHERE
			gender = 'male'
		),
	only_women_visits AS
		(SELECT
			pizzeria_name
		FROM
			women_visits
		EXCEPT ALL
			(SELECT
			 	pizzeria_name
			 FROM
			 	men_visits
			)
		),
	only_men_visits AS
		(SELECT
			pizzeria_name
		FROM
			men_visits
		EXCEPT ALL
			(SELECT
			 	pizzeria_name
			 FROM
			 	women_visits
			)
		)
SELECT
	pizzeria_name
FROM
	only_women_visits
UNION ALL
SELECT
	pizzeria_name
FROM
	only_men_visits
ORDER BY 1;
