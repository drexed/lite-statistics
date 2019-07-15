# Population Standard Error

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.8907670401189036

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_standard_error

# - or -

Lite::Statistics::Descriptive.population_standard_error(collection)

# - or -

collection.population_standard_error
```
