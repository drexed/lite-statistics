# Frequency

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  1 => 2,
  2 => 1,
  3 => 1,
  10 => 1
}

klass = Lite::Statistics::Frequency.new(collection)
klass = klass.calculate                           #=> results

# - or -

Lite::Statistics::Frequency.calculate(collection) #=> results

# - or -

collection.frequency                              #=> results
```
