-- 48
WITH all_orders AS (
  SELECT
    orders.customer_id,
    customers.company_name,
    SUM(quantity * unit_price) AS total
  FROM orders
    INNER JOIN order_details ON orders.order_id = order_details.order_id
    INNER JOIN customers ON orders.customer_id = customers.customer_id
  WHERE DATE_PART('year', order_date) = 1998
  GROUP BY
    orders.customer_id,
    customers.company_name
)
SELECT
  customer_id,
  company_name,
  round(total::DECIMAL, 2) AS total_order_amount,
  CASE
    WHEN total < 1000 THEN 'Low'
    WHEN total >= 1000 AND total < 5000 THEN 'Medium'
    WHEN total >= 5000 AND total < 10000 THEN 'High'
    WHEN total >= 10000 THEN 'Very High'
  END AS customer_group
FROM all_orders
ORDER BY company_name;
