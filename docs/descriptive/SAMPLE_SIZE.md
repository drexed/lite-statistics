# Sample Size

Alias: `size`

```ruby
collection = [1, 1, 2, 3, 10]
results = 5

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_size

# - or -

Lite::Statistics::Descriptive.sample_size(collection)

# - or -

collection.sample_size
```
