# Population Standard Error

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.6911534525287761

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_standard_error

# - or -

Lite::Statistics::Descriptive.population_standard_error(collection)

# - or -

collection.population_standard_error
```
