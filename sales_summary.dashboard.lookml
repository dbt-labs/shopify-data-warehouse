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
      height: 300
    - elements: [orders_over_time]
      height: 300
    - elements: [new_vs_repeat_over_time]
      height: 300
    - elements: [new_vs_repeat_pie, new_vs_repeat_stats]
      height: 300
    - elements: [top_products_units, top_products_gross]
      height: 300
  show_applied_filters: true

  filters:
  - name: date_range
    title: 'Date Range'
    type: field_filter
    explore: sales
    field: orders.processed_date
    default_value: 'last 12 months'
  - name: shop_name
    title: 'Shop Name'
    type: field_filter
    explore: sales
    field: shops.shop_name

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
      shop_name: shops.shop_name

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
      shop_name: shops.shop_name

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
      shop_name: shops.shop_name

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
      shop_name: shops.shop_name

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
      shop_name: shops.shop_name

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
      shop_name: shops.shop_name

  - name: sales_over_time
    title: Sales Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields: [orders.processed_date, sales.gross_sales_total]
    fill_fields: [orders.processed_date]
    sorts: [orders.processed_date desc]
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
      shop_name: shops.shop_name

  - name: orders_over_time
    title: Orders Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields: [orders.processed_date, sales.order_items]
    fill_fields: [orders.processed_date]
    sorts: [orders.processed_date desc]
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
      shop_name: shops.shop_name

  - name: top_products_units
    title: Top Products by Units Sold
    model: shopify
    explore: sales
    type: looker_bar
    fields: [sales.order_items, products.title]
    filters:
      sales.product_id: NOT NULL
    sorts: [sales.order_items desc]
    limit: 20
    column_limit: 15
    dynamic_fields:
    - table_calculation: yesno
      label: yes/no
      expression: row()<=10
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
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
    show_x_axis_label: false
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
    x_axis_label: Product ID
    hidden_points_if_no: [yesno]
    listen:
      date_range: orders.processed_date
      shop_name: shops.shop_name

  - name: top_products_gross
    title: Top Products by Gross Sale
    model: shopify
    explore: sales
    type: looker_bar
    fields: [sales.gross_sales_total, products.title]
    filters:
      sales.product_id: NOT NULL
    sorts: [sales.gross_sales_total desc]
    limit: 20
    column_limit: 15
    dynamic_fields:
    - table_calculation: yesno
      label: yes/no
      expression: row()<=10
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: yesno
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
    show_x_axis_label: false
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
    x_axis_label: Product ID
    hidden_points_if_no: [yesno]
    listen:
      date_range: orders.processed_date
      shop_name: shops.shop_name

  - name: new_vs_repeat_pie
    title: New vs Repeat Customers
    model: shopify
    explore: sales
    type: looker_pie
    fields: [orders.new_vs_repeat, orders.count_customers]
    sorts: [orders.new_vs_repeat desc]
    limit: 500
    column_limit: 50
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
      date_range: orders.processed_date
      shop_name: shops.shop_name

  - name: new_vs_repeat_over_time
    title: New vs Repeat Customer Count Over Time
    model: shopify
    explore: sales
    type: looker_line
    fields: [orders.count_customers, orders.processed_date, orders.new_vs_repeat]
    pivots: [orders.new_vs_repeat]
    fill_fields: [orders.processed_date]
    sorts: [orders.processed_date desc, orders.new_vs_repeat]
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
      shop_name: shops.shop_name

  - name: new_vs_repeat_stats
    title: New vs Repeat Customer Stats
    model: shopify
    explore: sales
    type: looker_column
    fields: [orders.avg_order_value, orders.new_vs_repeat, orders.count_customers, sales.order_items]
    sorts: [orders.avg_order_value desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: avg_order_items
      label: Avg Order Items
      expression: "${sales.order_items}/${orders.count_customers}"
      value_format:
      value_format_name: decimal_1
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
    ordering: none
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: ['palette: Looker Classic']
    smoothedBars: false
    orientation: automatic
    groupBars: true
    showLegend: true
    series_colors: {}
    x_axis_label: New vs Repeat
    y_axes: [{label: '',
              maxValue: !!null '',
              minValue: !!null '',
              orientation: left,
              showLabels: true,
              showValues: true,
              tickDensity: default,
              tickDensityCustom: 5,
              type: linear,
              unpinAxis: false,
              valueFormat: !!null '',
              series: [{id: orders.avg_order_value,
                        name: Avg Order Value}]
              },
              {label: !!null '',
               maxValue: !!null '',
               minValue: !!null '',
               orientation: right,
              showLabels: true,
              showValues: true,
              tickDensity: default,
              tickDensityCustom: 5,
              type: linear,
              unpinAxis: false,
              valueFormat: !!null '',
              series: [{id: avg_order_items, name: Avg Order Items}]
              }]
    hidden_fields: [sales.order_items, orders.count_customers]
    listen:
      date_range: orders.processed_date
      shop_name: shops.shop_name
