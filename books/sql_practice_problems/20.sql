-- 20
-- without aggregation
SELECT category_name, product_id
FROM products
  INNER JOIN categories ON products.category_id = categories.category_id;

-- aggregated
SELECT category_name, COUNT(product_id)
FROM products
  INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY COUNT(product_id) DESC;
