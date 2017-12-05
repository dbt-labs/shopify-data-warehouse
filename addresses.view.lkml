# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/addresses

view: addresses {

  sql_table_name: shopify.addresses ;;

  # IDs -------------------------------------------------------------------

  dimension: address_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.address_id ;;
    hidden: yes
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  # Who -------------------------------------------------------------------

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }


  # Address -------------------------------------------------------------------

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

}
