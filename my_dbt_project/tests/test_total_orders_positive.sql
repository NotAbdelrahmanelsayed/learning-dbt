SELECT *
FROM {{ ref('int_user_orders') }}
WHERE total_orders < 0
