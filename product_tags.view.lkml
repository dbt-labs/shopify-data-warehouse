view: product_tags {
  sql_table_name: shopify.product_tags ;;

  dimension: product_tag_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_tag_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: shop_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shop_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [product_tag_id, shops.name, shops.shop_id, products.product_id]
  }
}
