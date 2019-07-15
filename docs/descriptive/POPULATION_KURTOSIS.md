# Population Kurtosis

```ruby
collection = [1, 1, 2, 3, 10]
results = 2.405613966453127

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_kurtosis

# - or -

Lite::Statistics::Descriptive.population_kurtosis(collection)

# - or -

collection.population_kurtosis
```
