# Docs are here: https://help.shopify.com/api/data-warehouse/schema-reference/sales

view: sales {

  sql_table_name: shopify.sales ;;

  # IDs -------------------------------------------------------------------

  dimension: sale_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.sale_id ;;
  }

  dimension: api_client_id {
    type: number
    sql: ${TABLE}.api_client_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: billing_address_id {
    type: number
    sql: ${TABLE}.billing_address_id ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_variant_id {
    type: number
    sql: ${TABLE}.product_variant_id ;;
  }

  dimension: shipping_address_id {
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: shop_id {
    type: number
    sql: ${TABLE}.shop_id ;;
  }

  # Dates -------------------------------------------------------------------

  dimension_group: happened {
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
    sql: ${TABLE}.happened_at ;;
  }

  # Money -------------------------------------------------------------------

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: discounts {
    type: number
    sql: ${TABLE}.discounts ;;
  }

  dimension: discounts_fx {
    type: number
    sql: ${TABLE}.discounts_fx ;;
  }

  dimension: gift_card_discounts {
    type: number
    sql: ${TABLE}.gift_card_discounts ;;
  }

  dimension: gift_card_discounts_fx {
    type: number
    sql: ${TABLE}.gift_card_discounts_fx ;;
  }

  dimension: gift_card_gross_sales {
    type: number
    sql: ${TABLE}.gift_card_gross_sales ;;
  }

  dimension: gift_card_gross_sales_fx {
    type: number
    sql: ${TABLE}.gift_card_gross_sales_fx ;;
  }

  dimension: gift_cards_issued {
    type: number
    sql: ${TABLE}.gift_cards_issued ;;
  }

  dimension: gift_cards_issued_fx {
    type: number
    sql: ${TABLE}.gift_cards_issued_fx ;;
  }

  dimension: gross_sales {
    type: number
    sql: ${TABLE}.gross_sales ;;
  }

  dimension: gross_sales_fx {
    type: number
    sql: ${TABLE}.gross_sales_fx ;;
  }

  dimension: net_sales {
    type: number
    sql: ${TABLE}.net_sales ;;
  }

  dimension: net_sales_fx {
    type: number
    sql: ${TABLE}.net_sales_fx ;;
  }

  dimension: returns {
    type: number
    sql: ${TABLE}.returns ;;
  }

  dimension: returns_fx {
    type: number
    sql: ${TABLE}.returns_fx ;;
  }

  dimension: taxes {
    type: number
    sql: ${TABLE}.taxes ;;
  }

  dimension: taxes_fx {
    type: number
    sql: ${TABLE}.taxes_fx ;;
  }

  dimension: shipping {
    type: number
    sql: ${TABLE}.shipping ;;
  }

  dimension: shipping_fx {
    type: number
    sql: ${TABLE}.shipping_fx ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.total_sales ;;
  }

  dimension: total_sales_fx {
    type: number
    sql: ${TABLE}.total_sales_fx ;;
  }

  # Other -------------------------------------------------------------------

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }

  dimension: line_type {
    type: string
    sql: ${TABLE}.line_type ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}.test ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

}
