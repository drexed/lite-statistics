# Standard Deviation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::StandardDeviation.new(collection)
klass = klass.calculate                                   #=> 3.7815340802378072

# - or -

Lite::Statistics::StandardDeviation.calculate(collection) #=> 3.7815340802378072

# - or -

collection.standard_deviation                             #=> 3.7815340802378072
collection.sample_standard_deviation                      #=> 3.7815340802378072
```
