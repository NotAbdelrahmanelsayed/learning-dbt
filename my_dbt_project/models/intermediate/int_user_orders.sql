SELECT
    su.id AS user_id,
    COUNT(so.order_id) AS total_orders,
    SUM(so.amount) AS total_spent,
    ROUND(AVG(so.amount), 2) AS avg_order_value,
    MIN(so.order_date) AS first_order_date,
    MAX(so.order_date) AS last_order_date
FROM {{ ref('stg_users') }} su
LEFT JOIN {{ ref('stg_orders') }} so
    ON su.id = so.user_id
GROUP BY su.id
