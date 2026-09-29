select
    customer_id,

    count(*) as total_orders,

    min(order_date) as first_order_date,
    max(order_date) as last_order_date,

    sum(coalesce(total_amount, 0)) as total_spent,

    sum(successful_payment_count) as successful_payment_count,
    sum(failed_payment_count) as failed_payment_count

from {{ ref('int_orders_enriched') }}

group by customer_id