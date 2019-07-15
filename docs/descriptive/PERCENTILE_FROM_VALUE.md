# Percentile from Value

Alias: `percentile`

```ruby
collection = [1, 1, 2, 3, 10]
results = 80

klass = Lite::Statistics::Descriptive.new(collection)
klass.percentile_from_value(10)

# - or -

Lite::Statistics::Descriptive.percentile_from_value(collection, 10)

# - or -

collection.percentile_from_value(10)
```
