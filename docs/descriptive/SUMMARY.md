# Sample|Population Summary

Alias: `summary`

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  # - all documented calculations - ...
  # - including value_from_percentile of 25, 50, and 75 (quartile) -
  quartile1: 2,
  quartile2: 3,
  quartile3: 10
}

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_sumary

# - or -

Lite::Statistics::Descriptive.population_summary(collection)

# - or -

collection.sample_summary
```
