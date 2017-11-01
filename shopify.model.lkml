connection: "shopify_test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

named_value_format: local_currency {
  value_format: "$0.00"
}

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

explore: online_store_sessions {

  join: shops {
    sql_on: ${online_store_sessions.shop_id} = ${shops.shop_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}
