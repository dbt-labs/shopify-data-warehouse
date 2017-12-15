view: order_attribution_interactions {
  derived_table: {
    sql:

      with attribution as (

          select * from shopify.order_attribution_interactions

      ),

      windowed as (

          select

              attribution.*,

              count(*) over (
                  partition by order_id
                  ) as order_total_interactions,

              row_number() over (
                  partition by order_id
                  order by interaction_started_at
                  ) as order_interaction_number

          from attribution

      ),

      attributed as (

          select

              *,

              case
                  when order_total_interactions = 1 then 1.0
                  when order_total_interactions = 2 then 0.5
                  when order_interaction_number = 1 then 0.4
                  when order_interaction_number = order_total_interactions then 0.4
                  else 0.2 / (order_total_interactions - 2)
              end as forty_twenty_forty_attribution_points,

              case
                  when order_interaction_number = 1 then 1.0
                  else 0.0
              end as first_click_attribution_points,

              case
                  when order_interaction_number = order_total_interactions then 1.0
                  else 0.0
              end as last_click_attribution_points,

              1.0 / order_total_interactions as linear_attribution_points

          from windowed

      )


      select * from attributed
    ;;
  }

  # IDs -------------------------------------------------------------------

  dimension: order_attribution_interaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_attribution_interaction_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: shop_id {
    type: number
    sql: ${TABLE}.shop_id ;;
  }

  # Dates -------------------------------------------------------------------

  dimension_group: interaction_started {
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
    sql: ${TABLE}.interaction_started_at ;;
  }

  # Other -------------------------------------------------------------------

  dimension: is_first {
    type: yesno
    sql: ${TABLE}.is_first ;;
  }

  dimension: is_last {
    type: yesno
    sql: ${TABLE}.is_last ;;
  }

  dimension: landing_page_path {
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }

  dimension: landing_page_url {
    type: string
    sql: ${TABLE}.landing_page_url ;;
  }

  # Referrer -------------------------------------------------------------------

  dimension: referrer_domain {
    type: string
    sql: ${TABLE}.referrer_domain ;;
    group_label: "Referrer"
  }

  dimension: referrer_host {
    type: string
    sql: ${TABLE}.referrer_host ;;
    group_label: "Referrer"
  }

  dimension: referrer_path {
    type: string
    sql: ${TABLE}.referrer_path ;;
    group_label: "Referrer"
  }

  dimension: referrer_subdomain {
    type: string
    sql: ${TABLE}.referrer_subdomain ;;
    group_label: "Referrer"
  }

  dimension: referrer_tld {
    type: string
    sql: ${TABLE}.referrer_tld ;;
    group_label: "Referrer"
  }

  dimension: referrer_url {
    type: string
    sql: ${TABLE}.referrer_url ;;
    group_label: "Referrer"
  }

  # UTM Parameters -------------------------------------------------------------------

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
    group_label: "UTM"
  }

  dimension: utm_campaign_content {
    type: string
    sql: ${TABLE}.utm_campaign_content ;;
    group_label: "UTM"
  }

  dimension: utm_campaign_medium {
    type: string
    sql: ${TABLE}.utm_campaign_medium ;;
    group_label: "UTM"
  }

  dimension: utm_campaign_source {
    type: string
    sql: ${TABLE}.utm_campaign_source ;;
    group_label: "UTM"
  }

  dimension: utm_campaign_term {
    type: string
    sql: ${TABLE}.utm_campaign_term ;;
    group_label: "UTM"
  }

  # Attribution -------------------------------------------------------------------

  dimension: multi_touch_attribution_points {
    type: number
    sql: ${TABLE}.forty_twenty_forty_attribution_points ;;
  }

  dimension: first_click_attribution_points {
    type: number
    sql: ${TABLE}.first_click_attribution_points ;;
  }

  dimension: last_click_attribution_points {
    type: number
    sql: ${TABLE}.last_click_attribution_points ;;
  }

  dimension: linear_attribution_points {
    type: number
    sql: ${TABLE}.linear_attribution_points ;;
  }

  # Measures -------------------------------------------------------------------

  measure: count {
    type: count
  }

  measure: first_click_orders {
    type: sum
    sql: ${first_click_attribution_points} ;;
    value_format_name: decimal_1
  }

  measure: last_click_orders {
    type: sum
    sql: ${last_click_attribution_points} ;;
    value_format_name: decimal_1
  }

  measure: multi_touch_orders {
    type: sum
    sql: ${multi_touch_attribution_points} ;;
    value_format_name: decimal_1
  }

  measure: first_click_revenue {
    type: sum
    sql: ${first_click_attribution_points} * ${orders.total_price_fx} ;;
    value_format_name: decimal_1
  }

  measure: last_click_revenue {
    type: sum
    sql: ${last_click_attribution_points} * ${orders.total_price_fx} ;;
    value_format_name: decimal_1
  }

  measure: multi_touch_revenue {
    type: sum
    sql: ${multi_touch_attribution_points} * ${orders.total_price_fx} ;;
    value_format_name: decimal_1
  }
}
