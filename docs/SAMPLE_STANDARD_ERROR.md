# Sample Standard Error

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::SampleStandardError.new(collection)
klass = klass.calculate                                     #=> 1.8907670401189036

# - or -

Lite::Statistics::SampleStandardError.calculate(collection) #=> 1.8907670401189036

# - or -

collection.sample_standard_error                            #=> 1.8907670401189036
collection.standard_error                                   #=> 1.8907670401189036
```
