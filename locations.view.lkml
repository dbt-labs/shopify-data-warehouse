view: locations {
  sql_table_name: shopify.locations ;;

  dimension: location_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  measure: count {
    type: count
    drill_fields: [location_id, name, shops.name, shops.shop_id, orders.count]
  }
}
