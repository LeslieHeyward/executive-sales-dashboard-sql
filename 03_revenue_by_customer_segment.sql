-- Report 3: Revenue by Customer Segment

WITH segment_revenue AS (
    SELECT
        c.customer_segment,
        SUM(o.sales_amount) AS total_revenue
    FROM orders o
    INNER JOIN customers c
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_segment
)
SELECT
    customer_segment,
    total_revenue
FROM segment_revenue
ORDER BY total_revenue DESC;
