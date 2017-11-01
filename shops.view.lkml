# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/shops

view: shops {

  sql_table_name: shopify.shops ;;

  dimension: shop_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: shop_name {
    type: string
    sql: ${TABLE}.name ;;
  }

}
