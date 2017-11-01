- dashboard: inventory_trends
  title: Inventory Trends
  layout: newspaper
  elements:
  - title: Inventory Flows by Product
    name: Inventory Flows by Product
    model: shopify
    explore: inventory_adjustments
    type: looker_line
    fields:
    - products.title
    - inventory_adjustments.inventory_month
    - inventory_adjustments.net_inventory_change
    pivots:
    - products.title
    fill_fields:
    - inventory_adjustments.inventory_month
    sorts:
    - products.title 0
    - inventory_adjustments.inventory_month desc
    limit: 500
    column_limit: 25
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_series: []
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    listen:
      Product Type: products.product_type
      Product: products.title
    row: 9
    col: 0
    width: 12
    height: 8
  - title: Inventory Flows by Variant
    name: Inventory Flows by Variant
    model: shopify
    explore: inventory_adjustments
    type: looker_line
    fields:
    - products.title
    - product_variants.sku
    - inventory_adjustments.inventory_month
    - inventory_adjustments.net_inventory_change
    pivots:
    - products.title
    - product_variants.sku
    fill_fields:
    - inventory_adjustments.inventory_month
    sorts:
    - products.title
    - product_variants.sku
    - inventory_adjustments.inventory_month desc
    limit: 500
    column_limit: 50
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_series: []
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    listen:
      Product Type: products.product_type
      Product: products.title
    row: 9
    col: 12
    width: 12
    height: 8
  - title: Inventory Flows
    name: Inventory Flows
    model: shopify
    explore: inventory_adjustments
    type: looker_column
    fields:
    - inventory_adjustments.inventory_inflow
    - inventory_adjustments.inventory_outflow
    - inventory_adjustments.inventory_month
    - inventory_adjustments.net_inventory_change
    fill_fields:
    - inventory_adjustments.inventory_month
    sorts:
    - inventory_adjustments.created_month desc
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_series: []
    listen:
      Product Type: products.product_type
      Product: products.title
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Product Type
    title: Product Type
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: products.product_type
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Product
    title: Product
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: products.title
    listens_to_filters: []
    allow_multiple_values: true
    required: false
