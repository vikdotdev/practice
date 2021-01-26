-- 22
SELECT product_id, product_name, units_in_stock, reorder_level
FROM products
WHERE units_in_stock < reorder_level
ORDER BY product_id;
