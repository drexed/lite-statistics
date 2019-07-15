# Sample Coefficient of Variation

Alias: `coefficient_of_variation`

```ruby
collection = [1, 1, 2, 3, 10]
results = 0.994796148546339

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_coefficient_of_variation

# - or -

Lite::Statistics::Descriptive.sample_coefficient_of_variation(collection)

# - or -

collection.sample_coefficient_of_variation
```
