{{
  config(
    materialized='view'
  )
}}
with 

src_base_orders as (

    select * from {{ source('sql_server_dbo', 'orders') }}

),

renamed_casted as (

    select
        order_id,
        shipping_service,
        shipping_cost,
        address_id,
        created_at,
        promo_id,
        estimated_delivery_at,
        order_cost,
        user_id,
        order_total,
        delivered_at,
        tracking_id,
        status,
        vendedores_id,
        _fivetran_deleted,
        _fivetran_synced

    from src_base_orders

)

select * from renamed_casted
