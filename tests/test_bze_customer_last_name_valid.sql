select *
from {{ ref('bze_customer') }}
where last_name is null
   or trim(last_name) = ''
   or not regexp_contains(trim(last_name), r'^[A-Za-z]')