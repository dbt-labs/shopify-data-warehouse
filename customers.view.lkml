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

  dimension: verified_email {
    type: yesno
    sql: ${TABLE}.verified_email ;;
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
    sql: ${TABLE}.province ;;
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

  dimension: accepts_marketing {
    type: yesno
    sql: ${TABLE}.accepts_marketing ;;
  }

  dimension: at_risk {
    type: yesno
    sql: ${TABLE}.at_risk ;;
  }


  # Segmentation -------------------------------------------------------------------

  dimension: dormant {
    type: yesno
    sql: ${TABLE}.dormant ;;
  }

  dimension: loyal {
    type: yesno
    sql: ${TABLE}.loyal ;;
  }

  dimension: new {
    type: yesno
    sql: ${TABLE}."new" ;;
  }

  dimension: promising {
    type: yesno
    sql: ${TABLE}.promising ;;
  }

  dimension: returning {
    type: yesno
    sql: ${TABLE}.returning ;;
  }

  # Predictions -------------------------------------------------------------------

  dimension: expected_purchase_value_in_next_30_days {
    type: number
    sql: ${TABLE}.expected_purchase_value_in_next_30_days ;;
  }

  dimension: predicted_average_number_of_days_between_orders {
    type: number
    sql: ${TABLE}.predicted_average_number_of_days_between_orders ;;
  }

  dimension: probability_of_returning {
    type: number
    sql: ${TABLE}.probability_of_returning ;;
  }

  # Measures -------------------------------------------------------------------

  measure: count {
    type: count
  }

}
