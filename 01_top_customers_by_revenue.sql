-- Report 1: Top 5 Customers by Revenue

WITH customer_revenue AS (
    SELECT
        c.customer_name,
        SUM(o.sales_amount) AS total_revenue
    FROM orders o
    INNER JOIN customers c
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
)
SELECT
    customer_name,
    total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 5;
