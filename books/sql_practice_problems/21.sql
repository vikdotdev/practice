-- 21
SELECT country, city, COUNT(customer_id)
FROM customers
GROUP BY country, city
ORDER BY COUNT(customer_id) DESC;
