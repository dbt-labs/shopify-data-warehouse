# Docs here:

view: line_item_properties {

  sql_table_name: shopify.line_item_properties ;;

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: line_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

}
