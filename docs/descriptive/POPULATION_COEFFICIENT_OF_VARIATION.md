# Population Coefficient of Variation

```ruby
collection = [1, 1, 2, 3, 10]
results = 0.994796148546339

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_coefficient_of_variation

# - or -

Lite::Statistics::Descriptive.population_coefficient_of_variation(collection)

# - or -

collection.population_coefficient_of_variation
```
