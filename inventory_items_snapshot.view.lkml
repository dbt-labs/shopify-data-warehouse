view: inventory_items_snapshot {
  sql_table_name: shopify.inventory_items_snapshot ;;

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

  dimension: quantity_end_of_day {
    type: number
    sql: ${TABLE}.quantity_end_of_day ;;
  }

  dimension: quantity_start_of_day {
    type: number
    sql: ${TABLE}.quantity_start_of_day ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension_group: snapshot {
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
    sql: ${TABLE}.snapshot_date ;;
  }

  measure: count {
    type: count
    drill_fields: [shops.name, shops.shop_id, product_variants.product_variant_id, products.product_id]
  }
}
