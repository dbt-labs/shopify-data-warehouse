view: order_tags {
  sql_table_name: shopify.order_tags ;;

  dimension: order_tag_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_tag_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [order_tag_id, shops.name, shops.shop_id, orders.name, orders.order_id]
  }
}
