# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/line_items

view: line_items {

  sql_table_name: shopify.line_items ;;

  # IDs -------------------------------------------------------------------

  dimension: line_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.line_item_id ;;
    hidden: yes
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
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

  # Product -------------------------------------------------------------------

  dimension: name {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.product_title ;;
  }

  dimension: variant_title {
    type: string
    sql: ${TABLE}.product_variant_title ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  # Money -------------------------------------------------------------------

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: local_currency
  }

  dimension: taxable {
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  # Other -------------------------------------------------------------------

  dimension: grams {
    type: number
    sql: ${TABLE}.grams ;;
  }

  dimension: gift_card {
    type: yesno
    sql: ${TABLE}.gift_card ;;
  }


  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: requires_shipping {
    type: yesno
    sql: ${TABLE}.requires_shipping ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  # Fulfillment -------------------------------------------------------------------

  dimension: fulfillable_quantity {
    type: number
    sql: ${TABLE}.fulfillable_quantity ;;
  }

  dimension: fulfillment_service {
    type: string
    sql: ${TABLE}.fulfillment_service ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

}
