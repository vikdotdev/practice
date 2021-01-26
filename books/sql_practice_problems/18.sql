-- 18
SELECT product_id, product_name, company_name
FROM products
  INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY product_id;
