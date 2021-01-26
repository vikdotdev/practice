-- 28
SELECT ship_country, AVG(freight) AS average_freight
FROM orders
WHERE order_date >= DATE_TRUNC('month', (SELECT MAX(order_date) FROM orders)) - INTERVAL '12 month'
GROUP BY ship_country
ORDER BY average_freight DESC
LIMIT 3;
