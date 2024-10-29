WITH sales AS (
    SELECT *
    FROM {{ ref('stg_raw__sales') }}  
),

products AS (
    SELECT *
    FROM {{ ref('stg_raw__product') }}  
)

SELECT
    s.orders_id,
    s.date_date,
    s.quantity,
    p.products_id,
    p.purchase_price,
    s.revenue,
    (s.quantity * p.purchase_price) AS purchase_cost,
    (s.revenue - (s.quantity * p.purchase_price)) AS margin
FROM sales AS s
JOIN products AS p ON s.products_id = p.products_id

