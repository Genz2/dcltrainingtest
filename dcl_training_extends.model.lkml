## This model file is used for the extends (DRY) course in SkillJar
## Please DO NOT CHANGE THE PRODUCTION VERSION of this file

connection: "thelook"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

map_layer: irish_counties {
  file: "ireland_counties.json"
  property_key: "NAME_1"
}

explore: users {
  join: orders {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: one_to_many
  }
}

## Create an explore called users_new for use in extending explores








## Create an explore named buyers_and_sellers for advanced explore extending
