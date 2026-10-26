{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


select
order_line_id as order_line_key,
order_line_id,
order_id,
product_id,
unit_price,
quantity
FROM {{ source('oliver_landing', 'orderline') }}