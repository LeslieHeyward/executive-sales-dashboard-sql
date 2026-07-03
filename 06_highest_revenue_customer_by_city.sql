-- Report 6: Highest Revenue Customer in Each City

WITH customer_revenue AS (
    SELECT
        c.city,
        c.customer_name,
        SUM(o.sales_amount) AS total_revenue
    FROM orders o
    INNER JOIN customers c
        ON c.customer_id = o.customer_id
    GROUP BY
        c.city,
        c.customer_name
),
ranked_customers AS (
    SELECT
        city,
        customer_name,
        total_revenue,
        RANK() OVER (
            PARTITION BY city
            ORDER BY total_revenue DESC
        ) AS city_rank
    FROM customer_revenue
)
SELECT
    city,
    customer_name,
    total_revenue
FROM ranked_customers
WHERE city_rank = 1
ORDER BY city;
