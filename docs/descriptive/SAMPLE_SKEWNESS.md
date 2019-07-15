# Sample Skewness

Alias: `skewness`

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.328592117701344

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_skewness

# - or -

Lite::Statistics::Descriptive.sample_skewness(collection)

# - or -

collection.sample_skewness
```
