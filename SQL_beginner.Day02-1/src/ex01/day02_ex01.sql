SELECT
	days AS missing_date
FROM
	(SELECT
	 	visit_date
	 FROM
	 	person_visits 
	 WHERE
	 	person_visits.person_id = 1 
		OR person_visits.person_id = 2) AS person_visits
RIGHT JOIN
	(SELECT
	 	days::date
	 FROM
	 	generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS days) AS dates
ON dates.days::date = person_visits.visit_date
WHERE
	person_visits.visit_date IS NULL
ORDER BY missing_date ASC;
