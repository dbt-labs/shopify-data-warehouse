- dashboard: traffic_summary
  title: Traffic Summary
  layout: grid
  width: 800
  rows:
    - elements: [last_week_sessions, last_week_uniques, last_week_bounce_rate, last_week_conversion_rate]
      height: 200
    - elements: [sessions]
      height: 300
    - elements: [time_on_site, new_vs_returning_sessions]
      height: 300
    - elements: [sessions_by_traffic_source, sessions_by_device]
      height: 300
    - elements: [conversion_rate_by_traffic_source, conversion_rate_by_device]
      height: 300
    - elements: [top_countries, top_landing_pages]
      height: 300
  show_applied_filters: true

  filters:
  - name: date_range
    title: 'Date Range'
    type: field_filter
    explore: online_store_sessions
    field: online_store_sessions.session_started_date
    default_value: 'last 12 months'
  - name: new_vs_returning
    title: 'New vs Returning'
    type: field_filter
    explore: online_store_sessions
    field: online_store_sessions.new_vs_returning
    default_value:
  - name: device
    title: 'Device'
    type: field_filter
    explore: online_store_sessions
    field: online_store_sessions.ua_form_factor
    default_value:
  - name: traffic_source
    title: 'Traffic Source'
    type: field_filter
    explore: online_store_sessions
    field: online_store_sessions.referrer_source
    default_value:
  - name: shop_name
    title: 'Shop Name'
    type: field_filter
    explore: sales
    field: shops.shop_name
    default_value:


  elements:
    - name: last_week_sessions
      title: Last Week Sessions
      type: single_value
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.session_started_week]
      fill_fields: [online_store_sessions.session_started_week]
      measures: [online_store_sessions.sessions]
      dynamic_fields:
      - table_calculation: last_week_sessions
        label: last_week_sessions
        expression: offset(${online_store_sessions.sessions}, 1)
        value_format:
        value_format_name: decimal_0
      - table_calculation: wow_change
        label: wow_change
        expression: "(${online_store_sessions.sessions} - ${last_week_sessions}) / ${last_week_sessions}"
        value_format:
        value_format_name: percent_0
      sorts: [online_store_sessions.session_started_week desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/New_York
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: value
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
      totals_color: "#1C2260"
      series_types: {}
      hidden_fields: [last_week_sessions]
      comparison_label: week-over-week
      filters:
        online_store_sessions.session_started_week: 'before this week'
      listen:
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: last_week_uniques
      title: Last Week Uniques
      type: single_value
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.session_started_week]
      fill_fields: [online_store_sessions.session_started_week]
      measures: [online_store_sessions.unique_visitors]
      dynamic_fields:
      - table_calculation: last_week
        label: last_week
        expression: offset(${online_store_sessions.unique_visitors}, 1)
        value_format:
        value_format_name: decimal_0
      - table_calculation: wow_change
        label: wow_change
        expression: "(${online_store_sessions.unique_visitors} - ${last_week}) / ${last_week}"
        value_format:
        value_format_name: percent_0
      sorts: [online_store_sessions.session_started_week desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/New_York
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: value
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
      totals_color: "#1C2260"
      series_types: {}
      hidden_fields: [last_week_sessions, last_week]
      comparison_label: week-over-week
      filters:
        online_store_sessions.session_started_week: 'before this week'
      listen:
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name


    - name: last_week_bounce_rate
      title: Last Week Bounce Rate
      type: single_value
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.session_started_week]
      fill_fields: [online_store_sessions.session_started_week]
      measures: [online_store_sessions.bounce_rate]
      dynamic_fields:
      - table_calculation: last_week
        label: last_week
        expression: offset(${online_store_sessions.bounce_rate}, 1)
        value_format:
        value_format_name: percent_2
      - table_calculation: wow_change
        label: wow_change
        expression: "(${online_store_sessions.bounce_rate} - ${last_week}) / ${last_week}"
        value_format:
        value_format_name: percent_0
      sorts: [online_store_sessions.session_started_week desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/New_York
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: value
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
      totals_color: "#1C2260"
      series_types: {}
      hidden_fields: [last_week_sessions, last_week]
      comparison_label: week-over-week
      filters:
        online_store_sessions.session_started_week: 'before this week'
      listen:
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: last_week_conversion_rate
      title: Last Week Conversion Rate
      model: shopify
      explore: online_store_sessions
      type: single_value
      fields: [online_store_sessions.sessions_with_orders, online_store_sessions.sessions,
        online_store_sessions.session_started_week]
      fill_fields: [online_store_sessions.session_started_week]
      sorts: [online_store_sessions.session_started_week desc]
      limit: 500
      dynamic_fields:
      - table_calculation: conversion_rate
        label: conversion_rate
        expression: "${online_store_sessions.sessions_with_orders}/${online_store_sessions.sessions}"
        value_format:
        value_format_name: percent_2
        _kind_hint: measure
        _type_hint: number
      - table_calculation: last_week
        label: last_week
        expression: offset(${conversion_rate}, 1)
        value_format:
        value_format_name: percent_2
        _kind_hint: measure
        _type_hint: number
      - table_calculation: wow_change
        label: wow_change
        expression: "(${conversion_rate} - ${last_week}) / ${last_week}"
        value_format:
        value_format_name: percent_0
        _kind_hint: measure
        _type_hint: number
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: value
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
      totals_color: "#1C2260"
      series_types: {}
      hidden_fields: [online_store_sessions.sessions, online_store_sessions.sessions_with_orders,
        online_store_sessions.session_started_week, last_week]
      comparison_label: week-over-week
      filters:
        online_store_sessions.session_started_week: 'before this week'
      listen:
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: sessions
      title: Sessions
      type: looker_line
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.session_started_date]
      fill_fields: [online_store_sessions.session_started_date]
      measures: [online_store_sessions.sessions]
      dynamic_fields:
      - table_calculation: median
        label: median
        expression: median(${online_store_sessions.sessions})
        value_format:
        value_format_name:
      sorts: [online_store_sessions.session_started_date desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/New_York
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
      totals_color: "#1C2260"
      series_types:
        median: area
      hidden_series: [Game console, Unknown]
      series_colors:
        median: "#e4e7e0"
        online_store_sessions.sessions: "#EEC200"
      series_labels:
        median: below median
      focus_on_hover: false
      hide_legend: true
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name


    - name: sessions_by_traffic_source
      title: Sessions by Traffic Source
      type: looker_line
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.referrer_source, online_store_sessions.session_started_date]
      pivots: [online_store_sessions.referrer_source]
      fill_fields: [online_store_sessions.session_started_date]
      measures: [online_store_sessions.sessions]
      sorts: [online_store_sessions.referrer_source 0, online_store_sessions.session_started_date desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/New_York
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
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      series_types: {}
      hidden_series: [email]
      series_colors:
        Direct - online_store_sessions.sessions: "#43467F"
        Email - online_store_sessions.sessions: "#007ACE"
        Search - online_store_sessions.sessions: "#EEC200"
        Social - online_store_sessions.sessions: "#50B83C"
        Unknown - online_store_sessions.sessions: "#47C1BF"
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name


    - name: time_on_site
      title: Time on Site
      type: looker_bar
      model: shopify
      explore: online_store_sessions
      fields: [online_store_sessions.session_duration_tier, online_store_sessions.sessions]
      filters:
        online_store_sessions.session_duration_tier: "-NULL"
      sorts: [online_store_sessions.sessions desc]
      limit: 500
      column_limit: 50
      query_timezone: America/New_York
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
      truncate_column_names: true
      totals_color: "#1C2260"
      series_types: {}
      series_labels:
      series_name: Sessions
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name


    - name: sessions_by_device
      title: Sessions by Device
      type: looker_line
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.session_started_date, online_store_sessions.ua_form_factor]
      pivots: [online_store_sessions.ua_form_factor]
      fill_fields: [online_store_sessions.session_started_date]
      measures: [online_store_sessions.sessions]
      sorts: [online_store_sessions.session_started_date desc, online_store_sessions.ua_form_factor]
      limit: 500
      column_limit: 50
      query_timezone: America/New_York
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
      truncate_column_names: true
      series_name: Session Started Date
      totals_color: "#1C2260"
      series_types: {}
      series_colors:
        Desktop - online_store_sessions.sessions: "#1C2260"
        Game Console - online_store_sessions.sessions: "#007ACE"
        Mobile - online_store_sessions.sessions: "#EEC200"
        Smart TV - online_store_sessions.sessions: "#50B83C"
        Tablet - online_store_sessions.sessions: "#47C1BF"
        Unknown - online_store_sessions.sessions: "#5C6AC4"
      hidden_series: [Game console, Unknown]
      listen:
        date_range: online_store_sessions.session_started_date
        device: online_store_sessions.ua_form_factor
        new_vs_returning: online_store_sessions.new_vs_returning
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: new_vs_returning_sessions
      title: New vs Returning Sessions
      type: looker_pie
      model: shopify
      explore: online_store_sessions
      dimensions: [online_store_sessions.new_vs_returning]
      measures: [online_store_sessions.sessions]
      sorts: [online_store_sessions.sessions desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/New_York
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
      totals_color: "#1C2260"
      series_types: {}
      inner_radius: 60
      colors: 'palette: Looker Classic'
      series_colors:
        returning: "#EEC200"
        new: "#007ACE"
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: conversion_rate_by_traffic_source
      title: Conversion Rate by Traffic Source
      model: shopify
      explore: online_store_sessions
      type: looker_column
      fields: [online_store_sessions.sessions_with_orders, online_store_sessions.sessions,
        online_store_sessions.referrer_source]
      pivots: [online_store_sessions.referrer_source]
      sorts: [online_store_sessions.referrer_source]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - table_calculation: conversion_rate
        label: Conversion Rate
        expression: "${online_store_sessions.sessions_with_orders}/${online_store_sessions.sessions}"
        value_format:
        value_format_name: percent_2
        _kind_hint: measure
        _type_hint: number
      stacking: ''
      show_value_labels: true
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
      totals_color: "#1C2260"
      query_timezone: America/New_York
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      series_types: {}
      series_colors:
        Direct - conversion_rate: "#1C2260"
        Email - conversion_rate: "#007ACE"
        Search - conversion_rate: "#EEC200"
        Social - conversion_rate: "#50B83C"
        Unknown - conversion_rate: "#47C1BF"
      hidden_series: [email]
      hidden_fields: [online_store_sessions.sessions_with_orders, online_store_sessions.sessions]
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: conversion_rate_by_device
      title: Conversion Rate by Device
      model: shopify
      explore: online_store_sessions
      type: looker_column
      fields: [online_store_sessions.sessions_with_orders, online_store_sessions.sessions,
        online_store_sessions.ua_form_factor]
      pivots: [online_store_sessions.ua_form_factor]
      sorts: [online_store_sessions.ua_form_factor]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - table_calculation: conversion_rate
        label: Conversion Rate
        expression: "${online_store_sessions.sessions_with_orders}/${online_store_sessions.sessions}"
        value_format:
        value_format_name: percent_2
        _kind_hint: measure
        _type_hint: number
      stacking: ''
      show_value_labels: true
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
      totals_color: "#1C2260"
      query_timezone: America/New_York
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      series_types: {}
      hidden_series: [email]
      series_colors:
        Desktop - conversion_rate: "#1C2260"
        Game Console - conversion_rate: "#007ACE"
        Mobile - conversion_rate: "#EEC200"
        Smart TV - conversion_rate: "#50B83C"
        Tablet - conversion_rate: "#47C1BF"
        Unknown - conversion_rate: "#5C6AC4"
      hidden_fields: [online_store_sessions.sessions_with_orders, online_store_sessions.sessions]
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: top_countries
      title: Sessions by Country
      model: shopify
      explore: online_store_sessions
      type: looker_bar
      fields: [online_store_sessions.location_country, online_store_sessions.sessions]
      sorts: [online_store_sessions.sessions desc]
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
      totals_color: "#1C2260"
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
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name

    - name: top_landing_pages
      title: Sessions by Landing Page Type
      model: shopify
      explore: online_store_sessions
      type: looker_bar
      fields: [online_store_sessions.landing_page_type, online_store_sessions.sessions]
      filters:
        online_store_sessions.landing_page_type: "-NULL"
      sorts: [online_store_sessions.sessions desc]
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
      totals_color: "#1C2260"
      show_null_points: true
      point_style: none
      interpolation: linear
      value_labels: legend
      label_type: labPer
      series_types: {}
      series_colors:
       online_store_sessions.sessions: "#EEC200"
      hidden_series: []
      x_axis_label: Product ID
      hidden_points_if_no: [yesno]
      listen:
        date_range: online_store_sessions.session_started_date
        new_vs_returning: online_store_sessions.new_vs_returning
        device: online_store_sessions.ua_form_factor
        traffic_source: online_store_sessions.referrer_source
        shop_name: shops.shop_name
