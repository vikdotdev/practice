-- 42
SELECT employees.employee_id, last_name, COUNT(*) AS total_late_orders
FROM employees
  INNER JOIN orders on orders.employee_id = employees.employee_id
WHERE required_date < shipped_date
GROUP BY employees.employee_id
ORDER BY total_late_orders DESC;
