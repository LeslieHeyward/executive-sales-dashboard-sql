-- Report 7: City Revenue Share Percentage

WITH city_revenue AS (
    SELECT
        c.city,
        SUM(o.sales_amount) AS total_revenue
    FROM orders o
    INNER JOIN customers c
        ON c.customer_id = o.customer_id
    GROUP BY c.city
),
company_revenue AS (
    SELECT
        SUM(sales_amount) AS company_total
    FROM orders
)
SELECT
    cr.city,
    cr.total_revenue,
    cr.total_revenue * 100.0 / co.company_total AS revenue_share_percent
FROM city_revenue cr
CROSS JOIN company_revenue co
ORDER BY cr.total_revenue DESC;
