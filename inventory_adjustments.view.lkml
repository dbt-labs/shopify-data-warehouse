# This explore allows you to view your inventory flow and net changes over time

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

  dimension_group: inventory {
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
    hidden: yes
  }

  dimension: quantity_delta {
    type: number
    sql: ${TABLE}.quantity_delta ;;
    hidden: yes
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  # Measures -------------------------------------------------------------------

  measure: inventory_outflow {
    type: sum
    sql: ${quantity_delta};;
    value_format_name: decimal_0
    filters: {
      field: quantity_delta
      value: "<0"
    }
  }

  measure: inventory_inflow {
    type: sum
    sql: ${quantity_delta};;
    value_format_name: decimal_0
    filters: {
      field: quantity_delta
      value: ">0"
    }
  }

  measure: net_inventory_change {
    type: sum
    sql: ${quantity_delta};;
    value_format_name: decimal_0
  }


}
