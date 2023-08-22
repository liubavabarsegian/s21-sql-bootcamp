SELECT  (SELECT name
	 FROM   person
	 WHERE  person.id = person_visits.person_id),
	 COUNT(*) AS count_of_visits
    FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC, name ASC
LIMIT    4;
