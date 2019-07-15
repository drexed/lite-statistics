# Population Standard Deviation

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PopulationStandardDeviation.new(collection)
klass = klass.calculate                                             #=> 3.3823069050575527

# - or -

Lite::Statistics::PopulationStandardDeviation.calculate(collection) #=> 3.3823069050575527

# - or -

collection.population_standard_deviation                            #=> 3.3823069050575527
```
