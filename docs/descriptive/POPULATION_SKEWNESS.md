# Population Skewness

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.66074014712668

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_skewness

# - or -

Lite::Statistics::Descriptive.population_skewness(collection)

# - or -

collection.population_skewness
```
