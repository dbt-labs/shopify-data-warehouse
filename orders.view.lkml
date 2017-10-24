# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/orders

view: orders {
  sql_table_name: shopify.orders ;;

  # IDs -------------------------------------------------------------------

  dimension: order_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: api_client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.api_client_id ;;
  }

  dimension: billing_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billing_address_id ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: shipping_address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  # Dates -------------------------------------------------------------------

  dimension_group: processed {
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
    sql: ${TABLE}.processed_at ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
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

  # Money -------------------------------------------------------------------

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_price_fx {
    type: number
    sql: ${TABLE}.total_price_fx ;;
  }

  # Status -------------------------------------------------------------------

  dimension: financial_status {
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  # Other -------------------------------------------------------------------

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}.test ;;
  }

  # Measures -------------------------------------------------------------------

  measure: count {
    type: count
  }

}
