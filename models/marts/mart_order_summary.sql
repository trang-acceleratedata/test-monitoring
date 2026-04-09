with orders as (
    select * from {{ ref('stg_orders') }}
)
select
    status,
    count(order_id)     as order_count,
    sum(amount)         as total_amount,
    avg(amount)         as avg_amount,
    min(order_date)     as first_order_date,
    max(order_date)     as last_order_date
from orders
group by status
