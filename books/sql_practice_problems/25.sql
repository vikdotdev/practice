-- 25
SELECT ship_country, AVG(freight) AS average_freight
FROM orders
GROUP BY ship_country
ORDER BY average_freight DESC
LIMIT 3;
