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
    value_format_name: local_currency
  }

  dimension: discounts_fx {
    type: number
    sql: ${TABLE}.discounts_fx ;;
    value_format_name: usd
  }

  dimension: gift_card_discounts {
    type: number
    sql: ${TABLE}.gift_card_discounts ;;
    value_format_name: local_currency
  }

  dimension: gift_card_discounts_fx {
    type: number
    sql: ${TABLE}.gift_card_discounts_fx ;;
    value_format_name: usd
  }

  dimension: gift_card_gross_sales {
    type: number
    sql: ${TABLE}.gift_card_gross_sales ;;
    value_format_name: local_currency
  }

  dimension: gift_card_gross_sales_fx {
    type: number
    sql: ${TABLE}.gift_card_gross_sales_fx ;;
    value_format_name: usd
  }

  dimension: gift_cards_issued {
    type: number
    sql: ${TABLE}.gift_cards_issued ;;
    value_format_name: local_currency
  }

  dimension: gift_cards_issued_fx {
    type: number
    sql: ${TABLE}.gift_cards_issued_fx ;;
    value_format_name: usd
  }

  dimension: gross_sales {
    type: number
    sql: ${TABLE}.gross_sales ;;
    value_format_name: local_currency
  }

  dimension: gross_sales_fx {
    type: number
    sql: ${TABLE}.gross_sales_fx ;;
    value_format_name: usd
  }

  dimension: net_sales {
    type: number
    sql: ${TABLE}.net_sales ;;
    value_format_name: local_currency
  }

  dimension: net_sales_fx {
    type: number
    sql: ${TABLE}.net_sales_fx ;;
    value_format_name: usd
  }

  dimension: returns {
    type: number
    sql: ${TABLE}.returns ;;
    value_format_name: local_currency
  }

  dimension: returns_fx {
    type: number
    sql: ${TABLE}.returns_fx ;;
    value_format_name: usd
  }

  dimension: taxes {
    type: number
    sql: ${TABLE}.taxes ;;
    value_format_name: local_currency
  }

  dimension: taxes_fx {
    type: number
    sql: ${TABLE}.taxes_fx ;;
    value_format_name: usd
  }

  dimension: shipping {
    type: number
    sql: ${TABLE}.shipping ;;
    value_format_name: local_currency
  }

  dimension: shipping_fx {
    type: number
    sql: ${TABLE}.shipping_fx ;;
    value_format_name: usd
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.total_sales ;;
    value_format_name: local_currency
  }

  dimension: total_sales_fx {
    type: number
    sql: ${TABLE}.total_sales_fx ;;
    value_format_name: usd
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

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}.test ;;
  }

}
