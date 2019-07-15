# Mode

```ruby
collection = [1, 1, 2, 3, 10]
results = 1

klass = Lite::Statistics::Descriptive.new(collection)
klass.mode

# - or -

Lite::Statistics::Descriptive.mode(collection)

# - or -

collection.mode
```
