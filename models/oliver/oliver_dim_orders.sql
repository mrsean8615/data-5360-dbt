{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


select
order_id as order_key,
order_id,
employee_id,
customer_id,
store_id,
total_amount,
order_date
FROM {{ source('oliver_landing', 'orders') }}