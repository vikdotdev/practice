-- 39 CTE (common table expression)
WITH duplicates AS (
  SELECT order_id, COUNT(quantity) AS quantity_count
  FROM order_details
  WHERE quantity >= 60
  GROUP BY order_id, quantity
  HAVING COUNT(quantity) > 1
)
SELECT order_id, product_id, unit_price, quantity, discount
FROM order_details
WHERE order_id IN (SELECT order_id FROM duplicates)
ORDER BY order_id, quantity;
