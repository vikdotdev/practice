-- 38
SELECT order_id, COUNT(quantity) AS quantity_count
FROM order_details
WHERE quantity >= 60
GROUP BY order_id, quantity
HAVING COUNT(quantity) > 1
ORDER BY order_id;
