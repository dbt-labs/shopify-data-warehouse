# This explore allows you to view your current inventory levels to date


view: current_inventory {
  derived_table: {
    sql:
      with inventory as (

        select distinct

            inventory_item_id,
            product_id,
            product_variant_id,
            shop_id,

            max(snapshot_date) over (
                partition by inventory_item_id
                )::date as inventory_date,

            last_value(quantity_end_of_day) over (
                partition by inventory_item_id
                order by snapshot_date
                rows between unbounded preceding and unbounded following
                ) as current_inventory

        from shopify.inventory_items_snapshot

      ),

      purchases as (

          select

              inventory.*,

              sum(
                  case
                  when inventory_adjustments.reason = 'purchase'
                      then inventory_adjustments.quantity_delta * -1
                  else 0
                  end) as t30d_purchases

          from inventory

          left join shopify.inventory_adjustments using (inventory_item_id)

          where datediff(d, inventory.inventory_date, inventory_adjustments.created_at) <= 30

          group by 1, 2, 3, 4, 5, 6

      )


      select * from purchases
      ;;
  }

  dimension: inventory_item_id {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
    type: number
  }

  dimension: product_id {
    hidden: yes
    sql: ${TABLE}.product_id ;;
    type: number
  }

  dimension: product_variant_id {
    hidden: yes
    sql: ${TABLE}.product_variant_id ;;
    type: number
  }

  dimension: shop_id {
    hidden: yes
    sql: ${TABLE}.shop_id ;;
    type: number
  }

  dimension_group: inventory {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.inventory_date ;;
  }

  dimension: current_inventory {
    sql: ${TABLE}.current_inventory ;;
    type: number
  }

  dimension: oversold {
    sql: case when ${current_inventory} < 0 then true else false end ;;
    type: yesno
  }

  dimension: t30d_purchases {
    type: number
    sql: ${TABLE}.t30d_purchases ;;
    value_format_name: decimal_2
  }

  dimension: average_daily_purchases {
    sql: ${t30d_purchases}::float / 30 ;;
    type: number
    value_format_name: decimal_2
  }

  dimension: inventory_days {
    type: number
    sql: ${current_inventory}::float / nullif(${average_daily_purchases}, 0) ;;
    value_format_name: decimal_1
  }

}
