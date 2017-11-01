# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/users

view: users {

  sql_table_name: shopify.users ;;

  dimension: user_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: full_name {
    type: string
    sql: ${first_name} || ' ' || ${last_name} ;;
  }

}
