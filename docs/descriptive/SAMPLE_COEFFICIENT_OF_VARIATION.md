# Sample Coefficient of Variation

Alias: `coefficient_of_variation`

```ruby
collection = [1, 1, 2, 3, 10]
results = 1.1122159059522962

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_coefficient_of_variation

# - or -

Lite::Statistics::Descriptive.sample_coefficient_of_variation(collection)

# - or -

collection.sample_coefficient_of_variation
```
