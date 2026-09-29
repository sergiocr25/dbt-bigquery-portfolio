select *
from {{ ref('slv_customer') }}
where not regexp_contains(last_name, r'^[A-Z]\.$')