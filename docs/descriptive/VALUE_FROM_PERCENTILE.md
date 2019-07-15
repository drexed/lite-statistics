# Value from Percentile

Alias: `percentile_rank`

```ruby
collection = [1, 1, 2, 3, 10]
results = 3

klass = Lite::Statistics::Descriptive.new(collection)
klass.value_from_percentile(60)

# - or -

Lite::Statistics::Descriptive.value_from_percentile(collection, 60)

# - or -

collection.value_from_percentile(60)
```
