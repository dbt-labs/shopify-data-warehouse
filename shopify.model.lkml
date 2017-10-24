connection: "shopify_test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: sales {
  always_filter: {
    filters: {
      field: test
      value: "false"
    }
    filters: {
      field: is_deleted
      value: "false"
    }
  }
}
