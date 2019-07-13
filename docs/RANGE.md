# Range

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Range.new(collection)
klass = klass.calculate                       #=> 9

# - or -

Lite::Statistics::Range.calculate(collection) #=> 9

# - or -

collection.range                              #=> 9
```
