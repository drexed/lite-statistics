# Population Z-Score

```ruby
collection = [1, 1, 2, 3, 10]
results = [
  -0.6346630624175341,
  -0.6346630624175341,
  -0.37022011974356156,
  -0.105777177069589,
  1.7453234216482187
]

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_zscore

# - or -

Lite::Statistics::Descriptive.population_zscore(collection)

# - or -

collection.population_zscore
```
