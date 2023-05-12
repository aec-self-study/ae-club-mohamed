SELECT 
  c.id AS customer_id,
  c.name,
  c.email,
  MIN(o.created_at) AS first_order_at,
  COUNT(DISTINCT o.id) AS number_of_orders
FROM 
  `analytics-engineers-club.coffee_shop.orders` o
LEFT JOIN 
  `analytics-engineers-club.coffee_shop.customers` c
ON 
  o.customer_id = c.id
GROUP BY 
  c.id,
  c.name,
  c.email
ORDER BY 
  first_order_at
LIMIT 
  5;
