# Frequency

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  1 => 2,
  2 => 1,
  3 => 1,
  10 => 1
}

klass = Lite::Statistics::Descriptive.new(collection)
klass.frequency

# - or -

Lite::Statistics::Descriptive.frequency(collection)

# - or -

collection.frequency
```
