SELECT *
FROM {{ ref('int_user_orders') }}
WHERE avg_order_value > total_spent
