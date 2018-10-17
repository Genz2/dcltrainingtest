view: orders {
  sql_table_name: public.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
  }
  measure: count_organic_users {
    type: count_distinct
    sql:  ${user_id} ;;
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
    filters: {
      field: traffic_source
      value: "Organic"
    }
  }
  measure: percent_organic_users {
    type: number
    sql: ${count_organic_users}/${count} ;;
  }

  parameter: metric_selector {
    type: string
    allowed_value: {
      label: "Count"
      value: "count"
    }
    allowed_value: {
      label: "Count Organic Users"
      value: "count_organic_users"
    }
    allowed_value: {
      label: "Returning Shopper Revenue"
      value: "percent_organic_users"
    }
  }

  measure: dynamic_metric {
    label_from_parameter: metric_selector
    type: number
    sql:
      CASE
        WHEN {% parameter metric_selector %} = 'count' THEN
          ${count}
        WHEN {% parameter metric_selector %} = 'count_organic_users' THEN
          ${count_organic_users}
        WHEN {% parameter metric_selector %} = 'percent_organic_users' THEN
          ${percent_organic_users}
        ELSE
          NULL
      END ;;
    }

}
