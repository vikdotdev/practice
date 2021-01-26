-- 17
SELECT contact_title, COUNT(contact_title)
FROM customers
GROUP BY contact_title
ORDER BY COUNT(*) DESC;
