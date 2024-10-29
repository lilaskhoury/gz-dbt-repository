WITH 
shipping AS (
    SELECT *
    FROM {{ ref('stg_raw__ship') }}
), 
sales_margin AS (
    SELECT *
    FROM {{ ref('int_sales_margin') }}
)

SELECT
    sh.orders_id,
    SUM(sh.shipping_fee) AS shipping_fee,
    SUM(sh.ship_cost) AS ship_cost,
    SUM(sh.logcost) AS logcost,
    SUM(m.margin) AS margin,
    SUM(m.margin) + SUM(sh.shipping_fee) - SUM(sh.logcost) - SUM(sh.ship_cost) AS operational_margin
FROM shipping AS sh 
JOIN sales_margin AS m 
ON sh.orders_id = m.orders_id
GROUP BY sh.orders_id

