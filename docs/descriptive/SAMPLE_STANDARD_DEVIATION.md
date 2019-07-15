# Sample Standard Deviation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::SampleStandardDeviation.new(collection)
klass = klass.calculate                                         #=> 3.7815340802378072

# - or -

Lite::Statistics::SampleStandardDeviation.calculate(collection) #=> 3.7815340802378072

# - or -

collection.sample_standard_deviation                            #=> 3.7815340802378072
collection.standard_deviation                                   #=> 3.7815340802378072
```
