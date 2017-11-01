- dashboard: inventory_audit_log
  title: Inventory Audit Log
  layout: newspaper
  elements:
  - title: Inventory Audit Log
    name: Inventory Audit Log
    model: shopify
    explore: inventory_adjustments
    type: table
    fields:
    - products.product_type
    - products.title
    - product_variants.title
    - product_variants.sku
    - inventory_adjustments.inventory_time
    - inventory_adjustments.reason
    - inventory_adjustments.net_inventory_change
    - shops.shop_name
    - users.first_name
    - users.last_name
    - api_clients.title
    sorts:
    - inventory_adjustments.inventory_time desc
    limit: 500
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#4f5fbc"
      bold: false
      italic: false
      strikethrough: false
    listen:
      Product Type: products.product_type
      Product Title: products.title
      Variant Title: product_variants.title
      SKU: product_variants.sku
      API Client: api_clients.title
      User Name: users.full_name
      Inventory Time: inventory_adjustments.inventory_time
    row: 0
    col: 0
    width: 24
    height: 23
  filters:
  - name: API Client
    title: API Client
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: api_clients.title
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: User Name
    title: User Name
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: users.full_name
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Product Title
    title: Product Title
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: products.title
    listens_to_filters: []
    allow_multiple_values: true
    required: false
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
  - name: SKU
    title: SKU
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: product_variants.sku
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Variant Title
    title: Variant Title
    type: field_filter
    default_value: ''
    model: shopify
    explore: inventory_adjustments
    field: product_variants.title
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Inventory Time
    title: Inventory Time
    type: field_filter
    default_value: 30 days
    model: shopify
    explore: inventory_adjustments
    field: inventory_adjustments.inventory_time
    listens_to_filters: []
    allow_multiple_values: true
    required: false
