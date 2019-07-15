# Sample Z-Score

Alias: `zscore`

```ruby
collection = [1, 1, 2, 3, 10]
results = {
  1 => -0.7095748751868991,
  2 => -0.4139186771923578,
  3 => -0.11826247919781649,
  10 => 1.9513309067639724
}

klass = Lite::Statistics::Descriptive.new(collection)
klass.sample_zscore

# - or -

Lite::Statistics::Descriptive.sample_zscore(collection)

# - or -

collection.sample_zscore
```
