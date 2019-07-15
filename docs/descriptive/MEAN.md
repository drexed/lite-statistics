# Mean

Alias: `average`

```ruby
collection = [1, 1, 2, 3, 10]
results = 3.4

klass = Lite::Statistics::Descriptive.new(collection)
klass.mean

# - or -

Lite::Statistics::Descriptive.mean(collection)

# - or -

collection.mean
```
