
{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    c.customer_key,
    d.date_key,
    s.store_key,
    p.product_key,
    e.employee_key,
    ol.quantity,
    o.total_amount AS dollars_sold,
    ol.unit_price

FROM {{ source('oliver_landing', 'orders') }} AS o

INNER JOIN {{ source('oliver_landing', 'orderline') }} AS ol
    ON o.order_id = ol.order_id

INNER JOIN {{ ref('oliver_dim_customer') }} AS c
    ON o.customer_id = c.customer_id

INNER JOIN {{ ref('oliver_dim_date') }} AS d
    ON CAST(o.order_date AS DATE) = d.date_day

INNER JOIN {{ ref('oliver_dim_store') }} AS s
    ON o.store_id = s.store_id

INNER JOIN {{ ref('oliver_dim_product') }} AS p
    ON ol.product_id = p.product_id

INNER JOIN {{ ref('oliver_dim_employee') }} AS e
    ON o.employee_id = e.employee_id
