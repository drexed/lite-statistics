# Min

```ruby
collection = [1, 1, 2, 3, 10]
results = 1

klass = Lite::Statistics::Descriptive.new(collection)
klass.min

# - or -

Lite::Statistics::Descriptive.min(collection)

# - or -

# No monkey patch available as its part of Enumerable
```
