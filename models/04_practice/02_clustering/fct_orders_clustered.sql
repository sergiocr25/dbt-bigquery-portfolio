{{
    config(
        materialized='table',
        cluster_by=['order_status']
    )
}}

select *
from {{ ref('fct_orders') }}