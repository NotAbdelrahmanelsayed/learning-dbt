SELECT 
    name,
    user_id AS id,
    SPLIT_PART(email, '@', 2) AS email_provider
FROM 
    {{ source('public', 'raw_users')}}

WHERE 
    signup_date >= '2024-01-05'