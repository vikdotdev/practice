-- 32
SELECT
  orders.customer_id,
  customers.company_name,
  orders.order_id,
  SUM(quantity * unit_price) as total_order_amount
FROM orders
  INNER JOIN order_details on orders.order_id = order_details.order_id
  INNER JOIN customers on orders.customer_id = customers.customer_id
WHERE DATE_PART('year', order_date) = 1998
GROUP BY orders.customer_id, customers.company_name, orders.order_id
  HAVING SUM(quantity * unit_price) >= 10000
ORDER BY total_order_amount DESC;
