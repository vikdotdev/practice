-- 40 derived table
SELECT order_details.order_id, product_id, unit_price, quantity, discount
FROM order_details
INNER JOIN (
  SELECT DISTINCT order_id
  FROM order_details
  WHERE quantity >= 60
  GROUP BY order_id, quantity
  HAVING COUNT(*) > 1
) potential_problem_orders
ON potential_problem_orders.order_id = order_details.order_id
ORDER BY order_id, product_id;
