CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	WITH visits AS -- visits of Dima
		(SELECT
			visit_date, pizzeria_id
		FROM
			person_visits
		WHERE
			visit_date = '2022-01-08' AND person_id IN (SELECT
															id
													   FROM
															person
													   WHERE
															name = 'Dmitriy'
													   )
		),
		pizzerias AS
		(SELECT
			pizzeria.id, pizzeria.name
		FROM
			menu
		RIGHT JOIN
			pizzeria ON menu.pizzeria_id = pizzeria.id
		WHERE
			menu.price < 800
		)
	SELECT
		pizzerias.name AS pizzeria_name
	FROM
		visits
	INNER JOIN
		pizzerias ON visits.pizzeria_id = pizzerias.id;
