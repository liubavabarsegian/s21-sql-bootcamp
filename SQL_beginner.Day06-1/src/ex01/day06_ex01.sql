WITH amount_of_orders AS
  (SELECT
    person_order.person_id, menu.pizzeria_id, COUNT(*) AS count
  FROM
    person_order
  INNER JOIN
   	menu ON person_order.menu_id = menu.id
  GROUP BY
    person_order.person_id, menu.pizzeria_id),
discount AS
  (SELECT person_id, pizzeria_id,
    (CASE
      WHEN count = 1
        THEN 10.5
      WHEN count = 2
        THEN 22
      ELSE
        30
    END) AS discount
    
   FROM 
    amount_of_orders)
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
  ROW_NUMBER() OVER() AS id, person_id, pizzeria_id, discount
FROM
  discount;
