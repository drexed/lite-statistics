# Coefficient of Variation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::CoefficientOfVariation.new(collection)
klass = klass.calculate                                        #=> 0.994796148546339

# - or -

Lite::Statistics::CoefficientOfVariation.calculate(collection) #=> 0.994796148546339

# - or -

collection.coefficient_of_variation                            #=> 0.994796148546339
```
