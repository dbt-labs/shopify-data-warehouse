connection: "shopify_test"

include: "*.view.lkml"
include: "*.dashboard.lookml"

named_value_format: local_currency {
  value_format: "$0.00"
}

explore: customers {}

explore: sales {
  always_filter: {
    filters: {
      field: test
      value: "no"
    }
    filters: {
      field: is_deleted
      value: "no"
    }
  }

  join: orders {
    sql_on: ${sales.order_id} = ${orders.order_id} ;;
    type: inner
    relationship: many_to_one
  }

  join: products {
    sql_on:  ${sales.product_id} = ${products.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: shops {
    sql_on:  ${sales.shop_id} = ${shops.shop_id} ;;
    type:  left_outer
    relationship: many_to_one
  }

  join: customers {
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    type:  left_outer
    relationship: many_to_one
  }
}

explore: current_inventory {
  label: "Current Inventory Levels"

  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${current_inventory.product_id} = ${products.product_id};;
    fields: [products.product_type, products.title, products.vendor]
  }

  join: product_variants {
    type: inner
    relationship: many_to_one
    sql_on: ${current_inventory.product_variant_id} = ${product_variants.product_variant_id} ;;
    fields: [product_variants.sku, product_variants.title]
  }
}

explore: inventory_adjustments {
  label: "Inventory Flows"

  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${inventory_adjustments.product_id} = ${products.product_id};;
    fields: [products.product_type, products.title, products.vendor]
  }

  join: product_variants {
    type: inner
    relationship: many_to_one
    sql_on: ${inventory_adjustments.product_variant_id} = ${product_variants.product_variant_id} ;;
    fields: [product_variants.sku, product_variants.title]
  }

  join: api_clients {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_adjustments.api_client_id} = ${api_clients.api_client_id} ;;
  }

  join: shops {
    type: inner
    relationship: many_to_one
    sql_on: ${inventory_adjustments.shop_id} = ${shops.shop_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_adjustments.user_id} = ${users.user_id} ;;
  }
}

explore: online_store_sessions {
  join: shops {
    sql_on: ${online_store_sessions.shop_id} = ${shops.shop_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}

explore: order_attribution_interactions {
  join: orders {
    sql_on: ${order_attribution_interactions.order_id} = ${orders.order_id} ;;
    type: inner
    relationship: many_to_one
    fields: []
  }
}
