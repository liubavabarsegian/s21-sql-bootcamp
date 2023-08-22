CREATE VIEW v_generated_dates AS
	SELECT
		days.date AS generated_date
	FROM
		generate_series(timestamp '01-01-2022', '31-01-2022', '1 day') AS days
	ORDER BY
		generated_date;
