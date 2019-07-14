# Population Coefficient of Variation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PopulationCoefficientOfVariation.new(collection)
klass = klass.calculate                                                  #=> 0.994796148546339

# - or -

Lite::Statistics::PopulationCoefficientOfVariation.calculate(collection) #=> 0.994796148546339

# - or -

collection.population_coefficient_of_variation                           #=> 0.994796148546339
```
