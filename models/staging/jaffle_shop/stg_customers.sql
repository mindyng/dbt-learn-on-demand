select
    id as customer_id,
    first_name,
    last_name

from {{ source('jaffle_shop', 'customers') }} --jaffle_shop is just the named source in src yml file