-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH balance_with_date_in_cur AS (
SELECT
    user_id,
    money,
    currency_id,
    CASE
        WHEN (SELECT MAX(currency.updated) FROM currency WHERE b.currency_id = id AND updated <= b.updated) IS NOT NULL
            THEN (SELECT MAX(currency.updated) FROM currency WHERE b.currency_id = id AND updated <= b.updated)
        ELSE (SELECT MIN(currency.updated) FROM currency WHERE b.currency_id = id AND updated > b.updated)
    END AS updated
FROM
    balance b
)

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    bwdic.money * c.rate_to_usd AS currency_in_usd
FROM
    balance_with_date_in_cur bwdic JOIN currency c ON (bwdic.updated = c.updated AND bwdic.currency_id = c.id)
    LEFT JOIN public."user" u ON bwdic.user_id = u.id
ORDER BY
    name DESC,
    lastname,
    currency_name;
