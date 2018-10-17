view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

 dimension: is_cheap_item {
   type: yesno
   sql: ${sale_price}<3 ;;
 }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  filter: category_count_picker {
    description: "Use with the Category Count measure"
    type: string
    suggest_dimension: products.category
  }

  measure: category_count {
    description: "Use with the Category Count Picker filter-only field"
    type: sum
    sql:
      CASE
        WHEN {% condition category_count_picker %} ${products.category} {% endcondition %}
        THEN 1
        ELSE 0
      END
    ;;
  }

}
