{{
  config(
    materialized='table'
  )
}}

select user_id,
count(distinct order_id) as num_orders,
sum(order_total) as order_purchase_total_dollars,
min(created_at) as first_order_date,
max(created_at) as latest_order_date
from {{ ref('int_orders_products') }}
group by 1