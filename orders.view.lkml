# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/orders

view: orders {
  derived_table: {
    sql:
    select
        *,
        row_number() over (partition by customer_id order by processed_at) as order_index
      from shopify.orders

    ;;
  }

  # IDs -------------------------------------------------------------------

  dimension: order_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.order_id ;;
    group_label: "IDs"
  }

  dimension: billing_address_id {
    type: number
    hidden: yes
    sql: ${TABLE}.billing_address_id ;;
    group_label: "IDs"
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
    group_label: "IDs"
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    group_label: "IDs"
  }

  dimension: shipping_address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.shipping_address_id ;;
    group_label: "IDs"
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
    group_label: "IDs"
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
    group_label: "IDs"
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
    group_label: "Dates"
  }

  dimension_group: canceled {
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
    sql: ${TABLE}.canceled_at ;;
    group_label: "Dates"
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
    group_label: "Dates"
  }

  dimension_group: cohort {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.cohort ;;
    group_label: "Dates"
  }

  # Money -------------------------------------------------------------------

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
    group_label: "Money"
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
    value_format_name: local_currency
    group_label: "Money"
  }

  dimension: total_price_fx {
    type: number
    sql: ${TABLE}.total_price_fx ;;
    value_format_name: usd
    group_label: "Money"
  }

  # Status -------------------------------------------------------------------

  dimension: financial_status {
    type: string
    sql: ${TABLE}.financial_status ;;
    group_label: "Status"
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.fulfillment_status ;;
    group_label: "Status"
  }

  # Other -------------------------------------------------------------------

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    group_label: "Other"
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}.test ;;
    group_label: "Other"
  }

  dimension: order_index {
    type: number
    sql: ${TABLE}.order_index ;;
    value_format_name: decimal_0
    group_label: "Other"
  }

  dimension: new_vs_repeat {
    type: string
    sql: case when ${order_index} = 1 then 'new' else 'repeat' end ;;
    group_label: "Other"
  }

  # Measures -------------------------------------------------------------------

  measure: count {
    type: count
  }

  measure: count_customers {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
  }

  measure: avg_order_value {
    type: average
    sql: ${TABLE}.total_price_fx ;;
    value_format_name: usd
  }

  measure: order_value {
    type: sum
    sql: ${TABLE}.total_price_fx ;;
    value_format_name: usd
  }

}
