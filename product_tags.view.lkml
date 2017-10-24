# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/product_tags

view: product_tags {

  sql_table_name: shopify.product_tags ;;

  dimension: product_tag_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.product_tag_id ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
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
