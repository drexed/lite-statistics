# Median

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Median.new(collection)
klass = klass.calculate                        #=> 2

# - or -

Lite::Statistics::Median.calculate(collection) #=> 2

# - or -

collection.median                              #=> 2
```
