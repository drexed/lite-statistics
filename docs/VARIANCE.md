# Variance

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Variance.new(collection)
klass = klass.calculate                          #=> 14.299999999999999

# - or -

Lite::Statistics::Variance.calculate(collection) #=> 14.299999999999999

# - or -

collection.variance                              #=> 14.299999999999999
collection.sample_variance                       #=> 14.299999999999999
```
