{{
  config(
    materialized='table'
  )
}}

with order_product as (
select order_id, 
count(distinct product_id) as products_sold
from {{ ref('stg_postgres_order_items')}} 
group by 1
)

SELECT 
SO.ORDER_ID, 
SO.USER_ID, 
SO.PROMO_ID, 
SO.ADDRESS_ID, 
SO.CREATED_AT, 
SO.ORDER_COST, 
SO.SHIPPING_COST, 
SO.ORDER_TOTAL, 
op.PRODUCTS_SOLD,
SO.TRACKING_ID, 
SO.SHIPPING_SERVICE, 
SO.ESTIMATED_DELIVERY_AT, 
SO.DELIVERED_AT, 
STATUS
FROM {{ ref('stg_postgres_orders') }} so
left join order_product op on op.order_id = so.order_id