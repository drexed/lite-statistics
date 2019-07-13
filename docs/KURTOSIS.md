# Kurtosis

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Kurtosis.new(collection)
klass = klass.calculate                          #=> 2.405613966453127

# - or -

Lite::Statistics::Kurtosis.calculate(collection) #=> 2.405613966453127

# - or -

collection.kurtosis                              #=> 2.405613966453127
```
