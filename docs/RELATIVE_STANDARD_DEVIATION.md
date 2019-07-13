# Relative Standard Deviation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::RelativeStandardDeviation.new(collection)
klass = klass.calculate                                           #=> 0.994796148546339

# - or -

Lite::Statistics::RelativeStandardDeviation.calculate(collection) #=> 0.994796148546339

# - or -

collection.relative_standard_deviation                            #=> 0.994796148546339
collection.coefficient_of_variation                               #=> 0.994796148546339
```
