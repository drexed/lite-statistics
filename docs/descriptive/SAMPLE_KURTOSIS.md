# Sample Kurtosis

Alias: `kurtosis`

```ruby
collection = [1, 1, 2, 3, 10]
results = 2.405613966453127

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_kurtosis

# - or -

Lite::Statistics::Descriptive.sample_kurtosis(collection)

# - or -

collection.sample_kurtosis
```
