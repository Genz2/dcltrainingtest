view: orders_derived {
  derived_table: {
    sql:
    SELECT
      users.city  AS "city",
      COUNT(DISTINCT orders.id ) AS "count"
    FROM public.order_items  AS order_items
    LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
    LEFT JOIN public.users  AS users ON orders.user_id = users.id
    GROUP BY 1
    ORDER BY 2 DESC
      ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: orders_count {
    type: number
    sql: ${TABLE}.count ;;
  }
  measure: average_count {
    type: average
    sql: ${orders_count} ;;
  }
}
