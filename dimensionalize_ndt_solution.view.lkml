# If necessary, uncomment the line below to include explore_source.
# include: "dcl_training.model.lkml"

view: dimensionalize_ndt_solution {
  derived_table: {
    explore_source: order_items {
      column: count { field: orders.count }
      column: city { field: users.city }
    }
  }
  dimension: count {
    type: number
  }
  dimension: city {}

  measure: average_count_per_city {
    type: average
    sql: ${count} ;;
  }

}
