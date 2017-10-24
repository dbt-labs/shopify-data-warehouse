# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/api_clients

view: api_clients {

  sql_table_name: shopify.api_clients ;;

  dimension: api_client_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.api_client_id ;;
    hidden: yes
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

}
