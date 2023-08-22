CREATE VIEW v_symmetric_union AS
WITH
	R AS (SELECT * FROM person_visits
			WHERE visit_date = '2022-01-02'),
	S AS (SELECT * FROM person_visits
		 	WHERE visit_date = '2022-01-06'),
	R_diff_S AS (SELECT * FROM R
					EXCEPT (SELECT * FROM S)),
	S_diff_R AS (SELECT * FROM S
					EXCEPT (SELECT * FROM R))
SELECT person_id FROM R_diff_S
UNION
SELECT person_id FROM S_DIFF_R
ORDER BY person_id;
