# Population Skewness

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PopulationSkewness.new(collection)
klass = klass.calculate                                    #=> 1.66074014712668

# - or -

Lite::Statistics::PopulationSkewness.calculate(collection) #=> 1.66074014712668

# - or -

collection.population_skewness                             #=> 1.66074014712668
```
