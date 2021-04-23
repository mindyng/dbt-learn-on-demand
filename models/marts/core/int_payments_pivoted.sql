{%- set statuses = ['returned', 'completed', 'return_pending', 'shipped', 'placed'] -%}

with orders as (
  select * from {{ ref('stg_orders') }}
),

pivoted as (
  select
    order_id,
    {% for status_type in statuses -%}
    
    sum(case when status = '{{ status_type }}' then 1 else 0 end) as {{ status_type }}_count
    {%- if not loop.last -%}
     ,

    {%- endif %}
    {% endfor %}
from orders
group by 1
)


select * from pivoted