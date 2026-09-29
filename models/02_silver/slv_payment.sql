select
    id as payment_id,
    orderid as order_id,
    lower(trim(paymentmethod)) as payment_method,
    lower(trim(status)) as payment_status,
    {{ cents_to_dollars('amount') }} as amount_dollars,
    created as payment_date,
    _batched_at as batched_at
from {{ ref('bze_payment') }}