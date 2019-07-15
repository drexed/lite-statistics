# Product

```ruby
collection = [1, 1, 2, 3, 10]
results = 60

klass = Lite::Statistics::Descriptive.new(collection)
klass.product

# - or -

Lite::Statistics::Descriptive.product(collection)

# - or -

collection.product
```
