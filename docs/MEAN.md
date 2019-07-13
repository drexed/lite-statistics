# Mean

The average of all numbers.

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Mean.new(collection)
klass = klass.calculate                      #=> 3.4

# - or -

Lite::Statistics::Mean.calculate(collection) #=> 3.4

# - or -

collection.mean                              #=> 3.4
collection.average                           #=> 3.4
```
