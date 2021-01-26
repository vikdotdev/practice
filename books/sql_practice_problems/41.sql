-- 41
SELECT order_id, order_date, required_date, shipped_date
FROM orders
WHERE required_date < shipped_date
ORDER BY order_id;
