# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/customers

view: customers {

  sql_table_name: shopify.customers ;;

  # IDs -------------------------------------------------------------------

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
    hidden: yes
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  # Demographic -------------------------------------------------------------------

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates -------------------------------------------------------------------

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

  dimension: customer_first_order_month {
    label: "Customer Lifetime Month"
    type: date
    sql: date_trunc('month', ${first_order_raw}) ;;
    hidden: yes
  }

  dimension: customer_first_order_quarter {
    label: "Customer Lifetime Quarter"
    type: date
    sql: date_trunc('quarter', ${first_order_raw}) ;;
    hidden: yes
  }

  dimension_group: first_order {
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
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: last_order {
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
    sql: ${TABLE}.last_order_date ;;
  }

  # Marketing -------------------------------------------------------------------

  dimension: verified_email {
    type: yesno
    sql: ${TABLE}.verified_email ;;
  }

  dimension: accepts_marketing {
    type: yesno
    sql: ${TABLE}.accepts_marketing ;;
  }


  # Segmentation -------------------------------------------------------------------

  dimension: dormant {
    type: yesno
    sql: ${TABLE}.dormant ;;
    group_label: "Tags"
  }

  dimension: at_risk {
    type: yesno
    sql: ${TABLE}.at_risk ;;
    group_label: "Tags"
  }

  dimension: loyal {
    type: yesno
    sql: ${TABLE}.loyal ;;
    group_label: "Tags"
  }

  dimension: new {
    type: yesno
    sql: ${TABLE}."new" ;;
    group_label: "Tags"
  }

  dimension: promising {
    type: yesno
    sql: ${TABLE}.promising ;;
    group_label: "Tags"
  }

  dimension: returning {
    type: yesno
    sql: ${TABLE}.returning ;;
    group_label: "Tags"
  }

  # Predictions -------------------------------------------------------------------

  dimension: expected_purchase_value_in_next_30_days_amt {
    type: number
    sql: ${TABLE}.expected_purchase_value_in_next_30_days ;;
    value_format_name: local_currency
    hidden: yes
  }

  dimension: predicted_average_number_of_days_between_orders_amt {
    type: number
    sql: ${TABLE}.predicted_average_number_of_days_between_orders ;;
    hidden: yes
  }

  dimension: probability_of_returning_amt {
    type: number
    sql: ${TABLE}.probability_of_returning ;;
    hidden: yes
  }

  # Measures -------------------------------------------------------------------

  measure: count {
    type: count
    drill_fields: [customer_details*]
  }

  measure: total_expected_purchase_value_in_next_30_days {
    type: sum
    sql: ${expected_purchase_value_in_next_30_days_amt} ;;
    value_format_name: usd
  }

  measure: average_expected_purchase_value_in_next_30_days {
    type: average
    sql: ${expected_purchase_value_in_next_30_days_amt} ;;
    value_format_name: usd
  }

  measure: probability_of_returning {
    type: average
    sql: ${probability_of_returning_amt} ;;
    value_format_name: percent_1
  }

  measure: predicted_average_number_of_days_between_orders {
    type: average
    sql: ${predicted_average_number_of_days_between_orders_amt} ;;
    value_format_name: decimal_1
  }

  measure: percent_repeat_customers {
    type: average
    sql: case when ${returning} = true then 1::float else 0::float end ;;
    value_format_name: percent_1
  }

  # Sets -------------------------------------------------------------------

  set: customer_details {
    fields: [
      first_name,
      last_name,
      email,
      country,
      created_date,
      last_order_date
    ]
  }

}
