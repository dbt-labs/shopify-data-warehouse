# Customizations
Based on your company, there are essential customizations that depend on your preferences and location.


### Timezone
All timestamps loaded into your data warehouse from Shopify are in UTC. Make sure to set the appropriate [database time zone](https://docs.looker.com/admin-options/database/connections#database_time_zone) when setting up your connection.

### Local Currency
In the [model file](https://github.com/fishtown-analytics/shopify-data-warehouse/compare/12/shopify.model.lkml?expand=1#L7), specify a [currency format string](https://docs.looker.com/reference/model-params/named_value_format) for your local currency.

### Color Palette
To customize the color palette of your dashboard, you can either change it in your LookML code under `series_colors:` or [directly on the dashboard](https://discourse.looker.com/t/color-palettes-color-picker-3-34/1646).
