# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/order_tags

view: order_tags {

  sql_table_name: shopify.order_tags ;;

  dimension: order_tag_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.order_tag_id ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

}
