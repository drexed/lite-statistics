# Lite::Statistics

[![Gem Version](https://badge.fury.io/rb/lite-statistics.svg)](http://badge.fury.io/rb/lite-statistics)
[![Build Status](https://travis-ci.org/drexed/lite-statistics.svg?branch=master)](https://travis-ci.org/drexed/lite-statistics)

Lite::Statistics is a library for generate statistics from collections of data points.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-statistics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-statistics

## Table of Contents

* [Configurations](#configurations)
* [Descriptive](#descriptive)
* [Monkey patches](#monkey-patches)
* [Benchmarks](#benchmarks)

## Configurations

`rails g lite:statistics:install` will generate the following file:
`../config/initalizers/lite-statistics.rb`

```ruby
Lite::Statistics.configure do |config|
  config.monkey_patches = true
end
```

## Descriptive

Sample|Population calculations will have a shorthand alias that defaults to sample.

Ex: `variance` => `sample_variance`

#### Summary

* [Sample|Population Summary](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SUMMARY.md)

#### Count

* [Sum](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SUM.md)
* [Sample|Population Size](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SIZE.md)

#### Distribution

* [Frequencies](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/FREQUENCIES.md)
* [Min](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/MIN.md)
* [Max](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/MAX.md)
* [Proportions](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/PROPORTIONS.md)

#### Central tendency

* [Mean](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/MEAN.md) aka Average
* [Median](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/MEDIAN.md)
* [Mode](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/MODE.md)

#### Dispersion

* [Midrange](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/MIDRANGE.md) aka Midextreme
* [Range](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/RANGE.md)
* [Percentile from Value](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/PERCENTILE_FROM_VALUE.md) aka Percentile
* [Value from Percentile](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/VALUE_FROM_PERCENTILE.md) aka Percentile Rank

#### Spread

* [Sample|Population Variance](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/VARIANCE.md)
* [Sample|Population Standard Deviation](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/STANDARD_DEVIATION.md)
* [Sample|Population Coefficient of Variation](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/COEFFICIENT_OF_VARIATION.md)
* [Sample|Population Standard Error](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/STANDARD_ERROR.md)
* [Sample|Population Z-Score](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/ZSCORE.md)

#### Shape

* [Sample|Population Skewness](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SKEWNESS.md)
* [Sample|Population Kurtosis](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/KURTOSIS.md)

## Monkey patches

Including monkey patches will give you `Enumerable` access to statistics.

```ruby
[1, 2, 3, 1].mode #=> 1
```

## Benchmarks

All benchmarks are executed using the baseline summary (exact same calculations for each)
and the default summary (all available calculations for each). Each is generated
using an array containing 1 million random integers on the `2.6.3` Ruby version.

View all available [benchmarks](https://github.com/drexed/lite-statistics/tree/master/benchmarks).

#### Baseline summaries

Library | # of Calculations | IPS | Speed
--- | --- | --- | ---
[lite-statistics](https://github.com/drexed/lite-statistics) | 13 | 2.972 i/s | ---
[descriptive_statistics](https://github.com/thirtysixthspan/descriptive_statistics) | 13 | 0.619 i/s | 5.25x  slower
[descriptive-statistics](https://github.com/jtescher/descriptive-statistics) | 13 | 0.607 i/s | 5.37x  slower
[statistica](https://github.com/tab300/Statistica) | 13 | 0.576 i/s | 5.96x  slower

#### Default summaries

Library | # of Calculations | IPS | Speed
--- | --- | --- | ---
[lite-statistics](https://github.com/drexed/lite-statistics) | 22 | 1.241 i/s | ---
[descriptive_statistics](https://github.com/thirtysixthspan/descriptive_statistics) | 13 | 0.619 i/s | 2.13x  slower
[descriptive-statistics](https://github.com/jtescher/descriptive-statistics) | 15 | 0.549 i/s | 2.21x  slower
[statistica](https://github.com/tab300/Statistica) | 19 | 0.456 i/s | 3.12x  slower

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-statistics. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Statistics project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-statistics/blob/master/CODE_OF_CONDUCT.md).
