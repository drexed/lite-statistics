# Population Standard Error

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::PopulationStandardError.new(collection)
klass = klass.calculate                                         #=> 1.512613632095123

# - or -

Lite::Statistics::PopulationStandardError.calculate(collection) #=> 1.512613632095123

# - or -

collection.population_standard_error                            #=> 1.512613632095123
```
