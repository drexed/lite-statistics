# Population Size

```ruby
collection = [1, 1, 2, 3, 10]
results = 4

klass = Lite::Statistics::Descriptive.new(collection)
klass.population_size

# - or -

Lite::Statistics::Descriptive.population_size(collection)

# - or -

collection.population_size
```
