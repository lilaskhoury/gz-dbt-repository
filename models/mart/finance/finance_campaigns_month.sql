SELECT 
FORMAT_DATE('%Y-%m-01' ,date_date) AS datemonth,
SUM(ads_margin) AS ads_margin,
SUM(average_basket) AS average_basket,
SUM(operational_margin) AS operational_margin,
SUM(ads_cost) AS ads_cost,
SUM(impression) AS impression,
SUM(click) AS click,
SUM(quantity) AS quantity,
SUM(revenue) AS revenue,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) margin,
SUM(shipping_fee) AS shipping_fee,
SUM(logcost) AS logcost,
SUM(ship_cost) AS ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY datemonth
ORDER BY datemonth DESC