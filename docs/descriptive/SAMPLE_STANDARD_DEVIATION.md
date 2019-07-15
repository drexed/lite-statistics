# Sample Standard Deviation

Alias: `standard_deviation`

```ruby
collection = [1, 1, 2, 3, 10]
results = 3.7815340802378072

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_standard_deviation

# - or -

Lite::Statistics::Descriptive.sample_standard_deviation(collection)

# - or -

collection.sample_standard_deviation
```
