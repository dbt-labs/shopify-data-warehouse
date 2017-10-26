- dashboard: sales_summary
  title: Sales Summary
  layout: grid
  width: 800
  rows:
    - elements: [total_revenue, total_orders, total_customers]
      height: 200
    - elements: [items_per_order, avg_order_value, avg_customer_value]
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
    model: shopify
    explore: sales
    type: single_value
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      date_range: orders.processed_date

  - name: total_revenue
    title: Total Revenue
    model: shopify
    explore: sales
    type: single_value
    fields: [sales.gross_sales_total]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      date_range: orders.processed_date

  - name:  total_customers
    title: Total Customers
    model: shopify
    explore: sales
    type: single_value
    fields: [orders.count_customers]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      date_range: orders.processed_date

  - name: items_per_order
    title: Avg Items per Order
    model: shopify
    explore: sales
    type: single_value
    fields: [sales.order_items, orders.count]
    sorts: [sales.order_items desc]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      date_range: orders.processed_date

  - name: avg_order_value
    title: Avg Order Value
    model: shopify
    explore: sales
    type: single_value
    fields: [orders.avg_order_value]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      date_range: orders.processed_date

  - name: avg_customer_value
    title: Avg Customer Value
    model: shopify
    explore: sales
    type: single_value
    fields: [orders.order_value, orders.count_customers]
    limit: 500
    dynamic_fields:
    - table_calculation: avg_customer_value
      label: Avg Customer Value
      expression: sum(${orders.order_value})/sum(${orders.count_customers})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      date_range: orders.processed_date
