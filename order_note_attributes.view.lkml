view: order_note_attributes {

  sql_table_name: shopify.order_note_attributes ;;

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
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
