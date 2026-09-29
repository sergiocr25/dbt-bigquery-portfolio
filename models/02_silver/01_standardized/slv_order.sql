select
    id as order_id,
    user_id as customer_id,
    order_date,
    lower(trim(status)) as order_status,
    _etl_loaded_at as etl_loaded_at
from {{ ref('bze_order') }}