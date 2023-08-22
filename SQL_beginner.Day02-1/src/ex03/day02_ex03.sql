WITH visits AS
	(SELECT
	 	visit_date
	FROM
	 	person_visits
	WHERE
	 	person_visits.person_id = 1 
		OR person_visits.person_id = 2
	),
	dates AS
	(SELECT
	 	days::date AS missing_date
	 FROM
	 	generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS days
	)
SELECT
	dates.missing_date
FROM
	dates
LEFT JOIN
	visits ON visits.visit_date = dates.missing_date
WHERE visits.visit_date IS NULL
ORDER BY dates.missing_date;
