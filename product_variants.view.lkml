# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/product_variants

view: product_variants {

  sql_table_name: shopify.product_variants ;;

   # IDs -------------------------------------------------------------------

  dimension: product_variant_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_variant_id ;;
    hidden: yes
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

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  # Other -------------------------------------------------------------------

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: local_currency
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: grams {
    type: number
    sql: ${TABLE}.grams ;;
  }

  # Measures -------------------------------------------------------------------


}
