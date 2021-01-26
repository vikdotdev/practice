-- 29
SELECT orders.employee_id, last_name, orders.order_id, product_name, order_details.quantity
FROM orders
  INNER JOIN employees ON employees.employee_id = orders.employee_id
  INNER JOIN order_details ON orders.order_id = order_details.order_id
  INNER JOIN products ON products.product_id = order_details.product_id
ORDER BY orders.order_id, products.product_id;
