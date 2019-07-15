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
* [Performance](#performance)

## Configurations

`rails g lite:statistics:install` will generate the following file:
`../config/initalizers/lite-statistics.rb`

```ruby
Lite::Statistics.configure do |config|
  config.monkey_patches = true
end
```

## Descriptive

#### Count

* [Sample Size](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_SIZE.md) aka Size
* [Population Size](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_SIZE.md)
* [Sum](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SUM.md)

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

* [Range](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/RANGE.md)
* [Percentile from Value](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/PERCENTILE_FROM_VALUE.md) aka Percentile
* [Value from Percentile](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/VALUE_FROM_PERCENTILE.md) aka Percentile Rank

#### Spread

* [Sample Variance](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_VARIANCE.md) aka Variance
* [Sample Standard Deviation](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_STANDARD_DEVIATION.md) aka Standard Deviation
* [Sample Coefficient of Variation](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_COEFFICIENT_OF_VARIATION.md) aka Coefficient of Variation
* [Sample Standard Error](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_STANDARD_ERROR.md) aka Standard Error
* [Sample Z-Score](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_ZSCORE.md) aka Z-Score
* [Population Variance](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_VARIANCE.md)
* [Population Standard Deviation](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_STANDARD_DEVIATION.md)
* [Population Coefficient of Variation](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_COEFFICIENT_OF_VARIATION.md)
* [Population Standard Error](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_STANDARD_ERROR.md)
* [Population Z-Score](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_ZSCORE.md)

#### Shape

* [Sample Skewness](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_SKEWNESS.md) aka Skewness
* [Sample Kurtosis](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/SAMPLE_KURTOSIS.md) aka Kurtosis
* [Population Skewness](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_SKEWNESS.md)
* [Population Kurtosis](https://github.com/drexed/lite-statistics/blob/master/docs/descriptive/POPULATION_KURTOSIS.md)

## Monkey patches

Including monkey patches will give you `Enumerable` access to statistics.

```ruby
[1, 2, 3, 1].mode #=> 1
```

## Performance

This library is built for performance as all calculated value are memoized so that the can
be used in later calculations instead of being reran again.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-statistics. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Statistics project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-statistics/blob/master/CODE_OF_CONDUCT.md).
