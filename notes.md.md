# Notes

### Line Item Properties:

- There are no docs for this table!
- We need a PK in this table.

### Order Note Attributes

- There are no docs for this table!
- We need a PK in this table.

### Customers

These models are not using:

- rank
- average order value
- total order value

These metrics are better calculated in Looker. Just looking at all-time orders at the customer level (or AOV or any other metric like this) is just not that flexible--you want to allow your BI tool to actually make decisions like what time period to aggregate over, what orders to include / exclude... It's impossible to anticipate all of the potential aggregations that a user may want here and my general belief is that the raw data shouldn't include any pre-aggregations like this because it's impossible to provide them all. Providing a few creates an inconsistent experience for the analyst.

### Order Attribution Interactions

- This table really needs a scrubbed version of where the traffic came from. Online Store Sessions has that in the form of `referrer_source`, but that information isn't being carried over here. Looking at detailed utm and referrer data isn't actually useful from a reporting perspective; you really need that cleaned up categorization to build meaningful high-level reports.
- Doing positional attribution (first click / last click / multi-touch) requires two fields that aren't currently in this table but probably should be: `order_total_interactions` and `order_interaction_number`. These fields can be calculated in SQL (and currently are in the derived table in the view) but would probably be better in the raw data. The positional attribution calculations should probably be implemented in SQL so that the user can adjust as desired; there is no "correct" answer on how to do attribution so it's best left up to the user.
