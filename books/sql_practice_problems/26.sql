-- 26
SELECT ship_country, AVG(freight) AS average_freight
FROM orders
WHERE DATE_PART('year', shipped_date) = 1998
GROUP BY ship_country
ORDER BY average_freight DESC
LIMIT 3;
