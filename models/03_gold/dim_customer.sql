select
    c.customer_id,
    c.first_name,
    c.last_name,

    coalesce(m.total_orders, 0) as total_orders,
    m.first_order_date,
    m.last_order_date,
    coalesce(m.total_spent, 0) as total_spent,
    coalesce(m.successful_payment_count, 0) as successful_payment_count,
    coalesce(m.failed_payment_count, 0) as failed_payment_count

from {{ ref('slv_customer') }} as c

left join {{ ref('int_customer_order_metrics') }} as m
    on c.customer_id = m.customer_id