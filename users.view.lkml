view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
    sql: ${TABLE}.created_at ;;
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

  dimension: irish_county {
    description: "Totally fake county data built from existing US State info. Built to answer https://community.looker.com/technical-tips-tricks-1021/how-to-create-a-topojson-file-for-use-in-a-custom-map-layer-26084?postid=47181#post47181"
    type: string
    sql: CASE
   WHEN ${state}='Alabama' THEN 'Carlow'
WHEN ${state}='Alaska' THEN 'Cavan'
WHEN ${state}='Arizona' THEN 'Clare'
WHEN ${state}='Arkansas' THEN 'Cork'
WHEN ${state}='California' THEN 'Dublin'
WHEN ${state}='Colorado' THEN 'Donegal'
WHEN ${state}='Connecticut' THEN 'Galway'
WHEN ${state}='Delaware' THEN 'Kerry'
WHEN ${state}='Florida' THEN 'Kildare'
WHEN ${state}='Georgia' THEN 'Kilkenny'
WHEN ${state}='Idaho' THEN 'Laoighis'
WHEN ${state}='Illinois' THEN 'Leitrim'
WHEN ${state}='Indiana' THEN 'Limerick'
WHEN ${state}='Iowa' THEN 'Longford'
WHEN ${state}='Kansas' THEN 'Louth'
WHEN ${state}='Kentucky' THEN 'Mayo'
WHEN ${state}='Louisiana' THEN 'Meath'
WHEN ${state}='Maine' THEN 'Monaghan'
WHEN ${state}='Maryland' THEN 'Offaly'
WHEN ${state}='Massachusetts' THEN 'Roscommon'
WHEN ${state}='Michigan' THEN 'Sligo'
WHEN ${state}='Minnesota' THEN 'Tipperary'
WHEN ${state}='Mississippi' THEN 'Waterford'
WHEN ${state}='Missouri' THEN 'Westmeath'
WHEN ${state}='Montana' THEN 'Wexford'
WHEN ${state}='Nebraska' THEN ''
WHEN ${state}='Nevada' THEN ''
WHEN ${state}='New Hampshire' THEN ''
WHEN ${state}='New Jersey' THEN ''
WHEN ${state}='New Mexico' THEN ''
WHEN ${state}='New York' THEN 'Wicklow'
WHEN ${state}='North Carolina' THEN ''
WHEN ${state}='North Dakota' THEN ''
WHEN ${state}='Ohio' THEN ''
WHEN ${state}='Oklahoma' THEN ''
WHEN ${state}='Oregon' THEN ''
WHEN ${state}='Pennsylvania' THEN ''
WHEN ${state}='Rhode Island' THEN ''
WHEN ${state}='South Carolina' THEN ''
WHEN ${state}='South Dakota' THEN ''
WHEN ${state}='Tennessee' THEN ''
WHEN ${state}='Texas' THEN ''
WHEN ${state}='Utah' THEN ''
WHEN ${state}='Vermont' THEN ''
WHEN ${state}='Virginia' THEN ''
WHEN ${state}='Washington' THEN ''
WHEN ${state}='West Virginia' THEN ''
WHEN ${state}='Wisconsin' THEN ''
WHEN ${state}='Wyoming' THEN ''
    ELSE NULL
    END;;
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
}
