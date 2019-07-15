# Sample Standard Error

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::SampleStandardError.new(collection)
klass = klass.calculate                                     #=> 1.6911534525287761

# - or -

Lite::Statistics::SampleStandardError.calculate(collection) #=> 1.6911534525287761

# - or -

collection.sample_standard_error                            #=> 1.6911534525287761
collection.standard_error                                   #=> 1.6911534525287761
```
