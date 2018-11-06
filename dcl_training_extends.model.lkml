connection: "thelook"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: users {
  join: orders {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: one_to_many
  }
}

# create an explore called user_explore_extended
# This new explore should be done in three lines
#
# explore: users_extended {
#   extends: [users]
# }
