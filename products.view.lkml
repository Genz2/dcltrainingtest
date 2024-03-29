view: products {
  sql_table_name: public.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }


  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }


  # HTML Tests
  dimension: department_1 {
    type: string
    label: "Paragraph"
    group_label: "HTML Tests"
    sql: ${TABLE}.department ;;
    html: <p style="color:gray;
              text-align:center;
              background-color: powderblue;
              font-family:arial;
              font-size:120%">
              This is a paragraph! </p>;;
  }
  dimension: department_2 {
    type: string
    label: "Unordered List"
    group_label: "HTML Tests"
    sql: ${TABLE}.department ;;
    html: <ul>
          <li> list_item_1 </li> <li> list_item_2 </li> </ul>;;
  }
  dimension: department_3 {
    type: string
    label: "Ordered List"
    group_label: "HTML Tests"
    sql: ${TABLE}.department ;;
    html: <ol>
      <li> list_item_1 </li> <li> list_item_2 </li> </ol>;;
  }
  dimension: department_4 {
    type: string
    label: "Anchor"
    group_label: "HTML Tests"
    sql: ${TABLE}.department ;;
    html: <a href="https://google.com">
          Click this link to go to Google!</a>;;
  }
  dimension: department_5 {
    type: string
    label: "Image"
    group_label: "HTML Tests"
    sql: ${TABLE}.department ;;
    html: <img src="https://gfnc1kn6pi-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/goldie.jpg" alt="Golden Retriever puppy" style="width:100%">;;
  }

  dimension: department_6 {
    type: string
    label: "Paragraph with Value"
    group_label: "HTML Tests"
    sql: ${TABLE}.department ;;
    html: <p style="color:gray;
              text-align:center;
              background-color: powderblue;
              font-family:arial;
              font-size:120%">
              This is a paragraph that also shows the department name: {{value}} </p>;;
  }

  dimension: linked_brand {
    type: string
    group_label: "HTML Tests"
    link: {
      label: "Google search"
      url: "https://www.google.com/search?q={{value}}"
    }
    sql: ${brand} ;;
  }

  dimension: new_linked_brand {
    type: string
    sql: ${brand} ;;
    html: <a href="https://www.google.com/search?q={{ rendered_value }}">{{ value }}</a>  ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count, product_facts.count]
  }

  measure: count_conditional {
    type: count
    html: <p style=
    {% if orders.status._value == "complete" %}
    "color:green"</p>
    {% else %}
    "color:blue"</p>
    {% endif %}
    ;;
  }

  measure: count_conditional_correct {
    type: count
    html:
          {% if orders.status._value == "complete" %}
          <p style= "color:green">{{ rendered_value }}</p>
          {% else %}
           <p style="color:blue">{{ rendered_value }}</p>
          {% endif %}
          ;;
  }
}
