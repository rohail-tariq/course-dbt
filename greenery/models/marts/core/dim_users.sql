{{
  config(
    materialized='table'
  )
}}

SELECT 
user_id, 
concat(su.last_name, ', ', su.first_name) as FULL_NAME,
su.EMAIL, 
su.PHONE_NUMBER, 
a.ADDRESS,
a.zip_code,
a.STATE,
a.COUNTRY,
su.CREATED_AT, 
su.UPDATED_AT 
FROM {{ ref('stg_postgres_users') }}  su
left join {{ ref('stg_postgres_addresses') }} a on a.address_guid = su.address_id