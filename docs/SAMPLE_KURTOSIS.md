# Sample Kurtosis

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::SampleKurtosis.new(collection)
klass = klass.calculate                                #=> 2.405613966453127

# - or -

Lite::Statistics::SampleKurtosis.calculate(collection) #=> 2.405613966453127

# - or -

collection.sample_kurtosis                             #=> 2.405613966453127
collection.kurtosis                                    #=> 2.405613966453127
```
