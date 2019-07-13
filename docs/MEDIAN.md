# Median

The middle number in a sequence of numbers.

```ruby
collection = [1, 2, 3, 1]

klass = Lite::Statistics::Median.new(collection)
klass = klass.calculate                        #=> 1.5

# - or -

Lite::Statistics::Median.calculate(collection) #=> 1.5

# - or -

collection.median                              #=> 1.5
```
