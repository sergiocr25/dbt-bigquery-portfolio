select
    id as customer_id,
    initcap(trim(first_name)) as first_name,
    concat(
        upper(substr(trim(last_name), 1, 1)),
        '.'
    ) as last_name
from {{ ref('bze_customer') }}