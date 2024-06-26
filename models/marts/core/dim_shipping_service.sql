with 

src_orders as (

    select * from {{ ref('stg_sql_server_dbo__shipping_service') }}

),

renamed_casted as (

    select distinct
        shipping_service_id,
        shipping_service
    from src_orders
)

select * from renamed_casted