{{
  config(
    materialized='view'
  )
}}
with 

src_orders as (

    select * from {{ ref('stg_sql_server_dbo__orders') }}

),

renamed_casted as (

    select 
        tracking_id,
        shipping_service_id,
        shipping_service,
        estimated_delivery_at_UTC,
        delivered_at_UTC
    from src_orders
)

select * from renamed_casted