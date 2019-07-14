# Population Kurtosis

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PopulationKurtosis.new(collection)
klass = klass.calculate                                    #=> 3.75877182258301

# - or -

Lite::Statistics::PopulationKurtosis.calculate(collection) #=> 3.75877182258301

# - or -

collection.population_kurtosis                             #=> 3.75877182258301
```
