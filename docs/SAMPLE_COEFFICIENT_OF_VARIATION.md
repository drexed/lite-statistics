# Sample Coefficient of Variation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::SampleCoefficientOfVariation.new(collection)
klass = klass.calculate                                              #=> 1.1122159059522962

# - or -

Lite::Statistics::SampleCoefficientOfVariation.calculate(collection) #=> 1.1122159059522962

# - or -

collection.sample_coefficient_of_variation                           #=> 1.1122159059522962
collection.coefficient_of_variation                                  #=> 1.1122159059522962
```
