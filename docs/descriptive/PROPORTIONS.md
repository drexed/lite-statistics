# Proportions

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  1 => 0.4,
  2 => 0.2,
  3 => 0.2,
  10 => 0.2
}

klass = Lite::Statistics::Descriptive.new(collection)
klass.proportions

# - or -

Lite::Statistics::Descriptive.proportions(collection)

# - or -

collection.proportions
```
