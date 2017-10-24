view: line_items {
  sql_table_name: shopify.line_items ;;

  dimension: line_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: compare_at_price {
    type: number
    sql: ${TABLE}.compare_at_price ;;
  }

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

  dimension: gift_card {
    type: yesno
    sql: ${TABLE}.gift_card ;;
  }

  dimension: grams {
    type: number
    sql: ${TABLE}.grams ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
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

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: product_variant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_variant_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: requires_shipping {
    type: yesno
    sql: ${TABLE}.requires_shipping ;;
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

  dimension: taxable {
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: variant_title {
    type: string
    sql: ${TABLE}.variant_title ;;
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
      line_item_id,
      name,
      shops.name,
      shops.shop_id,
      product_variants.product_variant_id,
      products.product_id,
      orders.name,
      orders.order_id,
      line_item_properties.count
    ]
  }
}
