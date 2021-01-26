-- 30
SELECT customer_id
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

SELECT customers.customer_id AS customer_ids, orders.customer_id AS order_customer_ids
FROM customers
  LEFT OUTER JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.customer_id IS NULL;
