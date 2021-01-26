-- 35
SELECT
  employee_id,
  order_id,
  (date_trunc('month', order_date::date) + interval '1 month' - interval '1 day')::date AS end_of_month
FROM orders
ORDER BY employee_id, order_id DESC;
