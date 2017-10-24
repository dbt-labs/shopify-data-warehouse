view: inventory_adjustments {
  sql_table_name: shopify.inventory_adjustments ;;

  dimension: inventory_adjustment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.inventory_adjustment_id ;;
  }

  dimension: api_client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.api_client_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_variant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_variant_id ;;
  }

  dimension: quantity_after_adjustment {
    type: number
    sql: ${TABLE}.quantity_after_adjustment ;;
  }

  dimension: quantity_delta {
    type: number
    sql: ${TABLE}.quantity_delta ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      inventory_adjustment_id,
      users.last_name,
      users.first_name,
      users.user_id,
      shops.name,
      shops.shop_id,
      product_variants.product_variant_id,
      products.product_id,
      api_clients.api_client_id
    ]
  }
}
