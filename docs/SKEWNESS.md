# Skewness

```ruby
collection = [1, 1, 2, 3, 10]

klass = Lite::Statistics::Skewness.new(collection)
klass = klass.calculate                          #=> 1.188328915820243

# - or -

Lite::Statistics::Skewness.calculate(collection) #=> 1.188328915820243

# - or -

collection.skewness                              #=> 1.188328915820243
```
