# Midrange

Alias: `midextreme`

```ruby
collection = [1, 1, 2, 3, 10]
results = 5.5

klass = Lite::Statistics::Descriptive.new(collection)
klass.midrange

# - or -

Lite::Statistics::Descriptive.midrange(collection)

# - or -

collection.midrange
```
