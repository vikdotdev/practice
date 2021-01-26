-- 34
SELECT
  orders.customer_id,
  customers.company_name,
  SUM(quantity * unit_price) as total_without_discount,
  SUM(quantity * unit_price * (1 - discount)) as total_with_discount
FROM orders
  INNER JOIN order_details on orders.order_id = order_details.order_id
  INNER JOIN customers on orders.customer_id = customers.customer_id
WHERE DATE_PART('year', order_date) = 1998
GROUP BY
  orders.customer_id,
  customers.company_name
HAVING SUM(quantity * unit_price * (1 - discount)) >= 10000
ORDER BY total_with_discount DESC;
