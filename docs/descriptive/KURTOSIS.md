# Sample|Population Kurtosis

Alias: `kurtosis`

```ruby
collection = [1, 1, 2, 3, 10]
results = 3.007017458066408

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_kurtosis

# - or -

Lite::Statistics::Descriptive.population_kurtosis(collection)

# - or -

collection.sample_kurtosis
```
