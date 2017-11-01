- dashboard: current_inventory_levels
  title: Current Inventory Levels
  layout: newspaper
  elements:
  - title: Products Currently Oversold
    name: Products Currently Oversold
    model: shopify
    explore: current_inventory
    type: table
    fields:
    - products.product_type
    - products.title
    - product_variants.title
    - product_variants.sku
    - current_inventory.current_inventory
    - current_inventory.inventory_date
    filters:
      current_inventory.oversold: 'Yes'
    sorts:
    - current_inventory.current_inventory
    limit: 100
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '100'
    listen:
      Product Type: products.product_type
      Product Title: products.title
      Product Variant Title: product_variants.title
      SKU: product_variants.sku
    row: 11
    col: 0
    width: 24
    height: 11
  - title: Current Inventory Days
    name: Current Inventory Days
    model: shopify
    explore: current_inventory
    type: table
    fields:
    - products.title
    - product_variants.title
    - product_variants.sku
    - current_inventory.t30d_purchases
    - current_inventory.average_daily_purchases
    - current_inventory.current_inventory
    - current_inventory.inventory_days
    filters:
      current_inventory.inventory_days: NOT NULL
    sorts:
    - current_inventory.inventory_days
    limit: 100
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '100'
    listen:
      Product Type: products.product_type
      Product Title: products.title
      Product Variant Title: product_variants.title
      SKU: product_variants.sku
    row: 0
    col: 0
    width: 24
    height: 11
  filters:
  - name: Product Type
    title: Product Type
    type: field_filter
    default_value: ''
    model: shopify
    explore: current_inventory
    field: products.product_type
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: SKU
    title: SKU
    type: field_filter
    default_value: ''
    model: shopify
    explore: current_inventory
    field: product_variants.sku
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Product Title
    title: Product Title
    type: field_filter
    default_value: ''
    model: shopify
    explore: current_inventory
    field: products.title
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Product Variant Title
    title: Product Variant Title
    type: field_filter
    default_value: ''
    model: shopify
    explore: current_inventory
    field: product_variants.title
    listens_to_filters: []
    allow_multiple_values: true
    required: false
