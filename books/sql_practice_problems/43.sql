--- 43 multiple CTE
WITH all_orders AS (
  SELECT employee_id, COUNT(*) AS total
  FROM orders
  GROUP BY employee_id
),
late_orders AS (
  SELECT employee_id, COUNT(*) AS total
  FROM orders
  WHERE required_date < shipped_date
  GROUP BY employee_id
)
SELECT
  employees.employee_id,
  last_name,
  all_orders.total AS all_orders,
  late_orders.total AS late_orders
FROM employees
  INNER JOIN late_orders ON late_orders.employee_id = employees.employee_id
  INNER JOIN all_orders ON all_orders.employee_id = employees.employee_id
ORDER BY all_orders DESC, late_orders DESC;
