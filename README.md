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
* [Statistics](#statistics)
* [Monkey-patches](#monkey-patches)

## Configurations

`rails g lite:statistics:install` will generate the following file:
`../config/initalizers/lite-statistics.rb`

```ruby
Lite::Statistics.configure do |config|
  config.monkey_patches = true
end
```

## Statistics

* [Mean](https://github.com/drexed/lite-ruby/blob/master/docs/MEAN.md)

## Monkey-patches

Including monkey patches will give you `Numeric` access to statistics.

```ruby
[1, 2, 3, 1].mode #=> 1
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-statistics. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Statistics project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-statistics/blob/master/CODE_OF_CONDUCT.md).
