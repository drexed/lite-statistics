# Mode

The number that occurs most often within a set of numbers.

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Mode.new(collection)
klass = klass.calculate                      #=> 1

# - or -

Lite::Statistics::Mode.calculate(collection) #=> 1

# - or -

collection.mode                              #=> 1
```
