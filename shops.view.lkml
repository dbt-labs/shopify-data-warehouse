view: shops {
  sql_table_name: shopify.shops ;;

  dimension: shop_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.shop_id ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      shop_id,
      name,
      addresses.count,
      customer_tags.count,
      customers.count,
      inventory_adjustments.count,
      inventory_items_snapshot.count,
      line_item_properties.count,
      line_items.count,
      locations.count,
      online_store_sessions.count,
      order_note_attributes.count,
      order_tags.count,
      orders.count,
      product_tags.count,
      product_variants.count,
      products.count,
      users.count
    ]
  }
}
