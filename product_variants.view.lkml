view: product_variants {
  sql_table_name: shopify.product_variants ;;

  dimension: product_variant_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_variant_id ;;
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

  dimension: grams {
    type: number
    sql: ${TABLE}.grams ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product_variant_id,
      shops.name,
      shops.shop_id,
      products.product_id,
      inventory_adjustments.count,
      inventory_items_snapshot.count,
      line_items.count
    ]
  }
}
