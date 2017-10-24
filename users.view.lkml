view: users {
  sql_table_name: shopify.users ;;

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      user_id,
      last_name,
      first_name,
      shops.name,
      shops.shop_id,
      inventory_adjustments.count,
      orders.count
    ]
  }
}
