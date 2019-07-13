# Relative Standard Deviation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::RelativeStandardDeviation.new(collection)
klass = klass.calculate                                           #=> 99.47961485463391

# - or -

Lite::Statistics::RelativeStandardDeviation.calculate(collection) #=> 99.47961485463391

# - or -

collection.relative_standard_deviation                            #=> 99.47961485463391
collection.coefficient_of_variation                               #=> 99.47961485463391
```
