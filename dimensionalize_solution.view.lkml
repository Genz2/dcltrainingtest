view: dimensionalize_solution {
  derived_table: {
    sql: SELECT
        users.city  AS "users.city",
        COUNT(DISTINCT orders.id ) AS "orders.count"
      FROM public.order_items  AS order_items
      LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN public.users  AS users ON orders.user_id = users.id

      GROUP BY 1
      ORDER BY 2 DESC
       ;;
  }

  measure: city_count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_city {
    type: string
    primary_key: yes
    sql: ${TABLE}."users.city" ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}."orders.count" ;;
  }

  measure: average_count {
    type: average
    sql: ${orders_count} ;;
  }

  set: detail {
    fields: [users_city, orders_count]
  }
}
