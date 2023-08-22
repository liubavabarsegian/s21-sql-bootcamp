SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT
	(SELECT visit_date
	 FROM person_visits
	 WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-31')
ORDER BY 1;
