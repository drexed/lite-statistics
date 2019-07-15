# Population Standard Deviation

```ruby
collection = [1, 1, 2, 3, 10]
results = 3.7815340802378072

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_standard_deviation

# - or -

Lite::Statistics::Descriptive.population_standard_deviation(collection)

# - or -

collection.population_standard_deviation
```
