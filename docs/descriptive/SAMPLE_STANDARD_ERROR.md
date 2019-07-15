# Sample Standard Error

Alias: `standard_error`

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.512613632095123

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_standard_error

# - or -

Lite::Statistics::Descriptive.sample_standard_error(collection)

# - or -

collection.sample_standard_error
```
