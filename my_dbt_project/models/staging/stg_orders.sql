
SELECT 
    order_id, 
    user_id,
    amount,
    order_date
FROM
    {{ source('public', 'raw_orders')}}