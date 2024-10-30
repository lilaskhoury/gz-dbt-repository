SELECT 
f.date_date,
f.operational_margin - cd.ads_cost AS ads_margin,
f.average_basket,
f.operational_margin,
cd.ads_cost,
cd.impression,
cd.click,
f.quantity,
f.revenue,
f.purchase_cost,
f.margin,
f.shipping_fee,
f.logcost,
f.ship_cost
FROM {{ ref('finance_days') }} AS f 
FULL OUTER JOIN {{ ref('int_campaigns_day') }} AS cd
ON f.date_date=cd.date_date
