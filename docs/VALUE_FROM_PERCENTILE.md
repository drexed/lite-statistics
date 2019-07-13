# Value from Percentile

The number closest to a given percentile.

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::ValueFromPercentile.new(collection)
klass = klass.calculate(60)                                     #=> 3

# - or -

Lite::Statistics::ValueFromPercentile.calculate(collection, 60) #=> 3

# - or -

collection.value_from_percentile(60)                            #=> 3
```
