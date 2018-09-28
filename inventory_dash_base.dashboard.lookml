- dashboard: inventory_dash_base
  title: Inventory Dash
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
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
    row: 0
    col: 0
    width: 8
    height: 6
