CREATE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE SELECT *
		FROM menu
		WHERE pizza_name = 'cheese pizza' AND pizzeria_id = 6;
