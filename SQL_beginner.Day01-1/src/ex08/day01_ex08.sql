SELECT
	person_order.order_date,
	CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM
	person_order
NATURAL JOIN
	(SELECT
	 	id AS person_id,
	 	age, name
	 	FROM person) AS person
ORDER BY
	order_date ASC, person_information ASC;
