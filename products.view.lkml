view: products {
  sql_table_name: shopify.products ;;

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
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

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product_id,
      shops.name,
      shops.shop_id,
      inventory_adjustments.count,
      inventory_items_snapshot.count,
      line_items.count,
      product_tags.count,
      product_variants.count
    ]
  }
}
