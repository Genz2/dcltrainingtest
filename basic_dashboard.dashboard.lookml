- dashboard: basic_dashboard
  title: Basic Dashboard
  layout: newspaper
  elements:
  - title: Top Categories
    name: Top Categories
    model: dcl_training
    explore: order_items
    type: looker_column
    fields:
    - products.category
    - order_items.count
    sorts:
    - order_items.count desc
    limit: 12
    column_limit: 50
    query_timezone: America/Los_Angeles
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Top Brands
    name: Top Brands
    model: dcl_training
    explore: order_items
    type: looker_column
    fields:
    - order_items.count
    - products.brand
    sorts:
    - order_items.count desc
    limit: 12
    column_limit: 50
    query_timezone: America/Los_Angeles
    series_types: {}
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Top States for Orders by Gender
    name: Top States for Orders by Gender
    model: dcl_training
    explore: order_items
    type: looker_column
    fields:
    - orders.count
    - users.gender
    - users.state
    pivots:
    - users.gender
    sorts:
    - orders.count desc 0
    - users.gender
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    series_types: {}
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
