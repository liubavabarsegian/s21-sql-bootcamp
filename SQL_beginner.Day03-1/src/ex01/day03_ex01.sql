-- 01
SELECT
	id AS menu_id
FROM
	menu
EXCEPT
SELECT
	menu_id
FROM
	person_order
ORDER BY
	menu_id;
