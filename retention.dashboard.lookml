- dashboard: retention
  title: Retention
  layout: newspaper
  elements:
  - title: Customer Retention by Cohort
    name: Customer Retention by Cohort
    model: shopify
    explore: sales
    type: table
    fields:
    - sales.months_from_start
    - sales.customers
    - sales.customer_first_order_month
    pivots:
    - sales.months_from_start
    filters:
      sales.is_deleted: 'no'
      sales.months_from_start: NOT NULL
      sales.test: 'no'
    sorts:
    - sales.months_from_start 0
    - sales.customer_first_order_month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cohort_customers
      label: Cohort Customers
      expression: pivot_offset(${sales.customers}, ${sales.months_from_start} * -1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${sales.customers} / ${cohort_customers}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_types: {}
    hidden_fields:
    - sales.customers
    - cohort_customers
    conditional_formatting:
    - type: low to high
      value: 1
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#f35454"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    row: 12
    col: 0
    width: 24
    height: 10
  - title: Customer Retention by Cohort Trends
    name: Customer Retention by Cohort Trends
    model: shopify
    explore: sales
    type: looker_line
    fields:
    - sales.months_from_start
    - sales.customers
    - sales.customer_first_order_month
    pivots:
    - sales.customer_first_order_month
    filters:
      sales.is_deleted: 'no'
      sales.months_from_start: NOT NULL
      sales.test: 'no'
    sorts:
    - sales.customer_created_month
    - sales.months_from_start
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cohort_customers
      label: Cohort Customers
      expression: offset(${sales.customers}, ${sales.months_from_start} * -1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${sales.customers} / ${cohort_customers}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
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
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    - sales.customers
    - cohort_customers
    row: 4
    col: 7
    width: 17
    height: 8
  - title: Net Sales by Customer Cohort
    name: Net Sales by Customer Cohort
    model: shopify
    explore: sales
    type: looker_column
    fields:
    - sales.net_sales_total
    - sales.happened_quarter
    - sales.customer_first_order_quarter
    pivots:
    - sales.customer_first_order_quarter
    fill_fields:
    - sales.happened_quarter
    filters:
      sales.customer_first_order_quarter: "-NULL"
      sales.is_deleted: 'no'
      sales.test: 'no'
    sorts:
    - sales.happened_quarter desc
    - sales.customer_first_order_quarter
    limit: 500
    stacking: normal
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    x_axis_datetime_label: ''
    x_axis_datetime_tick_count: 6
    hidden_series: []
    row: 22
    col: 0
    width: 24
    height: 8
  - name: 'Retention Dashboard: Overview'
    type: text
    title_text: 'Retention Dashboard: Overview'
    body_text: 'This dashboard helps understand repeat buying behavior for your Shopify
      store. Each of the below tables and charts is based on a monthly customer cohort:
      the month in which a given user made their first purchase. This allows each
      chart to then track that group of users over time and see how they behave in
      subsequent months.'
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Predicted Customers Probability of Returning
    name: Predicted Customers Probability of Returning
    model: shopify
    explore: customers
    type: looker_column
    fields:
    - customers.first_order_month
    - customers.probability_of_returning
    filters:
      customers.first_order_month: NOT NULL
    sorts:
    - customers.first_order_month desc
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    column_spacing_ratio:
    column_group_spacing_ratio:
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: customers.probability_of_returning
        name: Probability of Returning
        axisId: customers.probability_of_returning
    x_axis_datetime_tick_count: 6
    row: 30
    col: 0
    width: 8
    height: 7
  - title: Predicted Next 30 Day Revenue from Existing Customers
    name: Predicted Next 30 Day Revenue from Existing Customers
    model: shopify
    explore: customers
    type: looker_column
    fields:
    - customers.first_order_month
    - customers.total_expected_purchase_value_in_next_30_days
    filters:
      customers.first_order_month: NOT NULL
    sorts:
    - customers.first_order_month desc
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    column_spacing_ratio:
    column_group_spacing_ratio:
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: customers.total_expected_purchase_value_in_next_30_days
        name: Total Expected Purchase Value In Next 30 Days
        axisId: customers.total_expected_purchase_value_in_next_30_days
    x_axis_datetime_tick_count: 6
    row: 30
    col: 8
    width: 8
    height: 7
  - title: Cohort Sizes
    name: Cohort Sizes
    model: shopify
    explore: customers
    type: looker_column
    fields:
    - customers.first_order_month
    - customers.count
    fill_fields:
    - customers.first_order_month
    filters:
      customers.first_order_month: NOT NULL
    sorts:
    - customers.first_order_month desc
    limit: 500
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
    x_axis_datetime_tick_count: 6
    row: 4
    col: 0
    width: 7
    height: 8
  - title: Repeat Customers by Cohort
    name: Repeat Customers by Cohort
    model: shopify
    explore: customers
    type: looker_column
    fields:
    - customers.first_order_month
    - customers.percent_repeat_customers
    fill_fields:
    - customers.first_order_month
    filters:
      customers.first_order_month: NOT NULL
    sorts:
    - customers.first_order_month desc
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_series:
    - customers.count
    column_spacing_ratio:
    column_group_spacing_ratio:
    x_axis_datetime_tick_count: 4
    row: 30
    col: 16
    width: 8
    height: 7
