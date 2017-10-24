# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/inventory_adjustments

view: inventory_adjustments {

  sql_table_name: shopify.inventory_adjustments ;;

  # IDs -------------------------------------------------------------------

  dimension: inventory_adjustment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.inventory_adjustment_id ;;
    hidden: yes
  }

  dimension: api_client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.api_client_id ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
    hidden: yes
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_variant_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_variant_id ;;
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  # Dates -------------------------------------------------------------------

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

  # Other -------------------------------------------------------------------

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

  # Measures -------------------------------------------------------------------



}
