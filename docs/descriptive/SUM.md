# Sum

```ruby
collection = [1, 1, 2, 3, 10]
results = 17

klass = Lite::Statistics::Descriptive.new(collection)
klass.sum

# - or -

Lite::Statistics::Descriptive.sum(collection)

# - or -

# No monkey patch available as its part of Enumerable
```
