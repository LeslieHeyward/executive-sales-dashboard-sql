-- Report 4: Top Products by Revenue with Revenue Rank

WITH product_revenue AS (
    SELECT
        p.product_name,
        SUM(o.sales_amount) AS total_revenue
    FROM orders o
    INNER JOIN products p
        ON p.product_id = o.product_id
    GROUP BY p.product_name
)
SELECT
    product_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM product_revenue
ORDER BY total_revenue DESC
LIMIT 5;
