# Mean

The average of all numbers.

```ruby
collection = [1, 2, 3]

klass = Lite::Statistics::Mean.new(collection)
klass = klass.calculate                      #=> 2.0

# - or -

Lite::Statistics::Mean.calculate(collection) #=> 2.0

# - or -

collection.mean                              #=> 2.0
collection.average                           #=> 2.0
```
