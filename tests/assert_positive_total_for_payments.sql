-- Refunds have a negative amount. So the total amount should always be >= 0
-- Therefore return records where this is not true (makes test fail).

select
  order_id,
	sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by 1
having not(total_amount > 60)