# Customizations
Based on your company, there are essential customizations that depend on your preferences and location.


### Timezone
Set a timezone in your Looker Admin located at the top right corner. Scheduled Looks will be run in the time zone of your choosing. To set a database querying time zone, you’ll have to go into Connections on the sidebar.

### Local Currency
In the [model file](https://github.com/fishtown-analytics/shopify-data-warehouse/compare/12/shopify.model.lkml?expand=1#L7), specify a [currency format string](https://docs.looker.com/reference/model-params/named_value_format) for your local currency.

### Color Palette
To customize the color palette of your dashboard, you can either change it in your LookML code under `series_colors:` or [directly on the dashboard](https://discourse.looker.com/t/color-palettes-color-picker-3-34/1646).
