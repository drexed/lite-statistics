# Sample|Population Standard Deviation

Alias: `standard_deviation`

```ruby
collection = [1, 1, 2, 3, 10]
results = 3.3823069050575527

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_standard_deviation

# - or -

Lite::Statistics::Descriptive.population_standard_deviation(collection)

# - or -

collection.sample_standard_deviation
```
