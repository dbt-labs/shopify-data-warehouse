- dashboard: funnel
  title: Funnel
  layout: newspaper
  elements:
  - title: Funnel Summary
    name: Funnel Summary
    model: shopify
    explore: online_store_sessions
    type: looker_funnel
    fields:
    - online_store_sessions.sessions
    - online_store_sessions.sessions_with_cart_adds
    - online_store_sessions.sessions_with_checkouts
    - online_store_sessions.sessions_with_orders
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - blue
    smoothedBars: true
    orientation: rows
    labelPosition: left
    percentType: prior
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#ffffff"
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Session Start Time: online_store_sessions.session_started_time
      Traffic Source: online_store_sessions.referrer_source
    row: 0
    col: 0
    width: 12
    height: 8
  - title: All-in Conversion Rates
    name: All-in Conversion Rates
    model: shopify
    explore: online_store_sessions
    type: looker_line
    fields:
    - online_store_sessions.session_started_month
    - online_store_sessions.sessions_with_cart_adds_conversion_rate
    - online_store_sessions.sessions_with_checkouts_conversion_rate
    - online_store_sessions.sessions_with_orders_conversion_rate
    fill_fields:
    - online_store_sessions.session_started_month
    sorts:
    - online_store_sessions.session_started_month desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    x_axis_reversed: false
    x_axis_datetime_tick_count: 6
    listen:
      Session Start Time: online_store_sessions.session_started_time
      Traffic Source: online_store_sessions.referrer_source
    row: 8
    col: 0
    width: 12
    height: 8
  - title: Conversion Rates from Prior Stage
    name: Conversion Rates from Prior Stage
    model: shopify
    explore: online_store_sessions
    type: looker_line
    fields:
    - online_store_sessions.session_started_month
    - online_store_sessions.sessions_with_cart_adds_conversion_rate
    - online_store_sessions.cart_add_to_checkout_conversion_rate
    - online_store_sessions.checkout_to_order_conversion_rate
    fill_fields:
    - online_store_sessions.session_started_month
    sorts:
    - online_store_sessions.session_started_month desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    x_axis_datetime_tick_count: 6
    listen:
      Session Start Time: online_store_sessions.session_started_time
      Traffic Source: online_store_sessions.referrer_source
    row: 8
    col: 12
    width: 12
    height: 8
  - title: Counts by Stage
    name: Counts by Stage
    model: shopify
    explore: online_store_sessions
    type: looker_line
    fields:
    - online_store_sessions.session_started_month
    - online_store_sessions.sessions
    - online_store_sessions.sessions_with_cart_adds
    - online_store_sessions.sessions_with_checkouts
    - online_store_sessions.sessions_with_orders
    fill_fields:
    - online_store_sessions.session_started_month
    sorts:
    - online_store_sessions.session_started_month desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_series: []
    x_axis_datetime_tick_count: 4
    listen:
      Session Start Time: online_store_sessions.session_started_time
      Traffic Source: online_store_sessions.referrer_source
    row: 0
    col: 12
    width: 12
    height: 8
  filters:
  - name: Session Start Time
    title: Session Start Time
    type: field_filter
    default_value: ''
    model: shopify
    explore: online_store_sessions
    field: online_store_sessions.session_started_time
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    model: shopify
    explore: online_store_sessions
    field: online_store_sessions.referrer_source
    listens_to_filters: []
    allow_multiple_values: true
    required: false
