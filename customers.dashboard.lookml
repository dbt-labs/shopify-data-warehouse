- dashboard: customers
  title: Customers
  layout: newspaper
  elements:
  - title: Promising Customers
    name: Promising Customers
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - customers.promising
    - customers.count
    pivots:
    - customers.promising
    fill_fields:
    - customers.promising
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc 0
    - customers.promising
    limit: 500
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    font_size: '12'
    series_types: {}
    hidden_fields: []
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 7
    col: 12
    width: 12
    height: 4
  - title: At Risk Customers
    name: At Risk Customers
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - customers.count
    - customers.at_risk
    pivots:
    - customers.at_risk
    fill_fields:
    - customers.at_risk
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc 0
    - customers.at_risk
    limit: 500
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields: []
    hide_legend: false
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 15
    col: 0
    width: 12
    height: 4
  - name: Customer Lists
    type: text
    title_text: Customer Lists
    body_text: Shopify provides a number of helpful flags at the customer level to
      help identify promising, at risk, dormant, and more customer segments. This
      dashboard allows you to look at each of the flags and then drill into associated
      customer lists. Click on the chart to drill in and see a list of specific customers.
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Dormant Customers
    name: Dormant Customers
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - customers.count
    - customers.dormant
    pivots:
    - customers.dormant
    fill_fields:
    - customers.dormant
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc 0
    - customers.dormant
    limit: 500
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields: []
    hide_legend: false
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 15
    col: 12
    width: 12
    height: 4
  - title: Loyal Customers
    name: Loyal Customers
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - customers.count
    - customers.loyal
    pivots:
    - customers.loyal
    fill_fields:
    - customers.loyal
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc 0
    limit: 500
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields: []
    hide_legend: false
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 7
    col: 0
    width: 12
    height: 4
  - title: New Customers
    name: New Customers
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - customers.count
    - customers.new
    pivots:
    - customers.new
    fill_fields:
    - customers.new
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc 0
    limit: 500
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields: []
    hide_legend: false
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 11
    col: 0
    width: 12
    height: 4
  - title: Returning Customers
    name: Returning Customers
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - customers.count
    - customers.returning
    pivots:
    - customers.returning
    fill_fields:
    - customers.returning
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc 0
    limit: 500
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields: []
    hide_legend: false
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 11
    col: 12
    width: 12
    height: 4
  - title: Total Customers
    name: Total Customers
    model: shopify
    explore: sales
    type: single_value
    fields:
    - customers.count
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - customers.count desc
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: percent
    show_value_labels: false
    label_density: 25
    legend_position: right
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields: []
    hide_legend: false
    listen:
      Customer Created Date: customers.created_date
      Customer First Order Date: customers.first_order_date
      Country: customers.country
    row: 4
    col: 0
    width: 24
    height: 3
  filters:
  - name: Customer First Order Date
    title: Customer First Order Date
    type: field_filter
    default_value: ''
    model: shopify
    explore: customers
    field: customers.first_order_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    model: shopify
    explore: customers
    field: customers.country
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Customer Created Date
    title: Customer Created Date
    type: field_filter
    default_value: ''
    model: shopify
    explore: customers
    field: customers.created_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
