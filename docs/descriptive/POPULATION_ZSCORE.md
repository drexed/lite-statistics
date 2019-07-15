# Population Z-Score

```ruby
collection = [1, 1, 2, 3, 10]
results = [
  -0.7095748751868991,
  -0.7095748751868991,
  -0.4139186771923578,
  -0.11826247919781649,
  1.9513309067639724
]

klass = Lite::Statistics::PopulationZscore.new(collection)
klass = klass.calculate                                  #=> results

# - or -

Lite::Statistics::PopulationZscore.calculate(collection) #=> results

# - or -

collection.population_zscore                             #=> results
collection.zscore                                        #=> results
```
