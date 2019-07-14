# Sample Skewness

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::SampleSkewness.new(collection)
klass = klass.calculate                                #=> 1.188328915820243

# - or -

Lite::Statistics::SampleSkewness.calculate(collection) #=> 1.188328915820243

# - or -

collection.sample_skewness                             #=> 1.188328915820243
collection.skewness                                    #=> 1.188328915820243
```
