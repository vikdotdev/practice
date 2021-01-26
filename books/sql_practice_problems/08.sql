-- 08
SELECT order_id, customer_id, ship_country
FROM orders
WHERE ship_country = 'France' OR ship_country = 'Belgium';
