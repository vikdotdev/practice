-- 37
SELECT order_id
FROM orders
ORDER BY RANDOM()
LIMIT (SELECT (COUNT(*) / 50) FROM orders);
