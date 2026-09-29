select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.etl_loaded_at,

    p.total_amount,
    p.payment_count,
    p.successful_payment_count,
    p.failed_payment_count

from {{ ref('slv_order') }} as o

left join {{ ref('int_order_payments') }} as p
    on o.order_id = p.order_id