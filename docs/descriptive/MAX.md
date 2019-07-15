# Max

```ruby
collection = [1, 1, 2, 3, 10]
results = 10

klass = Lite::Statistics::Descriptive.new(collection)
klass.max

# - or -

Lite::Statistics::Descriptive.max(collection)

# - or -

# No monkey patch available as its part of Enumerable
```
