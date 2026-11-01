{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    e.employee_id,
    d.date_key,
    ec.certification_name,
    ec.certification_cost
from {{ ref('stg_employee_certs') }} ec
inner join {{ ref('oliver_dim_employee') }} e
    on e.employee_id = ec.employee_id
inner join {{ ref('oliver_dim_date') }} d
    on d.date_key = ec.certification_awarded_date
