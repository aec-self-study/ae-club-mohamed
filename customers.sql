select
  c.id as customer_id,
  c.name,
  c.email,
  MIN(o.created_at) as first_order_at,
  COUNT(DISTINCT o.id) as number_of_orders
from
  `analytics-engineers-club.coffee_shop.orders` o
left join
  `analytics-engineers-club.coffee_shop.customers` c
on
  o.customer_id = c.id
group by
  c.id,
  c.name,
  c.email
order by
  first_order_at
limit
  5;
