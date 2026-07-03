-- Report 5: Customer Revenue Tier Classification

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
    total_revenue,
    CASE
        WHEN total_revenue >= 5000 THEN 'Gold'
        WHEN total_revenue >= 2000 THEN 'Silver'
        ELSE 'Bronze'
    END AS revenue_tier
FROM customer_revenue
ORDER BY total_revenue DESC;
