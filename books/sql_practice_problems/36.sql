-- 36
SELECT
  orders.order_id,
  COUNT(*) AS total_order_details
FROM orders
  INNER JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_id
ORDER BY total_order_details DESC
LIMIT 10;
