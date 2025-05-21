{{
    config(
        materialized="incremental",
        unique_key="user_id"
    )
}}

SELECT 
    user_id,
    total_orders,
    total_spent,
    avg_order_value,
    first_order_date,
    last_order_date,
    CURRENT_DATE AS snapshot_date,
    CASE WHEN last_order_date > CURRENT_DATE - (INTERVAL '1 MONTH') THEN 'active' ELSE 'inactive' END AS user_status
FROM 
    {{ ref('int_user_orders') }}


{% if is_incremental() %}
  WHERE snapshot_date > (SELECT MAX(snapshot_date) FROM {{ this }})
{% endif %}
