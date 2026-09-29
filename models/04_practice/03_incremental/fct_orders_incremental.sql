{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='merge'
    )
}}

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

from {{ ref('fct_orders') }}

{% if is_incremental() %}

where etl_loaded_at > (
    select
        coalesce(
            max(etl_loaded_at),
            datetime '1900-01-01 00:00:00'
        )
    from {{ this }}
)

{% endif %}