select
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount,
    payment_count,
    successful_payment_count,
    failed_payment_count,
    etl_loaded_at
from {{ ref('int_orders_enriched') }}