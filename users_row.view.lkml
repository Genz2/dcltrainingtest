view: users_row {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_number {
    # used a window function to give each customer a number based on their signup date. (Eg our first ever customer gets the number 1.) I could get it to work in SQL but this is erroring so far in Looker.
    # https://dcltraining.dev.looker.com/sql/9zd5rjjj7cxkbn
    type: number
    sql: ROW_NUMBER() OVER (ORDER by created_at)  ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    sql: order by(${TABLE}.created_at) ;;

  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: number
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, orders.count]
  }

  # measure: row_number_measure {
  #   type: number
  #   sql: ROW_NUMBER() OVER ( ORDER BY created_at)  ;;
  # }
}
