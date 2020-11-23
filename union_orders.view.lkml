view: union_orders {
  derived_table: {
    sql: WITH orders_derived AS (SELECT
      users.city  AS "city",
      COUNT(DISTINCT orders.id ) AS "count"
    FROM public.order_items  AS order_items
    LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
    LEFT JOIN public.users  AS users ON orders.user_id = users.id
    GROUP BY 1
    ORDER BY 2 DESC
      )
SELECT
  inventory_items.cost  AS "inventory_items.cost",
  TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at ))), 'YYYY-MM') AS "inventory_items.sold_quarter",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.sold_time",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.created_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.created_time",
  products.department  AS "products.department",
  products.department  AS "products.department_6",
  COUNT(DISTINCT inventory_items.id ) AS "inventory_items.count",
  COALESCE(SUM(CASE
        WHEN 1=1 -- no filter on 'order_items.category_count_picker'

        THEN 1
        ELSE 0
      END
    ), 0) AS "order_items.category_count",
  CASE
        WHEN 'count' = 'count' THEN
          (COUNT(DISTINCT orders.id ))
        WHEN 'count' = 'count_organic_users' THEN
          (COUNT(DISTINCT CASE WHEN (orders.traffic_source = 'Organic') THEN orders.user_id  ELSE NULL END))
        WHEN 'count' = 'count_email_users' THEN
          (COUNT(DISTINCT CASE WHEN (orders.traffic_source = 'Email') THEN orders.user_id  ELSE NULL END))
        ELSE
          NULL
      END  AS "orders.dynamic_metric"
FROM public.order_items  AS order_items
LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
LEFT JOIN public.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
LEFT JOIN public.users  AS users ON orders.user_id = users.id
LEFT JOIN orders_derived ON orders_derived.city = users.city
LEFT JOIN public.products  AS products ON inventory_items.product_id = products.id

GROUP BY 1,2,3,4,5,6

UNION


SELECT
  inventory_items.cost  AS "inventory_items.cost",
  TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at ))), 'YYYY-MM') AS "inventory_items.sold_quarter",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.sold_time",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.created_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.created_time",
  products.department  AS "products.department",
  products.department  AS "products.department_6",
  COUNT(DISTINCT inventory_items.id ) AS "inventory_items.count",
  COALESCE(SUM(CASE
        WHEN 1=1 -- no filter on 'order_items.category_count_picker'

        THEN 1
        ELSE 0
      END
    ), 0) AS "order_items.category_count",
  CASE
        WHEN 'count' = 'count' THEN
          (COUNT(DISTINCT orders.id ))
        WHEN 'count' = 'count_organic_users' THEN
          (COUNT(DISTINCT CASE WHEN (orders.traffic_source = 'Organic') THEN orders.user_id  ELSE NULL END))
        WHEN 'count' = 'count_email_users' THEN
          (COUNT(DISTINCT CASE WHEN (orders.traffic_source = 'Email') THEN orders.user_id  ELSE NULL END))
        ELSE
          NULL
      END  AS "orders.dynamic_metric"
FROM public.order_items  AS order_items
LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
LEFT JOIN public.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
LEFT JOIN public.users  AS users ON orders.user_id = users.id
LEFT JOIN public.products  AS products ON inventory_items.product_id = products.id

GROUP BY 1,2,3,4,5,6


UNION

SELECT


  TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at ))), 'YYYY-MM') AS "inventory_items.sold_quarter",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.sold_time",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.created_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.created_time",

  products.department  AS "products.department",
  products.department  AS "products.department_6",
  COUNT( distinct order_items.id ),
  COALESCE(SUM(CASE
        WHEN 1=1 -- no filter on 'order_items.category_count_picker'

        THEN 1
        ELSE 0
      END
    ), 0) AS "order_items.category_count",
  CASE
        WHEN 'count' = 'count' THEN
          (COUNT(DISTINCT orders.id ))
        WHEN 'count' = 'count_organic_users' THEN
          (COUNT(DISTINCT CASE WHEN (orders.traffic_source = 'Organic') THEN orders.user_id  ELSE NULL END))
        WHEN 'count' = 'count_email_users' THEN
          (COUNT(DISTINCT CASE WHEN (orders.traffic_source = 'Email') THEN orders.user_id  ELSE NULL END))
        ELSE
          NULL
      END  AS "orders.dynamic_metric"
FROM public.order_items  AS order_items
LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
LEFT JOIN public.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
LEFT JOIN public.users  AS users ON orders.user_id = users.id
LEFT JOIN public.products  AS products ON inventory_items.product_id = products.id

GROUP BY 1,2,3,4,5,6,7,8



UNION

SELECT
  inventory_items.cost  AS "inventory_items.cost",
  TO_CHAR(DATE_TRUNC('month', DATE_TRUNC('quarter', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at ))), 'YYYY-MM') AS "inventory_items.sold_quarter",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.sold_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.sold_time",
  TO_CHAR(DATE_TRUNC('second', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', inventory_items.created_at )), 'YYYY-MM-DD HH24:MI:SS') AS "inventory_items.created_time",
  products.department  AS "products.department",
  products.department  AS "products.department_6",
  COUNT(DISTINCT inventory_items.id ) AS "inventory_items.count",
  COALESCE(SUM(CASE
        WHEN 1=1 -- no filter on 'order_items.category_count_picker'

        THEN 1
        ELSE 0
      END
    ), 0) AS "order_items.category_count",
  CASE
        WHEN 'count' = 'count' THEN
          (COUNT(DISTINCT orders.id ))
        WHEN 'count' = 'count_organic_users' THEN
          (COUNT(DISTINCT  orders.user_id  )) ELSE
          NULL
      END  AS "orders.dynamic_metric"
FROM public.order_items  AS order_items
LEFT JOIN public.orders  AS orders ON order_items.order_id = orders.id
LEFT JOIN public.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
LEFT JOIN public.users  AS users ON orders.user_id = users.id
LEFT JOIN public.products  AS products ON inventory_items.product_id = products.id

GROUP BY 1,2,3,4,5,6,7,8




      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: category_count {
    type: number
    sql: ${TABLE}.category_count ;;
  }

  dimension_group: department {
    sql: ${TABLE}.department ;;
  }

  measure: dynamic_metric {
    type: sum
    sql: ${TABLE}.dynamic_metric  ;;
  }
}
