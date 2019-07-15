# Population Z-Score

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  1 => -0.6346630624175341,
  2 => -0.37022011974356156,
  3 => -0.105777177069589,
  10 => 1.7453234216482187
}

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_zscore

# - or -

Lite::Statistics::Descriptive.population_zscore(collection)

# - or -

collection.population_zscore
```
