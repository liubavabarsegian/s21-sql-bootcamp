WITH formula_and_average AS
	(SELECT
		DISTINCT address, ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
		ROUND(AVG(age), 2) as average
	FROM
		person
	GROUP BY
		address)

SELECT
	address, formula, average,
	formula > average AS comparison
FROM
	formula_and_average
ORDER BY
	address;
