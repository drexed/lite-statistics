# Sample|Population Summary

Alias: `zscore`

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  # All available calculations plus,
  # ...
  #
  quartile_1: 2,
  quartile_2: 3,
  quartile_3: 10
}

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_sumary

# - or -

Lite::Statistics::Descriptive.population_summary(collection)

# - or -

collection.sample_summary
```
