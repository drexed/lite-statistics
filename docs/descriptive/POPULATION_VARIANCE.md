# Population Variance

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PopulationVariance.new(collection)
klass = klass.calculate                                    #=> 11.44

# - or -

Lite::Statistics::PopulationVariance.calculate(collection) #=> 11.44

# - or -

collection.population_variance                             #=> 11.44
```
