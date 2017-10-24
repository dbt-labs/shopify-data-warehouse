# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/locations

view: locations {

  sql_table_name: shopify.locations ;;

  dimension: location_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.location_id ;;
    hidden: yes
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

}
