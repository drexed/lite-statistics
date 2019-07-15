# Population Coefficient of Variation

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.1122159059522962

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_coefficient_of_variation

# - or -

Lite::Statistics::Descriptive.population_coefficient_of_variation(collection)

# - or -

collection.population_coefficient_of_variation
```
