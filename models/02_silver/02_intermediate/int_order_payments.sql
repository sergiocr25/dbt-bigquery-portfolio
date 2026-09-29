select
    order_id,

    sum(
        case
            when payment_status = 'success' then amount_dollars
            else 0
        end
    ) as total_amount,

    count(*) as payment_count,

    countif(payment_status = 'success') as successful_payment_count,

    countif(payment_status = 'fail') as failed_payment_count

from {{ ref('slv_payment') }}

group by order_id