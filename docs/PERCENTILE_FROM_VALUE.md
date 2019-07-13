# Percentile from Value

The percentile closest to a given number.

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PercentileFromValue.new(collection)
klass = klass.calculate(10)                                     #=> 80

# - or -

Lite::Statistics::PercentileFromValue.calculate(collection, 10) #=> 80

# - or -

collection.percentile_from_value(10)                            #=> 80
```
