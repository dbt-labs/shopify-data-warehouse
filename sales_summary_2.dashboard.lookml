- dashboard: sales_summary_2
  title: Sales Summary 2
  layout: newspaper
  elements:


  - title: Total Orders
    name: Total Orders
    model: shopify
    explore: sales
    type: single_value
    fields:
    - orders.processed_month
    - orders.count
    fill_fields:
    - orders.processed_month
    sorts:
    - orders.processed_month desc
    limit: 500
    column_limit: 50
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
    hidden_fields:
    - last_month
    comparison_label: month-over-month
    listen:
      Date Range: orders.processed_date
    row: 0
    col: 0
    width: 8
    height: 7


  - title: Total Customers
    name: Total Customers
    model: shopify
    explore: sales
    type: single_value
    fields:
    - orders.processed_month
    - orders.count_customers
    fill_fields:
    - orders.processed_month
    sorts:
    - orders.processed_date_month desc
    limit: 500
    column_limit: 50
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
    hidden_fields:
    - last_month
    comparison_label: month-over-month
    listen:
      Date Range: orders.processed_date
    row: 7
    col: 0
    width: 8
    height: 8


  - title: Avg Order Value
    name: Avg Order Value
    model: shopify
    explore: sales
    type: single_value
    fields:
    - orders.processed_month
    - orders.avg_order_value
    fill_fields:
    - orders.processed_month
    sorts:
    - orders.processed_month desc
    limit: 500
    column_limit: 50
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
    hidden_fields:
    - last_month
    comparison_label: month-over-month
    date_range: orders.processed_date
    listen:
      Date Range: orders.processed_date
    row: 7
    col: 8
    width: 8
    height: 8


  - title: Total Revenue
    name: Total Revenue
    model: shopify
    explore: sales
    type: single_value
    fields:
    - orders.processed_month
    - sales.gross_sales_total
    fill_fields:
    - orders.processed_month
    sorts:
    - orders.processed_month desc
    limit: 500
    column_limit: 50
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
    hidden_fields:
    - last_month
    comparison_label: month-over-month
    listen:
      Date Range: orders.processed_date
    row: 0
    col: 16
    width: 8
    height: 7


  - title: Avg Items per Order
    name: Avg Items per Order
    model: shopify
    explore: sales
    type: single_value
    fields:
    - orders.processed_month
    - sales.order_items
    - orders.count
    fill_fields:
    - orders.processed_month
    sorts:
    - orders.processed_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: avg_items
      label: avg_items
      expression: "${sales.order_items}/${orders.count}"
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
    hidden_fields:
    - sales.order_items
    - orders.count
    - last_month
    comparison_label: month-over-month
    listen:
      Date Range: orders.processed_date
    row: 0
    col: 8
    width: 8
    height: 7


  - title: Avg Customer Value
    name: Avg Customer Value
    model: shopify
    explore: sales
    type: single_value
    fields:
    - orders.processed_month
    - orders.order_value
    - orders.count_customers
    fill_fields:
    - orders.processed_month
    sorts:
    - orders.processed_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: avg_customer_value
      label: avg_customer_value
      expression: "${orders.order_value}/${orders.count_customers}"
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
    hidden_fields:
    - orders.order_value
    - orders.count_customers
    - last_month
    comparison_label: month-over-month
    listen:
      Date Range: orders.processed_date
    row: 7
    col: 16
    width: 8
    height: 8


  - title: Total Quantity by Product
    name: Total Quantity by Product
    model: shopify
    explore: sales
    type: looker_bar
    fields:
    - sales.product_id
    - sales.order_items
    - sales.gross_sales_total
    filters:
      orders.processed_date: ''
      sales.is_deleted: 'no'
      sales.product_id: NOT NULL
      sales.test: 'no'
    sorts:
    - sales.order_items desc
    limit: 20
    column_limit: 15
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
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_series: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: sales.order_items
        name: Sales Order Items
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 821
      - id: sales.gross_sales_total
        name: Sales Gross Sales Total
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 825
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 809
    x_axis_label: Product ID
    listen:
      Date Range: orders.processed_date
    row: 34
    col: 0
    width: 24
    height: 8


  - title: Total Items per Order
    name: Total Items per Order
    model: shopify
    explore: sales
    type: looker_line
    fields:
    - orders.processed_date
    - sales.quantity
    - orders.count
    pivots:
    - sales.quantity
    fill_fields:
    - orders.processed_date
    filters:
      orders.processed_date: ''
      sales.is_deleted: 'no'
      sales.quantity: ">=0"
      sales.test: 'no'
    sorts:
    - orders.processed_date desc
    - sales.quantity
    limit: 10
    column_limit: 15
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_series: []
    x_axis_label: Processed Date
    y_axes:
    - label: Orders Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: '0'
        name: '0'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 544
      - id: '1'
        name: '1'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 548
      - id: '2'
        name: '2'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 552
      - id: '3'
        name: '3'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 556
      - id: '4'
        name: '4'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 560
      - id: '5'
        name: '5'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 564
      - id: '6'
        name: '6'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 568
      - id: '7'
        name: '7'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 572
      - id: '8'
        name: '8'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 576
      - id: '10'
        name: '10'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 580
      - id: '11'
        name: '11'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 584
      - id: '12'
        name: '12'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 588
      - id: '15'
        name: '15'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 592
      - id: '20'
        name: '20'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 596
      - id: '24'
        name: '24'
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 600
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 532
    listen:
      Date Range: orders.processed_date
    row: 27
    col: 0
    width: 24
    height: 7


  - title: Sales Over Time
    name: Sales Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields:
    - sales.happened_date
    - sales.gross_sales_total
    fill_fields:
    - sales.happened_date
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - sales.happened_date desc
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
      Date Range: sales.happened_date
    row: 15
    col: 0
    width: 24
    height: 8


  - title: Orders Over Time
    name: Orders Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields:
    - sales.order_items
    - sales.happened_date
    fill_fields:
    - sales.happened_date
    filters:
      sales.happened_date: ''
      sales.is_deleted: 'no'
      sales.test: 'no'
    sorts:
    - sales.happened_date desc
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
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    x_axis_label: Happened Date
    y_axes:
    - label: Total Items Ordered
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: sales.order_items
        name: Sales Order Items
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 673
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 661
    listen:
      Date Range: sales.happened_date
    row: 23
    col: 0
    width: 24
    height: 4


  - title: Total Customers Over Time
    name: Total Customers Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields:
    - orders.count_customers
    - orders.processed_date
    fill_fields:
    - orders.processed_date
    filters:
      orders.processed_date: ''
      sales.is_deleted: 'no'
      sales.test: 'no'
    sorts:
    - orders.processed_date desc
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - 'palette: Looker Classic'
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    font_size: '12'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors:
    - 'palette: Mixed Pastels'
    series_colors: {}
    x_axis_label: New vs Repeat
    y_axes:
    - label: Avg Over Value
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: orders.avg_order_value
        name: Orders Avg Order Value
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 1216
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 1204
    listen:
      Date Range: orders.processed_date
    row: 50
    col: 0
    width: 24
    height: 6


  - title: Top 10 Products by Units Sold
    name: Top 10 Products by Units Sold
    model: shopify
    explore: sales
    type: looker_column
    fields:
    - sales.product_id
    - sales.order_items
    filters:
      sales.happened_date: ''
      sales.is_deleted: 'no'
      sales.product_id: NOT NULL
      sales.test: 'no'
    sorts:
    - sales.order_items desc
    limit: 10
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
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    y_axes:
    - label: Total Items Ordered
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: sales.order_items
        name: Sales Order Items
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 745
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 733
    x_axis_label: Product ID
    listen:
      Date Range: sales.happened_date
    row: 42
    col: 0
    width: 24
    height: 8


  - title: New vs Returning Customers
    name: New vs Returning Customers
    model: shopify
    explore: sales
    type: looker_pie
    fields:
    - orders.new_vs_repeat
    - sales.order_items
    filters:
      sales.test: 'no'
      sales.is_deleted: 'no'
    sorts:
    - orders.new_vs_repeat desc
    limit: 500
    value_labels: legend
    label_type: labPer
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
      Date Range: orders.processed_date
    row: 56
    col: 0
    width: 7
    height: 8


  - title: New vs Returning - Order Value over Time
    name: New vs Returning - Order Value over Time
    model: shopify
    explore: sales
    type: looker_area
    fields:
    - orders.processed_date
    - orders.order_value
    - orders.new_vs_repeat
    pivots:
    - orders.new_vs_repeat
    fill_fields:
    - orders.processed_date
    filters:
      orders.processed_date: ''
      sales.is_deleted: 'no'
      sales.test: 'no'
    sorts:
    - orders.new_vs_repeat 0
    - orders.processed_date
    limit: 10
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    value_labels: legend
    label_type: labPer
    series_types: {}
    y_axes:
    - label: Order Value
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: new
        name: new
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 951
      - id: repeat
        name: repeat
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 955
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 939
    x_axis_label: Processed Date
    listen:
      Date Range: orders.processed_date
    row: 56
    col: 7
    width: 17
    height: 8


  - title: New vs Returning - Avg Order Value
    name: New vs Returning - Avg Order Value
    model: shopify
    explore: sales
    type: looker_line
    fields:
    - orders.new_vs_repeat
    - orders.avg_order_value
    - orders.processed_date
    pivots:
    - orders.new_vs_repeat
    fill_fields:
    - orders.processed_date
    filters:
      orders.processed_date: ''
      sales.is_deleted: 'no'
      sales.test: 'no'
    sorts:
    - orders.avg_order_value desc 0
    - orders.new_vs_repeat
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - 'palette: Looker Classic'
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    font_size: '12'
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors:
    - 'palette: Mixed Pastels'
    series_colors: {}
    x_axis_label: New vs Repeat
    y_axes:
    - label: Avg Over Value
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: orders.avg_order_value
        name: Orders Avg Order Value
        __FILE: shopify/sales_summary_2.dashboard.lookml
        __LINE_NUM: 1089
      __FILE: shopify/sales_summary_2.dashboard.lookml
      __LINE_NUM: 1077
    listen:
      Date Range: orders.processed_date
    row: 64
    col: 0
    width: 24
    height: 8
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: last 12 months
    model: shopify
    explore: sales
    field: orders.processed_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
