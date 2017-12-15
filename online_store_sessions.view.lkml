# This explore allows you to view user on-site behavior, such as how many visited, how long were they engaged, etc

# Docs here: https://help.shopify.com/api/data-warehouse/schema-reference/online_store_sessions

view: online_store_sessions {

  derived_table: {
    sql:
        select *, row_number() over (partition by user_token order by session_started_at) as session_index
        from shopify.online_store_sessions
        ;;
  }

  # IDs -------------------------------------------------------------------

  dimension: derived_session_token {
    type: string
    sql: ${TABLE}.derived_session_token ;;
    primary_key: yes
    hidden: yes
  }

  dimension: shop_id {
    type: number
    hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: user_token {
    type: string
    sql: ${TABLE}.user_token ;;
  }

  # Dates -------------------------------------------------------------------

  dimension_group: session_started {
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
    sql: ${TABLE}.session_started_at ;;
  }

  dimension_group: hit_first_checkout {
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
    sql: ${TABLE}.hit_first_checkout_at ;;
  }

  dimension_group: completed_first_order {
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
    sql: ${TABLE}.completed_first_order_at ;;
  }

  dimension_group: marketing_event_started {
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
    sql: ${TABLE}.marketing_event_started_at ;;
  }

  # UTM Parameters -------------------------------------------------------------------

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_campaign_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_campaign_source ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_campaign_term ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_campaign_content ;;
  }

  # Referrer -------------------------------------------------------------------

  dimension: referrer_domain {
    type: string
    sql: ${TABLE}.referrer_domain ;;
  }

  dimension: referrer_host {
    type: string
    sql: ${TABLE}.referrer_host ;;
  }

  dimension: referrer_is_direct {
    type: yesno
    sql: ${TABLE}.referrer_is_direct ;;
  }

  dimension: referrer_name {
    type: string
    sql: ${TABLE}.referrer_name ;;
  }

  dimension: referrer_path {
    type: string
    sql: ${TABLE}.referrer_path ;;
  }

  dimension: referrer_source {
    type: string
    sql: ${TABLE}.referrer_source ;;
  }

  dimension: referrer_subdomain {
    type: string
    sql: ${TABLE}.referrer_subdomain ;;
  }

  dimension: referrer_terms {
    type: string
    sql: ${TABLE}.referrer_terms ;;
  }

  dimension: referrer_tld {
    type: string
    sql: ${TABLE}.referrer_tld ;;
  }

  dimension: referrer_url {
    type: string
    sql: ${TABLE}.referrer_url ;;
  }

  # Other Marketing -------------------------------------------------------------------

  dimension: marketing_channel {
    type: string
    sql: ${TABLE}.marketing_channel ;;
  }

  dimension: marketing_event_type {
    type: string
    sql: ${TABLE}.marketing_event_type ;;
  }

  # Landing Page -------------------------------------------------------------------

  dimension: landing_page_path {
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }

  dimension: landing_page_resource_id {
    type: number
    sql: ${TABLE}.landing_page_resource_id ;;
  }

  dimension: landing_page_type {
    type: string
    sql: ${TABLE}.landing_page_type ;;
  }

  dimension: landing_page_url {
    type: string
    sql: ${TABLE}.landing_page_url ;;
  }

  # Exit Page -------------------------------------------------------------------

  dimension: exit_page_path {
    type: string
    sql: ${TABLE}.exit_page_path ;;
  }

  dimension: exit_page_resource_id {
    type: number
    sql: ${TABLE}.exit_page_resource_id ;;
  }

  dimension: exit_page_type {
    type: string
    sql: ${TABLE}.exit_page_type ;;
  }

  dimension: exit_page_url {
    type: string
    sql: ${TABLE}.exit_page_url ;;
  }

  # Flags -------------------------------------------------------------------

  dimension: had_credit_card_info_error {
    type: yesno
    sql: ${TABLE}.had_credit_card_info_error ;;
  }

  dimension: had_discount {
    type: yesno
    sql: ${TABLE}.had_discount ;;
  }

  dimension: had_error {
    type: yesno
    sql: ${TABLE}.had_error ;;
  }

  dimension: had_free_shipping {
    type: yesno
    sql: ${TABLE}.had_free_shipping ;;
  }

  dimension: had_out_of_stock_warning {
    type: yesno
    sql: ${TABLE}.had_out_of_stock_warning ;;
  }

  dimension: had_payment_error {
    type: yesno
    sql: ${TABLE}.had_payment_error ;;
  }

  dimension: used_gift_card {
    type: yesno
    sql: ${TABLE}.used_gift_card ;;
  }

  # Behavior Aggregations -------------------------------------------------------------------

  dimension: count_of_cart_additions {
    type: number
    sql: ${TABLE}.count_of_cart_additions ;;
  }

  dimension: count_of_distinct_product_variants_added_to_cart {
    type: number
    sql: ${TABLE}.count_of_distinct_product_variants_added_to_cart ;;
  }

  dimension: count_of_distinct_products_added_to_cart {
    type: number
    sql: ${TABLE}.count_of_distinct_products_added_to_cart ;;
  }

  dimension: orders_completed {
    type: number
    sql: ${TABLE}.count_of_orders_completed ;;
  }

  dimension: count_of_pageviews {
    type: number
    sql: ${TABLE}.count_of_pageviews ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: session_duration_tier {
    type: string
    sql: case when ${TABLE}.session_duration between 0 and 9 then '0s to 9s'
              when ${TABLE}.session_duration between 10 and 29 then '10s to 29s'
              when ${TABLE}.session_duration between 30 and 59 then '30s to 59s'
              when ${TABLE}.session_duration between 60 and 119 then '60s to 119s'
              when ${TABLE}.session_duration between 120 and 239 then '120s to 239s'
              when ${TABLE}.session_duration > 239 then '240s or more'
              else null
         end ;;
  }

  dimension: user_bounced {
    label: "Bounced?"
    type: yesno
    sql: case when ${TABLE}.count_of_pageviews = 1 then 1 else 0 end ;;
  }

  dimension: session_index {
    type: number
    sql: ${TABLE}.session_index ;;
  }

  dimension: new_vs_returning {
    type: string
    sql:
    case
      when ${session_index} = 1 then 'new'
      else 'returning'
    end ;;
  }

  # Geo -------------------------------------------------------------------

  dimension: hashed_ip {
    type: string
    sql: ${TABLE}.hashed_ip ;;
  }

  dimension: location_city {
    type: string
    sql: ${TABLE}.location_city ;;
  }

  dimension: location_country {
    type: string
    sql: ${TABLE}.location_country ;;
  }

  dimension: location_country_code {
    type: string
    sql: ${TABLE}.location_country_code ;;
  }

  dimension: location_region {
    type: string
    sql: ${TABLE}.location_region ;;
  }

  dimension: location_region_code {
    type: string
    sql: ${TABLE}.location_region_code ;;
  }

  # User Agent -------------------------------------------------------------------

  dimension: ua_associated_app {
    type: string
    sql: ${TABLE}.ua_associated_app ;;
  }

  dimension: ua_browser {
    type: string
    sql: ${TABLE}.ua_browser ;;
  }

  dimension: ua_browser_version {
    type: string
    sql: ${TABLE}.ua_browser_version ;;
  }

  dimension: ua_form_factor {
    type: string
    sql: case when ${TABLE}.ua_form_factor is null then 'Unknown' else ${TABLE}.ua_form_factor end ;;
  }

  dimension: ua_os {
    type: string
    sql: ${TABLE}.ua_os ;;
  }

  dimension: ua_os_version {
    type: string
    sql: ${TABLE}.ua_os_version ;;
  }

  dimension: ua_raw {
    type: string
    sql: ${TABLE}.ua_raw ;;
  }

  # Measures -------------------------------------------------------------------

  measure: sessions {
    type: count
  }

  measure: unique_visitors {
    type: count_distinct
    sql: ${user_token} ;;
  }

  measure: bounced_sessions {
    type: count
    filters: {
      field: user_bounced
      value: "yes"
    }
    value_format_name: decimal_0
  }

  measure: count_of_orders_completed {
    type: sum
    sql: case when ${TABLE}.count_of_orders_completed>=1 then 1 else 0 end ;;
  }

  measure: bounce_rate {
    type: number
    sql: ${bounced_sessions}::float / nullif(${sessions}, 0) ;;
    value_format_name: percent_1
  }

  measure: sessions_with_cart_adds {
    type: sum
    sql: case when ${count_of_cart_additions} > 0 then 1 else 0 end ;;
    value_format_name: decimal_0
    group_label: "Funnel"
  }

  measure: sessions_with_checkouts {
    type: sum
    sql: case when ${hit_first_checkout_raw} is not null and ${count_of_cart_additions} > 0 then 1 else 0 end ;;
    value_format_name: decimal_0
    group_label: "Funnel"
  }

  measure: sessions_with_orders {
    type: sum
    sql: case when ${completed_first_order_raw} is not null then 1 else 0 end ;;
    value_format_name: decimal_0
    group_label: "Funnel"
  }

  measure: sessions_with_cart_adds_conversion_rate {
    type: number
    sql: ${sessions_with_cart_adds}::float / nullif(${sessions}, 0) ;;
    value_format_name: percent_2
    group_label: "Funnel"
  }

  measure: cart_add_to_checkout_conversion_rate {
    type: number
    sql: ${sessions_with_checkouts}::float / nullif(${sessions_with_cart_adds}, 0) ;;
    value_format_name: percent_2
    group_label: "Funnel"
  }

  measure: sessions_with_checkouts_conversion_rate {
    type: number
    sql: ${sessions_with_checkouts}::float / nullif(${sessions}, 0) ;;
    value_format_name: percent_2
    group_label: "Funnel"
  }

  measure: checkout_to_order_conversion_rate {
    type: number
    sql: ${sessions_with_orders}::float / nullif(${sessions_with_checkouts}, 0) ;;
    value_format_name: percent_2
    group_label: "Funnel"
  }

  measure: sessions_with_orders_conversion_rate {
    type: number
    sql: ${sessions_with_orders}::float / nullif(${sessions}, 0) ;;
    value_format_name: percent_2
    group_label: "Funnel"
  }








}
