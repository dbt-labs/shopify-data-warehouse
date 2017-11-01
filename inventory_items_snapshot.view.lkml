# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/inventory_items_snapshot

view: inventory_items_snapshot {

  derived_table: {
    sql:
      select
        md5(inventory_item_id::varchar || snapshot_date::date::varchar) as id,
        *
      from shopify.inventory_items_snapshot ;;
  }

  # IDs -------------------------------------------------------------------

  dimension: id {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.id ;;
    type: string
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
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

  # Dates -------------------------------------------------------------------

  dimension_group: snapshot {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.snapshot_date ;;
  }

  # Quantities -------------------------------------------------------------------

  dimension: quantity_end_of_day {
    type: number
    sql: ${TABLE}.quantity_end_of_day ;;
  }

  dimension: quantity_start_of_day {
    type: number
    sql: ${TABLE}.quantity_start_of_day ;;
  }

}
