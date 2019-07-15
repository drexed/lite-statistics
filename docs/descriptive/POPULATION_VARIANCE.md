# Population Variance

```ruby
collection = [1, 1, 2, 3, 10]
results = 11.44

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_variance

# - or -

Lite::Statistics::Descriptive.population_variance(collection)

# - or -

collection.population_variance
```
