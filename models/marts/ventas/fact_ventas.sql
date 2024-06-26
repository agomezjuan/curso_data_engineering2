with 

src_users as (

    select * from {{ ref('stg_sql_server_dbo_orders') }}

),

renamed_casted as (
select distinct
        u.first_name,
        u.last_name,
        u.address_id as address_user,
        u.phone_number,
        u.email,
        u.total_orders,
        o.order_id,
        o.shipping_service_id,
        o.shipping_cost_euros,
        o.address_id as address_order,
        o.promo_id,
        o.user_id,
        o.tracking_id,
        o.status_orders_id,
        o.order_cost_euros,
        o.order_total_euros,
        o.created_at_fecha,
        o.created_at_hora,
        o.estimated_delivery_at_fecha,
        o.estimated_delivery_at_hora,
        o.delivered_at_fecha,
        o.delivered_at_hora,
        o.vendedores_id,
        t.order_cost_by_user,
        t.order_total_by_user,
        t.shipping_cost_by_user,
        t.total_orders_by_user,
        t.total_orders_by_zipcode,
        t.total_orders_by_state,
        t.tiempo_espera_pedido

from {{ ref('stg_sql_server_dbo_orders') }} o
left join {{ ref('int_users_orders_addresses') }} t
on o.user_id = t.user_id
left join {{ ref('stg_sql_server_dbo__users') }} u
on o.user_id = u.user_id
)
select * from renamed_casted