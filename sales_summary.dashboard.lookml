- dashboard: sales_summary
  title: Sales Summary
  layout: grid
  width: 800
  rows:
    - elements: [total_orders, total_revenue, total_customers]
      height: 200
    - elements: [items_per_order, avg_order_value, avg_customer_value]
      height: 200
    - elements: [sales_over_time]
      height: 200
  show_applied_filters: true

  filters:
  - name: date_range
    title: 'Date Range'
    type: field_filter
    explore: sales
    field: orders.processed_date
    default_value: 'last 12 months'

  elements:
  - name: total_orders
    title: Total Orders
    type: single_value
    model: shopify
    explore: sales
    dimensions: [orders.processed_month]
    fill_fields: [orders.processed_month]
    measures: [orders.count]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${orders.count}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${orders.count} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [orders.processed_month desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [last_month]
    comparison_label: month-over-month
    listen:
      date_range: orders.processed_date

  - name: total_revenue
    title: Total Revenue
    type: single_value
    model: shopify
    explore: sales
    dimensions: [orders.processed_month]
    fill_fields: [orders.processed_month]
    measures: [sales.gross_sales_total]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${sales.gross_sales_total}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${sales.gross_sales_total} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [orders.processed_month desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [last_month]
    comparison_label: month-over-month
    listen:
      date_range: orders.processed_date

  - name:  total_customers
    title: Total Customers
    type: single_value
    model: shopify
    explore: sales
    dimensions: [orders.processed_month]
    fill_fields: [orders.processed_month]
    measures: [orders.count_customers]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${orders.count_customers}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${orders.count_customers} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [orders.processed_date_month desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [last_month]
    comparison_label: month-over-month
    listen:
      date_range: orders.processed_date

  - name: items_per_order
    title: Avg Items per Order
    model: shopify
    explore: sales
    type: single_value
    dimensions: [orders.processed_month]
    fill_fields: [orders.processed_month]
    measures: [sales.order_items, orders.count]
    dynamic_fields:
    - table_calculation: avg_items
      label: avg_items
      expression: ${sales.order_items}/${orders.count}
      value_format:
      value_format_name: decimal_2
    - table_calculation: last_month
      label: last_month
      expression: offset(${avg_items}, 1)
      value_format:
      value_format_name: decimal_2
    - table_calculation: wow_change
      label: wow_change
      expression: "(${avg_items} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [orders.processed_month desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [sales.order_items, orders.count, last_month]
    comparison_label: month-over-month
    listen:
      date_range: orders.processed_date

  - name: avg_order_value
    title: Avg Order Value
    model: shopify
    explore: sales
    type: single_value
    model: shopify
    explore: sales
    dimensions: [orders.processed_month]
    fill_fields: [orders.processed_month]
    measures: [orders.avg_order_value]
    dynamic_fields:
    - table_calculation: last_month
      label: last_month
      expression: offset(${orders.avg_order_value}, 1)
      value_format:
      value_format_name: decimal_0
    - table_calculation: wow_change
      label: wow_change
      expression: "(${orders.avg_order_value} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [orders.processed_month desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [last_month]
    comparison_label: month-over-month
    listen:
    date_range: orders.processed_date
    listen:
      date_range: orders.processed_date

  - name: avg_customer_value
    title: Avg Customer Value
    model: shopify
    explore: sales
    type: single_value
    dimensions: [orders.processed_month]
    fill_fields: [orders.processed_month]
    measures: [orders.order_value, orders.count_customers]
    dynamic_fields:
    - table_calculation: avg_customer_value
      label: avg_customer_value
      expression: ${orders.order_value}/${orders.count_customers}
      value_format:
      value_format_name: decimal_2
    - table_calculation: last_month
      label: last_month
      expression: offset(${avg_customer_value}, 1)
      value_format:
      value_format_name: decimal_2
    - table_calculation: wow_change
      label: wow_change
      expression: "(${avg_customer_value} - ${last_month}) / ${last_month}"
      value_format:
      value_format_name: percent_0
    sorts: [orders.processed_month desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [orders.order_value, orders.count_customers, last_month]
    comparison_label: month-over-month
    listen:
      date_range: orders.processed_date

  - name: sales_over_time
    title: Sales Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields: [sales.happened_date, sales.gross_sales_total]
    fill_fields: [sales.happened_date]
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts: [sales.happened_date desc]
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
    listen:
      date_range: orders.processed_date
