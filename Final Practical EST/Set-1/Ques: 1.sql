--QUESTION: 1
--Write a SQL query to list all product names and the total quantity ordered for each. 
--Include products with no orders and show their quantity as 0.

SELECT 
    p.product_name,
    COALESCE(SUM(o.quantity), 0) AS total_quantity
FROM 
    products p
LEFT JOIN 
    orders o
ON 
    p.product_id = o.product_id
GROUP BY 
    p.product_name;