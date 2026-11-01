{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    certification_completion_id,
    employee_id,
    first_name,
    last_name,
    email,
    PARSE_JSON(certification_json):certification_name::VARCHAR as certification_name,
    PARSE_JSON(certification_json):certification_cost::INT as certification_cost,
    PARSE_JSON(certification_json):certification_awarded_date::DATE as certification_awarded_date
from {{ source('oliver_landing', 'employee_certifications')}}

