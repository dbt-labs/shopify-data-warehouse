# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/customer_tags

view: customer_tags {

  sql_table_name: shopify.customer_tags ;;

  dimension: customer_tag_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_tag_id ;;
    hidden: yes
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
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
