# Sample Variance

Alias: `variance`

```ruby
collection = [1, 1, 2, 3, 10]
results = 14.299999999999999

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_variance

# - or -

Lite::Statistics::Descriptive.sample_variance(collection)

# - or -

collection.sample_variance
```
