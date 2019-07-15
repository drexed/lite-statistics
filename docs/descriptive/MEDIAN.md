# Median

```ruby
collection = [1, 1, 2, 3, 10]
results = 2

klass = Lite::Statistics::Descriptive.new(collection)
klass.median

# - or -

Lite::Statistics::Descriptive.median(collection)

# - or -

collection.median
```
