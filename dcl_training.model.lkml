connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"



explore: inventory_items {
  hidden: yes
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

# Option 1: Simple explore on just orders_derived.
explore: orders_derived {
  hidden: yes
}

# Option 2: Join in orders_derived back into the order_items explore.
# Note that we join on the only shared dimension we have, namely Users City
explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: orders_derived {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders_derived.city} = ${users.city} ;;
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  hidden: yes
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: product_facts {
  hidden: yes
  join: products {
    type: left_outer
    sql_on: ${product_facts.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  hidden: yes
}

explore: users {
  hidden:  yes
}

explore: dimensionalize_solution { hidden: yes}
explore: dimensionalize_ndt_solution {hidden: yes}

explore: union_orders {hidden: yes} #errors here are intentional
