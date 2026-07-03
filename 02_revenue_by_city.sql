-- Report 2: Revenue by City

WITH city_revenue AS (
    SELECT
        c.city,
        SUM(o.sales_amount) AS total_revenue
    FROM orders o
    INNER JOIN customers c
        ON c.customer_id = o.customer_id
    GROUP BY c.city
)
SELECT
    city,
    total_revenue
FROM city_revenue
ORDER BY total_revenue DESC;
